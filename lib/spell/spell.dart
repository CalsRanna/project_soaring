import 'dart:math';

import 'package:hive/hive.dart';

part 'spell.g.dart';

@HiveType(typeId: 1)
class Spell {
  Spell({
    required this.duration,
    required this.experience,
    required this.name,
    required this.rank,
  });

  Spell.random()
      : name = SpellNameGenerator.generate(),
        duration = Random().nextInt(10) + 1,
        rank = Random().nextInt(5),
        experience = Random().nextDouble() * 10;

  @HiveField(0)
  String name;
  @HiveField(1)
  int rank;
  @HiveField(2)
  int duration;
  @HiveField(3)
  double experience;

  double get efficiency => pow(rank + 1, 2) * experience / duration;

  double get offlineEfficiency => efficiency * 0.75;

  String get offlineEfficiencyString =>
      (offlineEfficiency * 60).toStringAsFixed(2);
}

class SpellNameGenerator {
  static List<String> first = [
    '雷音',
    '闇雷',
    '柔棉',
    '金丝',
    '天元',
    '月禅',
    '紫炎',
    '霹雳',
    '大衍',
    '兽王',
    '赤龙',
    '龙牙',
    '万里',
    '天海',
    '斩风',
    '慾天',
    '兽面',
    '武曲',
    '蛟龙',
    '御魔',
    '碧月',
    '横练',
    '却邪',
    '昭天',
    '云丝',
    '麾角',
    '蝉翼',
    '月卷',
    '豹爪',
    '龙捲',
    '血光',
    '上清',
    '黛雪',
    '初尘',
    '曜仙',
    '仁风',
    '缠心',
    '紫微',
    '银环',
    '霓霞',
    '青霜',
    '七煞',
    '白狼',
    '真武',
    '寂灭',
    '斜纹',
    '童子',
    '恩光',
    '斩情',
    '断肠',
    '离恨',
    '斩钢',
    '红锦',
    '尊胜',
    '真传',
    '飞豹',
    '方英',
    '达寂',
    '变幻',
    '噬魂',
    '紫岳',
    '绮罗',
    '御虚',
    '赤凤',
    '自在',
    '风魔',
    '绿灵',
    '软底',
    '紫羽',
    '银霜',
    '文昌',
    '醉吟',
    '翠虹',
    '神武',
    '无影',
    '听月',
    '极上',
  ];
  static List<String> second = [
    '扫霞',
    '幻波',
    '星象',
    '腾蛇',
    '红霞',
    '八石',
    '黄沙',
    '通神',
    '火网',
    '闇炎',
    '天浪',
    '银光',
    '蚀肉',
    '巨灵',
    '苍雷',
    '玄光',
    '摧心',
    '万丈',
    '玉女',
    '葬海',
    '无痕',
    '辟风',
    '神武',
    '虹彩',
    '灭世',
    '千叶',
    '武曲',
    '九鼎',
    '花鸟',
    '百花',
    '幽泉',
    '狼骨',
    '藏空',
    '子午',
    '情痴',
    '乌金',
    '硬骨',
    '天纹',
    '赤霞',
    '焚天',
    '绿灵',
    '青瑶',
    '银羽',
    '清风',
    '龙吟',
    '截脉',
    '旋锋',
    '勇力',
    '十绝',
    '碎尸',
    '凝尊',
    '丹霞',
    '咆哮',
    '冲霄',
    '梵天',
    '水镜',
    '东极',
    '化清',
    '锐铂',
    '凶虎',
    '承天',
    '碎肉',
    '傲世',
    '天狼',
    '圣火',
    '月洛',
    '天钺',
    '麒麟',
    '仁王',
    '索命',
    '飞仙',
    '承云',
    '孤星',
    '醉梦',
    '风霜',
    '圣龙',
  ];
  static List<String> third = [
    '霸',
    '丹',
    '毒',
    '蛊',
    '鬼',
    '幻',
    '剑',
    '禁',
    '雷',
    '灵',
    '魅',
    '秘',
    '冥',
    '奇',
    '神',
    '圣',
    '仙',
    '玄',
    '妖',
    '幽',
    '真',
  ];
  static List<String> fourth = [
    '本',
    '抄',
    '典',
    '法',
    '功',
    '经',
    '卷',
    '诀',
    '录',
    '谱',
    '书',
    '图',
    '阵图',
    '轴',
  ];

  static String generate() {
    return first[Random().nextInt(first.length)] +
        second[Random().nextInt(second.length)] +
        third[Random().nextInt(third.length)] +
        fourth[Random().nextInt(fourth.length)];
  }
}
