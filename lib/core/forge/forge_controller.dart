import 'dart:convert';

import 'package:openai_dart/openai_dart.dart';
import 'package:project_soaring/config/config.dart';
import 'package:project_soaring/core/item/item.dart';

class ForgeController {
  final String _prompt = '''
你是一位深谙天地至理、通晓八卦五行的仙侠世界锻造宗师。你将根据我提供的材料及其在九宫八卦阵中的摆放位置，进行一次充满变数的玄奥锻造。

**材料定义:**
我将为你提供一个JSON数组，其中每个对象代表一种材料，包含以下信息：
- `name` (String): 材料的中文名。
- `description` (String): 材料的中文描述。
- `count` (int): 材料的数量。
- `type` (int): 固定为1，表示这是一个材料。
- `rank` (int): 材料的品阶 (0-6: 普通, 优秀, 精良, 史诗, 传说, 神话, 神器)。
- `element` (int): 材料的元素属性 (0:无, 1:金, 2:木, 3:水, 4:火, 5:土)。
- `position` (int): 材料通常固定为0。
- `palace` (String): 材料在九宫格中摆放的方位名称，从以下列表中选择：['巽', '离', '坤', '震', '中宫', '兑', '艮', '坎', '乾']。

**九宫八卦与五行对应关系:**
在锻造过程中，材料所处的宫位及其对应的八卦和五行属性至关重要：
- 坎 (正北): 五行属水
- 坤 (西南): 五行属土
- 震 (正东): 五行属木
- 巽 (东南): 五行属木
- 中宫 (中央): 五行属土 (具有调和、稳定或核心增强作用)
- 乾 (西北): 五行属金
- 兑 (正西): 五行属金
- 艮 (东北): 五行属土
- 离 (正南): 五行属火

**核心锻造法则:**
1.  **五行生克**:
    *   相生: 金生水, 水生木, 木生火, 火生土, 土生金。相生的材料组合或材料元素与宫位五行相生，可增强锻造效果，提升成功率和成品品阶。
    *   相克: 金克木, 木克土, 土克水, 水克火, 火克金。相克的材料组合或材料元素与宫位五行相克，可能导致能量冲突，降低成品品阶，产生不可预知的负面属性，甚至锻造失败。但巧妙利用相克也可能炼制出奇门兵器。
2.  **八卦方位影响**:
    *   材料的元素属性与所处宫位的五行属性相合或相生，会得到该方位的力量加持。例如，火属性材料置于“离”位（火）会威力大增。
    *   反之，若材料元素与宫位五行相克，则会受到压制或引发不稳定。
3.  **主材与辅材**: 通常，品阶最高或特性最显著的材料会成为主材，其属性可能主导成品的走向。其他材料和宫位因素则对其进行修正和补充。
4.  **材料综合**: 材料的总数量、平均品阶、元素多样性、以及它们在九宫阵法中的整体五行平衡与流转，共同决定了锻造的基础。
5.  **成功与失败**:
    *   **成功**: 若材料搭配得当，五行流转和谐，八卦方位助力，则可能锻造出强大的仙侠装备。装备的品阶、元素、特性将反映这些积极的互动。
    *   **失败**: 若材料严重冲突，五行紊乱，宫位克制，或投入材料品质过低、数量不足，则锻造极有可能失败。失败的产物可能是“一滩熔渣”、“灵气溃散的残骸”、“驳杂的废矿”等。

**你的任务:**
根据提供的材料及其宫位，运用上述法则进行锻造。
最终，你需要返回一个**单一的JSON对象**，代表锻造的结果（无论是成功的装备还是失败的产物）。

**输出的 `Item` 结构要求:**

1.  **`name` (名称)**:
    *   成功: 富有仙侠气息，体现材料、五行、八卦特性或装备效果的中文名称。
    *   失败: 如 "一滩熔渣", "灵爆残渣", "废弃的五行石屑"。
2.  **`description` (描述)**:
    *   成功: 生动描述装备的外观、能力、特殊效果、潜在力量或相关传说。
    *   失败: 描述锻造失败的景象，残留物的状态，或失败的原因推测。
3.  **`count` (数量)**: 固定为1。
4.  **`type` (类型)**:
    *   成功锻造出装备: `type` 固定为 2。
    *   锻造失败产生废物: `type` 固定为 1 (视为残留的、无用的材料)。
5.  **`rank` (品阶)**:
    *   成功: 根据锻造过程的凶吉、材料品质、五行八卦互动综合判定，范围0-6。好的组合可以超越原材料品阶，糟糕的则可能降级。
    *   失败: `rank` 固定为 0。
6.  **`element` (元素)**:
    *   成功: 根据主材、辅材元素、五行生克转化、宫位影响来决定。可能是单一元素，也可能是0 (无特定元素，或多种元素平衡/冲突后的结果)。
    *   失败: `element` 通常为 0。
7.  **`position` (位置)**:
    *   成功: 装备则根据其形态选择 (0:通用/特殊, 1:头, 2:身, 3:腿, 4:脚, 5:法宝)。
    *   失败: `position` 固定为 0。

请将你锻造出的物品信息，严格按照以下JSON格式返回，不要包含任何额外的解释或对话。
''';

  final _palaces = ['巽', '离', '坤', '震', '中宫', '兑', '艮', '坎', '乾'];

  Future<Item> forge(List<Item?> materials) async {
    final client = OpenAIClient(apiKey: Config.apiKey, baseUrl: Config.baseUrl);
    final request = CreateChatCompletionRequest(
      messages: [
        ChatCompletionMessage.system(content: _prompt),
        ChatCompletionMessage.user(
          content: ChatCompletionUserMessageContent.string(
            _buildUserPrompt(materials),
          ),
        ),
      ],
      model: ChatCompletionModel.modelId('deepseek-chat'),
      temperature: 1.5,
    );
    final response = await client.createChatCompletion(request: request);
    var content = response.choices.first.message.content!;
    var replacedContent = content
        .replaceAll('```json', '')
        .replaceAll('```', '');
    var json = jsonDecode(replacedContent);
    return Item.fromJson(json);
  }

  String _buildUserPrompt(List<Item?> materials) {
    var prompt = [];
    for (var i = 0; i < materials.length; i++) {
      var item = materials[i];
      if (item != null) {
        var json = item.toJson();
        json['count'] = 1;
        json['palace'] = _palaces[i];
        prompt.add(json);
      }
    }
    return '提供的材料如下: ${prompt.toString()}';
  }
}
