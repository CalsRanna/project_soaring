abstract class SoaringText {
  static const traits = [
    '生命值', // 0
    '法力值', // 1
    '力量', // 2
    '体质', // 3
    '智力', // 4
    '精神', // 5
    '敏捷', // 6
    '速度', // 7
    '暴击', // 8
    '韧性', // 9
    '穿透', // 10
    '格挡', // 11
    '命中', // 12
    '闪避', // 13
    '攻击', // 14
    '防御', // 15
  ];
  static const itemTypes = [
    '装备', // 0
    '道具', // 1
  ];

  static const positions = [
    '头部', // 0
    '颈部', // 1
    '肩膀', // 2
    '背部', // 3
    '胸部', // 4
    '手腕', // 5
    '腰部', // 6
    '腿部', // 7
    '手指', // 8
    '饰品', // 9
    '主手', // 10
    '副手', // 11
  ];

  static const progresses = [
    '未接受', // 0
    '进行中', // 1
    '已完成', // 2
  ];

  static const items = [
    {"name": "九转金丹", "description": "由上古炼丹大师用九天雷霆之精华与天地间珍稀草木共炼而成，服用后内功大增。"},
    {"name": "夜明珠", "description": "深海异宝，能够在黑暗中发出璀璨光芒，长时间照射能增进修炼者的心境。"},
    {"name": "紫云木髓", "description": "产于极北寒林之紫云古木之核，含有木灵之气。"},
    {"name": "龙骨粉", "description": "龙骨研磨而成的粉末，常作为制丹仙术之辅料，以增丹药之效力，珍贵无比。"},
    {"name": "千年寒铁", "description": "在极寒之地沉积千年而成，坚硬无比且寒气逼人，是打造冷属性非凡武器的首选材料。"},
    {"name": "紫晶莲", "description": "生于寒潭，每千年开花一次，花瓣透出宝石般光泽，汲取此花精华能洗练经脉，提升灵力。"},
    {"name": "太极石", "description": "阴阳两极相融之奇石，含有太极之纹，可用于阵法布置，平衡天地之气。"},
    {"name": "五行珠", "description": "蕴含五行之力的五颗珠子，可相互转化与增幅，对五行术法有着极大的帮助。"},
    {"name": "幽冥鬼火", "description": "凝结自地府幽冥之地的冤魂怨气所化成的永不熄灭的绿色火焰，常用于阴煞法术和驱邪。"},
    {"name": "穿云箭簇", "description": "由仙羽凝聚太虚之风锻造的箭羽，能够穿透厚重云雾，仙家猎杀高飞异兽时常用之物。"},
    {"name": "幻影水晶", "description": "传说中能够映射出持有者心中幻象的神秘水晶，修士通过观察内心幻象来增进修为。"},
    {"name": "风行草", "description": "生长在高原之巅，叶片轻薄如翼，食之能使人身轻如燕，短时间内飞行遁速大增。"},
    {"name": "遁空符", "description": "符纸上绘制着复杂符咒，能一定时间内让使用者遁入空间裂隙中，躲避危险或偷偷摸摸。"},
    {"name": "地心火莲", "description": "生长在火山熔岩中的奇花，化灵火莲核为引，可炼制火类丹药，效果甚佳。"},
    {"name": "冰魄寒晶", "description": "千年冰川深处所凝结成的寒晶，气息摄人，若用之炼器，器中寒气足以冰封万物。"},
    {"name": "血玉髓", "description": "玉中带血，蕴含着强烈的生命力，常用以疗伤或者提炼血元丹，对肉身强者尤为有益。"},
    {"name": "云梦香", "description": "采集百年仙雾与灵花混合制成的香料，点燃后能使人进入幽梦，忘却凡尘俗事，修心养性。"},
    {"name": "星辰沙", "description": "来自于临近天界的沙石，闪耀着如星光般的微光，用于修复星辰大阵或占卜星象。"},
    {"name": "琼浆玉液", "description": "仙界佳酿，以天地灵果酿制，一滴便可醉一方仙人，其香醇味美，被誉为仙家至尊美酒。"},
    {"name": "梦魂香", "description": "传说中能沟通梦境与真实世界的神奇香料，点燃后可在梦境中修行，为修士找寻答案。"}
  ];

  static const equipments = [
    [
      {"name": "流云古帽", "description": "轻纱如云，流若飞絮。戴此帽者仿似入梦云端，踏风而行，拥有超凡脱俗之姿态。"},
      {"name": "紫金凤冠", "description": "金丝嵌宝，凤冠霞帔。戴此冠者宛若九天仙女，俨然世外高人，贵不可言。"},
      {"name": "寒铁战盔", "description": "凛冽寒铁，铸就不朽。此盔如战神附体，披之则战意冲霄，无敌于天下。"},
      {"name": "幽冥鬼面", "description": "此面出自地府，阴森诡异，能令敌人心生畏惧，背生寒气。"},
      {"name": "梦魇巾帼", "description": "织于女娲石中，据说能够让人通晓前世今生。佩戴之时，似入梦魇，破解万千幻象。"},
      {"name": "玄冥冠", "description": "暗含玄冥之气，此冠可与阴阳沟通，使穿戴者如游离于生死之间的幽灵。"},
      {"name": "白玉瑶琴", "description": "白玉雕琴，通体透亮。此琴不仅可弹奏出仙乐，更能保护主人，使攻击者心神俱摧。"},
      {"name": "碧水青冠", "description": "取自东海之碧水，俨如海神之冠。戴此冠者水运亨通，气贯长虹。"},
      {"name": "赤焰战帽", "description": "锻于赤炎山中，帽上火焰永不熄灭。戴上可振臂一呼，烈焰纵横，余烬铺天。"},
      {"name": "墨玉风巾", "description": "内蕴墨家机关之巧思，巾上文字如风，佩戴者脚步轻灵，不留半点痕迹。"},
      {"name": "灵犀金簪", "description": "传说为明教圣物，利如剑锋，可感知心灵。佩戴此物，能洞悉敌人所有弱点。"},
      {"name": "烈日紫盖", "description": "此盖能承载烈日，仿若日輪之下。天赋防御，披此者犹如不灭的太阳战神。"},
      {"name": "天隙云帽", "description": "细织霞光，含着天边之美。此帽仿如云端之作，戴上后身形若隐若现。"},
      {"name": "夜魔罩帽", "description": "蕴含夜行魔气，正邪难辨。佩戴此帽者，步伐如鬼魅，声息全无。"},
      {"name": "青藤绛帕", "description": "似从青藤中修得，藤蔓之间闪烁生命之光。戴上此帕者心思缜密，攻守皆宜。"},
      {"name": "素心汝冠", "description": "寒玉打磨，内藏清心诀。此冠戴者心思如镜，感悟武学倍增。"},
      {"name": "乾坤烂石盔", "description": "此盔中藏有乾坤之力，神秘无双。穿戴者可呼风唤雨，身若烂石中行。"},
      {"name": "流光绮罗帽", "description": "绮罗非常，金丝流光。此帽华美至极，一出必招惹群人注目。"},
      {"name": "破军星盔", "description": "据说锻制于破军星下，散发着不祥之光。其主战力强悍，无所畏惧。"},
      {"name": "锦绣软帽", "description": "锦绣软缎，手工细做。此帽轻盈利落，身法灵动者更是如鱼得水。"}
    ],
    [
      {"name": "乾坤玉佩", "description": "玉佩中蕴含宇宙之力，佩之者气运顺畅，有如天地合一，任运乾坤。"},
      {"name": "龙吟珠链", "description": "珠链中藏龙魂，轻吟则龙声四溢，震慑八方。挂于颈间，威风凛凛，不可逼视。"},
      {"name": "太虚幻影链", "description": "此链透明如虚空，佩戴之后身形如影，若有若无，让人捉摸不透。"},
      {"name": "辟邪玄铁锁", "description": "此锁锻造自玄铁，重可镇山河，轻如凌云鸟，可辟百邪，镇守心神。"},
      {"name": "紫电青璃珮", "description": "青璃中映电光，紫电绕颈，如有神助，其主行走江湖，雷霆手段，令敌胆寒。"},
      {"name": "涅槃火凤坠", "description": "火凤涅槃，浴火重生。此坠伴主人一生，化劫难为灵翼，凌驾群雄。"},
      {"name": "碧霄流云圈", "description": "流光溢彩，碧霄瑕不掩瑜，此圈悬于颈间，彷佛流云游碧霄，气度非凡。"},
      {"name": "夜行紫藤锁", "description": "藤蔓萦绕，暗夜难识。颈挂此锁，暗夜行走，无声无息，杀机暗藏。"},
      {"name": "七宝琉璃索", "description": "索中藏七宝之灵气，华光流转，目盲心清，助其主克敌制胜，洞悉奥秘。"},
      {"name": "风雪寒玉饰", "description": "此玉生于极北之地，寒冰雪花凝为一体。佩者如行风雪中，意志坚毅，不惧严寒。"},
      {"name": "星辰河汉带", "description": "蕴含河汉星辰之力，星光点点，夜戴此带，如星河在颈，宛若天选之子。"},
      {"name": "昆吾不灭环", "description": "传承自昆吾仙境，环中刻有永恒符文。佩戴此环者，刀枪不入，身如金刚。"},
      {"name": "云梦泽之纹", "description": "细腻如云梦泽之轻纱，佩着此纹，步履轻盈，随心所欲，行无阻碍。"},
      {"name": "雪域冰蚕丝", "description": "得自雪域冰蚕之蜕，所佩之人，身轻如燕，冰肌玉骨，清寒无双。"},
      {"name": "瀚海明珠链", "description": "珠如瀚海之涟漪，澄澈见底。此链环绕，心灵澄明，感悟武道，事半功倍。"},
      {"name": "紫竹铃铛颈环", "description": "环中吊挂紫竹铃铛，悠扬之音，能驱邪避咒，清心寡欲。"},
      {"name": "寒铁魂链", "description": "寒铁锻造，魔不能近。此链颈悬，内外兼修，将身心锻炼至极致。"},
      {"name": "霜月幻影珠", "description": "月色清凉，霜华如梦。此珠环抱颈间，如同夜色幻影，诡谲难测。"},
      {"name": "幽冥百鬼索", "description": "独藏幽冥百鬼之魅，挂于颈间，阴风四起，让人心生畏忌，难以靠近。"},
      {"name": "苍龙息珠串", "description": "传说为苍龙之息凝成珠串，吐纳间龙气环绕，威震八方。"}
    ],
    [
      {
        "name": "醉舞倚天肩",
        "description": "传说为一位孤高剑客所穿，每当夜幕降临，倚剑饮酒，舞姿宛若天外来仙，此肩当世无双。"
      },
      {
        "name": "天刹罗衫肩",
        "description": "锦缎上绣有九天罗刹图腾，佩戴此肩者仿若能御天下之邪，正邪两道皆对其忌惮三分。"
      },
      {"name": "紫霞幻影肩", "description": "掠过紫霞峰顶，烟霞仙女遗下的肩甲，轻如羽翼，蕴含着仙界的悠然之气。"},
      {
        "name": "苍穹游龙肩",
        "description": "云中神龙，春风得意，这对肩甲上刻有游龙戏珠图案，龙形腾踔，神威莫测，冠绝武林。"
      },
      {"name": "碧水寒霜肩", "description": "出自名家之手，碧泉水煮三日三夜，才得此肩，穿之身若轻烟，寒气逼人。"},
      {"name": "风云变幻肩", "description": "风云际会，江湖险恶。此肩随主之意，幻化无形，让穿戴者步步生莲，步步生风。"},
      {"name": "炎黄龙鳞肩", "description": "黄土之下，龙脉相连，此肩仿若龙鳞铸成，拥有黄帝之威，令人心生敬仰。"},
      {"name": "夜行衣影肩", "description": "江湖悬红，暗夜行走，此衣肩之轻薄，如影随形，夜行之人难寻踪迹。"},
      {"name": "笑傲江湖肩", "description": "恃剑之人，胸怀坦荡，此肩披之，令人豪情万丈，看尽世间繁华。"},
      {"name": "九州精铁肩", "description": "锻师耗费九牛之力，遍访九州，寻得精铁，此肩坚韧非凡，可护持江湖豪杰。"},
      {"name": "百战天罡肩", "description": "沙场点将，百战不殆。此肩甲以天罡星辰之力铸就，护佑着历经百战的猛将。"},
      {"name": "墨客行云肩", "description": "离群索居的墨客所饰，挥毫泼墨间，蕴含着行云流水之意，可令人心境开阔。"},
      {"name": "霓裳飘风肩", "description": "翩若惊鸿，婉若游龙，歌者轻装上阵，霓裳一舞，肩若流云，飘逸之至。"},
      {"name": "御风逐日肩", "description": "日月同辉，御风而行。此肩蕴含风行之力，佩之可逐日而飞，身若轻烟。"},
      {"name": "雪域冰皇肩", "description": "北境雪原，冰皇之地，为最强者专属。风雪交加之际，此肩似有生命，呼啸苍穹。"},
      {"name": "星宿海诗肩", "description": "夜覆星宿，海拥晨曦，此肩背负着古人的诗意，情怀悠远，使人忘却江湖之苦。"},
      {"name": "狂沙漠鬼肩", "description": "沙海无涯，一袭白袍鬼影频频，此肩质地坚硬无比，能跨沙漠而不畏狂沙万千。"},
      {"name": "云龙听风肩", "description": "听风者，云龙之外衣，当风起云涌之时，此肩显神通，飘忽若神龙。"},
      {
        "name": "铁血丹心肩",
        "description": "红颜未老英雄老，铁血丹心仍在胸。此肩代表着不屈的意志，每一战斗痕迹都是荣耀的印记。"
      },
      {"name": "玉虚仙影肩", "description": "玉虚宫中，仙影幢幢。佩戴此肩者，宛若凡尘中的仙子，拥有倾城之姿，战场之威。"}
    ],
    [
      {
        "name": "缥缈云龙披",
        "description": "此披风如轻烟缥缈，内蕴神龙之韵。着者可御风而行，步履若隐若现，间或龙啸震天，令敌人心惊胆战。"
      },
      {
        "name": "九天玄女纱",
        "description": "织于玄女仙机，九天之上取云絮，染以霞光。仙纱披身，飘若仙子下凡，踏雾御风，翩然若飞。"
      },
      {
        "name": "寒霜御血护肩",
        "description": "此肩甲外寒霜满布，触之即知冰冷切肤。然而穿戴其上，却能御敌血雨，保护肩头不染纤尘。"
      },
      {"name": "紫金凤翎斗篷", "description": "斗篷以紫金丝线绣凤翎，华丽之余不失威严，振翅时，似有凤凰涅槃，再展天姿。"},
      {
        "name": "逍遥游龙裳",
        "description": "游龙裳纹以逍遥二字为核心，缠绕龙形，衣动如龙游天际，置身其中，心也随之逍遥。"
      },
      {
        "name": "星辰河汉鹤氅",
        "description": "寓有河汉星辰之灵动，鹤氅轻盈若随风飘摇，星光闪烁，犹如夜空下闲云野鹤，淡然超脱。"
      },
      {
        "name": "离火朝阳旗袍",
        "description": "此旗袍以离火红绸制成，色彩艳丽如朝阳初升。穿之者宛如火凤凰般不凡，傲视千军。"
      },
      {
        "name": "碧落苍穹护身符",
        "description": "此符藏有苍穹之气，外观晶莹碧绿，细观之下，仿佛可见天宇轮回，佩戴者心胸坦荡，俨然苍穹之下唯我独尊。"
      },
      {
        "name": "流云逐月轻纱",
        "description": "轻纱若流云般飘渺，随风轻舞。其间月华流转，如梦似幻，使人恍若逐月而行于云端之上。"
      },
      {
        "name": "飞雪寒露袍",
        "description": "袍如飞雪覆盖，涤尘寒露，纯洁无瑕。随身动作，冷意袭人，却有令人心旷神怡之效。"
      },
      {"name": "紫电青霜锦", "description": "锦上绣以紫电青霜，似乎蕴含无穷威能。触之即感电光石火，霜冻千里。"},
      {
        "name": "灵犀望月领",
        "description": "领口镶嵌灵犀一角，精致剔透。令着者心境通明，俨然能与月亭亭交辉映，情意绵绵。"
      },
      {
        "name": "山海云韵披风",
        "description": "披风绘有山海纹理，如同古籍中山海经的神韵，一袭之下，恍若漫步云端，探古穷幽。"
      },
      {"name": "凌虚御风袄", "description": "此袄以轻羽绣边，穿之若无物，携风破空，凌虚而上，绝尘脱俗，意态飘逸。"},
      {
        "name": "玄武岩灵肩衣",
        "description": "肩衣硬如岩石，内藏玄武之灵，箍身而不累赘。着此衣，如坚城堡垒，不惧任何外力击打。"
      },
      {
        "name": "幽兰细雨衣",
        "description": "此衣如幽兰般素雅，细雨点点，沁入心脾。穿之者宛若行走于春意盎然之间，令人顿觉宁静致远。"
      },
      {
        "name": "焜煌日耀蟒袍",
        "description": "蟒袍以日为魂，焜煌辉耀，金线细密如火之焰，于日光下更显尊贵非凡，气若神灵。"
      },
      {
        "name": "苍穹之翼翎甲",
        "description": "翎甲宛若苍穹之翼，展开时势如千军万马。穿上此甲，天地间仿佛无所不至，敌无所遁形。"
      },
      {
        "name": "朔风断罡披肩",
        "description": "披肩以北境朔风入纬，云纹镶金，穿之可使罡气断绝，抵抗风沙，在战场中犹如定海神针。"
      },
      {
        "name": "百鬼夜行外褂",
        "description": "此外褂以暗纹锻造，夜穿行时，恍若百鬼夜行，幽魂环绕之中，古怪而神秘，令人不敢正视。"
      }
    ],
    [
      {
        "name": "云龙纹铠",
        "description": "铁甲间隐约流转着云龙之形，传说乃是昔年一位隐世高人于天际云端之上锻造，身披此铠者，步似神龙，气吞万里如虎。"
      },
      {
        "name": "幽冥鬼面衣",
        "description": "此衣布料阴寒异常，鬼面图腾栩栩如生，着者能游走于阳世与幽冥之间，阴阳师们的至宝，亦是刺客夜行的隐秘选择。"
      },
      {"name": "锦绣战袍", "description": "以七宝绣成，光彩夺目。身穿此战袍，犹如战场之王，锦绣中华，不惧矛枪。"},
      {
        "name": "白虎神铠",
        "description": "传说囚禁了一只上古白虎的灵魂，白银打造的铠甲，坚韧无比，能吸纳天地之灵气，增强穿戴者的力量。"
      },
      {
        "name": "青鸾凤羽袍",
        "description": "织有凤羽，缀以青丝，随风轻舞，穿之者似能凌空而舞，轻盈如青鸾，自有一番飘逸出尘。"
      },
      {
        "name": "玄武重铠",
        "description": "此铠厚重稳固，乃是道家镇派的至宝，穿着后宛如玄武附体，四方不动，堪称防御之极。"
      },
      {
        "name": "炎帝战甲",
        "description": "兴于炎帝，传承不息。周身烈火图案，宛若武者腾焰而起，每一战，必有炎帝之威，敌人望而生畏。"
      },
      {"name": "夜雀轻衣", "description": "黑如夜雀，轻如燕羽，穿此衣者在暗夜中如同鬼魅，潜行迅捷，掌控生死于一念之间。"},
      {
        "name": "霜寒云袖甲",
        "description": "此甲以寒霜之气浸制，云纹流动，外柔内刚，披之身可御极寒，纵身江湖，行走如云，悠然自得。"
      },
      {
        "name": "绛雪武装",
        "description": "雪中取火，火中取冰，炼成此装。赤如绛霞，凛似雪寒，着者如同行走的烈焰雪原，两种截然不同的力量在身上交织。"
      },
      {
        "name": "金丝楠木盔",
        "description": "此盔使用珍稀金丝楠木精心制作，天然防腐，阴魂不侵。佩戴它，如同古木根深蒂固，屹立江湖不摇晃。"
      },
      {
        "name": "翡翠踏浪衣",
        "description": "衣如碧海波涛，翠色流动间如同踏浪行舟，身着此衣，即使是在汹涌澎湃的武林风波中，也能得心应手。"
      },
      {"name": "琉璃火羽衣", "description": "羽衣透着温暖火光，琉璃般璀璨夺目，着者在夜空中飞行，如一颗流星划破长空。"},
      {
        "name": "墨玉魂甲",
        "description": "甲身酷似夜色中深邃的墨玉，传闻能封印灵魂，增强意志。穿戴者在武林中，步步生莲，心如止水。"
      },
      {
        "name": "紫电清霜袍",
        "description": "雷霆与冰霜的力量交汇于此，紫电闪烁，清霜覆盖，每一次挥动都有势坼寒空，身姿翩然，如同天外来客。"
      },
      {"name": "朱雀炽阳衣", "description": "此衣红若夏日朱雀，明灿烂如炽热的阳光，传说有着引动真火、照亮心灵的奇效。"},
      {
        "name": "青龙聚云袍",
        "description": "袍上绣有青龙于云海间遨游，祥云缭绕。装备此袍，如有青龙之吟，行走间风起云涌，气势非凡。"
      },
      {"name": "追风逐月衣", "description": "衣轻若无物，传说中的侠士追风逐月之所需，身披此衣，无坠星河，迅捷无匹。"},
      {"name": "天蚕丝铠", "description": "此铠以天蚕丝为材，白如霜雪，轻柔而坚硬，刀枪不入，如天蚕护体，举世罕有。"},
      {
        "name": "苍穹霸主铠",
        "description": "霸主御世，雄霸苍穹。此铠硕大无匹，上刻天象星辰，镌刻无数硬汉的意志与霸气。处乱世之中，身如苍穹，岿然不动。"
      }
    ],
    [
      {
        "name": "玉龙绕腕",
        "description":
            "此护腕用寒玉雕琢而成，透着淡淡的青光。佩戴之后，能感受到一股清凉之意，仿佛身置幽谷，细听玉龙咆哮，有益于修心养性。"
      },
      {
        "name": "腾蛟守腕",
        "description": "精钢打造的护腕，表面刻有蛟龙腾云之姿。穿戴者仿佛获得了龙蛟的灵气，身法飘渺如同云中之蛟，难以捉摸。"
      },
      {
        "name": "墨麒神腕",
        "description": "此护腕乌黑如墨，隐隐流动着神秘光泽。相传其内蕴含了麒麟之力，能大增穿戴者的气势，使其攻守皆强如神兽下凡。"
      },
      {
        "name": "紫金花腕",
        "description": "以紫金为骨，嵌以晶莹宝石，护腕之上布满繁复图腾。每一朵金花似乎都在诉说着一段古老的江湖往事，使人心生威严。"
      },
      {
        "name": "飞云锦腕",
        "description": "护腕用云锦裁制，轻而坚韧，绣有飞云纹样，如同云端穿梭之巧，赋予穿戴者风般的速度与游走江湖的闲逸。"
      },
      {
        "name": "霜穹幻腕",
        "description": "锻造此护腕的匠人曾梦游北境，见到漫天雪霜，于是便以寒铁所铸，云纹上凝聚着霜雪之精华，似能在招式间召唤寒霜之气。"
      },
      {
        "name": "炎阳煅腕",
        "description": "此腕套内蕴藏着火山之力，火红如夕阳，佩之可令人热血沸腾，斗志昂扬，就如同中原武林高手过招，招招火热。"
      },
      {
        "name": "瑶光流腕",
        "description": "流光溢彩的护腕，它仿佛囊括了瑶池之灵光，提升了穿戴者的内力修为，使得武功在无形间更进一步。"
      },
      {
        "name": "逐风者之腕",
        "description": "布制护腕轻若无物，有疾风之称。常有游侠佩之，行走江湖，步伐如风，剑光如电，是追逐自由之人的最好伴侣。"
      },
      {
        "name": "碧波灵腕",
        "description": "碧玉打造的护腕，清澈见底，佩戴此物，如同在江湖中独行一条清流，练达内外兼修之道。"
      },
      {
        "name": "九曲黄河束",
        "description": "以天下英雄为师，此护腕铸似黄河九曲，浩浩荡荡，承载着一股威势，让人在拳脚间感受到天地的雄浑。"
      },
      {
        "name": "断岳封腕",
        "description": "此腕套重如断岳，铸于深山古炉，数次淬炼方成。穿戴者挥手可感山崩地裂之力，厚重稳固，威力无穷。"
      },
      {
        "name": "千影织腕",
        "description": "细丝密织的护腕，如影随形，招式繁复至极，使敌人眼花缭乱，心生迷惘，宛如面对千军万马独步江湖。"
      },
      {
        "name": "星河流转腕",
        "description": "银河流转，星辰陨落。这护腕汲取星辰之力，闪耀星光，佩戴它的人，招式皆带有星河之阔大，变化无穷。"
      },
      {
        "name": "苍龙护臂",
        "description": "传说中的遗物，外形若苍龙腾飞，蕴含着龙之神韵，佩戴它的武者，会如苍龙出海，势不可挡。"
      },
      {
        "name": "青鸾璎珞",
        "description": "神鸟青鸾为灵，结以璎珞珠链，护腕间带有飞鸾跃凤之姿，每一次舞动都似天上仙乐，令人心旷神怡。"
      },
      {
        "name": "流火红莲腕",
        "description": "全腕通体绯红，火炼流金铸成红莲之形，盛开在武者的手腕。使出招来，火花四溅，如同浴火重生，威力大增。"
      },
      {
        "name": "夜叉鬼手镯",
        "description": "乌黑如夜的护腕，仿佛夜叉藏匿其中。穿戴此物，出手如鬼魅，诡秘莫测，使人不禁想起那些行走在阴暗角落的江湖人。"
      },
      {
        "name": "望月寒光环",
        "description": "此项护腕像是皓月之光凝结形成，银白闪烁，给人以宁静之感。然而一旦战斗，其寒光若利箭，直射敌心。"
      },
      {
        "name": "百炼魔狱扣",
        "description": "锻造此腕套的材料，皆出自魔界，百次淬炼，烈焰难熔。它能使武者释放出凶猛的内力，宛如魔鬼降世。"
      }
    ],
    [
      {
        "name": "琅环玉带",
        "description": "此带如玉，温润典雅，乃是昔年一位名动江湖的侠女佩戴之物，带中隐含轻功秘诀，佩戴此带者如风行水面，踏雪无痕。"
      },
      {
        "name": "乾坤紫金束",
        "description":
            "金光闪烁之中隐含乾坤之力，设有机关，轻转之间，可收放自如，威力不下于一柄利剑。装备之后，使人气势倍增，有摄魄凌人之威。"
      },
      {
        "name": "云锦飞龙累",
        "description": "飞龙在天，云锦万千，此带上绣有云海中逐日飞龙，穿戴之人仿佛拥有遨游九天的勇气和力量，受到江湖中赞誉。"
      },
      {
        "name": "梦绕青丝结",
        "description": "如梦如幻，青丝缠绕。佩此腰带，步履轻盈，犹如入梦境中，令人不觉身在何方。适合善于暗器与身法之人。"
      },
      {
        "name": "翠辉凤凰缠",
        "description": "凤凰清鸣，展翅欲飞。此腰带镶嵌翠绿宝石，光华璀璨，似凤凰振翅，赋予佩戴者非凡的气质与稳重之心。"
      },
      {
        "name": "隐龙暗牢扣",
        "description": "隐龙蛰伏，雷动九天。暗牢扣上刻有龙图，能藏锋匿迹，佩此腰带者步法神秘，如龙游深渊，让人捉摸不透。"
      },
      {
        "name": "怒海潮生带",
        "description": "海浪滔天，怒潮汹涌。佩此腰带，其人似有澎湃潮水之力，内力如海之深不可测，可使得武功大增。"
      },
      {
        "name": "狂沙漠影环",
        "description": "沙漠之中，幻影千千。腰带轻灵如风，佩之者行走于战场如同沙中影，让敌人难以捉摸其踪迹。"
      },
      {
        "name": "织霜寒铁锁",
        "description": "此带如霜，素雅而冷峻。内藏刚烈寒铁，锁链坚固。能令人心绪清明，持之可增强外功防御，抵御重创。"
      },
      {
        "name": "枫岚影绦带",
        "description": "枫叶摇曳，幻化无数岚影。腰带轻柔，内含风行之术，使人身形飘忽，如同秋风中的枫叶一般不可捉摸。"
      },
      {
        "name": "金蟾吞月带",
        "description": "此带犹如金蟾吞食了皎洁明月，丝间透出银光。佩戴此物，能在夜间游走如同幽灵，御气如蟾，悄无声息。"
      },
      {
        "name": "紫电清霜绳",
        "description": "腰带如电，其上布满紫纹，如同寒霜覆盖。佩戴之后，身法快如闪电，剑法亦如霜冷无情，使敌手防不胜防。"
      },
      {
        "name": "墨藤碧玉圈",
        "description": "腰带用墨色藤蔓编织，碧玉作为扣环，透出一股清冷之气。扣之若紧，能助修行内功，潜心钻研武艺。"
      },
      {
        "name": "霜语星辰带",
        "description": "它由寒铁与罕见的星辰碎片锻造而成，夜间佩戴，仿佛星辰之声低语耳旁，令人心神宁静，提升内力运转的效率。"
      },
      {
        "name": "紫焰流云佩",
        "description": "此带上流光溢彩，仿佛云流一般，辅以淡淡紫焰，行走间如云烟袅袅，令人目眩神迷，增添数分神秘之态。"
      },
      {
        "name": "血煞鬼面带",
        "description":
            "鬼面狰狞，血色斑斓。传说此带曾为一位邪派高手所用，内蕴血气之煞，佩之者战力惊人，但需心性坚定，否则易受内魔侵蚀。"
      },
      {
        "name": "夜行僧踪带",
        "description": "此带简朴无华，却在黄昏后散发淡淡光晕，正如梦中方丈一步跨千山，给予佩戴者深不可测之身法。"
      },
      {
        "name": "天罡北斗绶",
        "description":
            "此带内嵌众星，布局如北斗七星，夜夜闪烁，代表着武学至高无上的成就。佩戴者朝夕得见天罡之象，对抗诸多挑战有如神助。"
      },
      {
        "name": "碧海潮声束",
        "description": "取自深海之中珍稀海绵与珊瑚编织而成，佩之如听海之潮，有助于静心修炼，强健体魄，修行之人常常佩戴。"
      },
      {"name": "白虎绞金带", "description": "白虎为武者之魂，此带不仅加固身防，更能震慑邪魔外道。"}
    ],
    [
      {"name": "青龙偃月膝", "description": "这护腿上刻有一条盘旋的青龙，伴随着风云变幻，保护着武者不受丝毫侵犯。"},
      {"name": "玄武磐石腿", "description": "沉着坚毅如同北方神兽玄武，这护腿如同磐石般沉重稳固。"},
      {"name": "朱雀翎羽裤", "description": "传说穿上它便能感受到朱雀的高贵与神速，气宇轩昂，武艺更进一层。"},
      {"name": "白虎战靴", "description": "此靴轻盈异常，上面刻着古老而神秘的白虎图腾。"},
      {"name": "紫微护法裆", "description": "星辰流转的紫色丝线穿插其间，受到紫微星官的庇护，在攻守转换间更显游刃有余。"},
      {"name": "昊天云行裤", "description": "昊天之力溢于其上，赋予穿着者得天独厚的灵动与自由。"},
      {"name": "九州步霜靴", "description": "靴底踩过之处，寒霜生，踏步间无声息，又冷若冰霜，令敌手心生畏惧。"},
      {"name": "太虚幻影袜", "description": "轻如鸿毛，若隐若现，穿上此袜如入无人之境，步履高深莫测，敌人徒呼奈何。"},
      {"name": "八荒征尘裤", "description": "此裤子布满了岁月的痕迹，见证了无数激战。"},
      {"name": "风雪连云靴", "description": "白色如雪，流利如风。穿戴者如同风雪连云，若存若亡。"},
      {"name": "黄泉路绝袍", "description": "此袍上绣有奇幻的图案，如同引领至阴间的黄泉。"},
      {"name": "苍穹雷动腿", "description": "所步之地，雷鸣万千。"},
      {"name": "八方风云膝", "description": "传说穿上之后能舞动风云，呼风唤雨，在浮华世界中游刃有余。"},
      {"name": "行云流水靴", "description": "此靴轻盈若水云流转，步履生风，穿之者宛如身处云端，如梦如幻，翩然物外。"},
      {"name": "五行缚魔裤", "description": "集五行之力于一身，这护腿蕴含了金木水火土的力量，缚住一切邪魔。"},
      {"name": "凌霄宝雪靴", "description": "如凌霄之宝雪，这靴子纯白无垢，轻若无物，踏雪无痕。"},
      {"name": "龙腾虎跃裤", "description": "踏声似龙吟虎啸，穿着此护腿便有龙之飞翔与虎之矫健，于无垠武林中驰骋无敌。"},
      {"name": "天神下凡腿", "description": "银光闪烁，神圣不可侵犯，穿上这护腿如同天神降世，无所畏惧，横扫八方敌。"},
      {"name": "无双绝尘靴", "description": "此靴尽显英雄本色，步伐间不染尘埃，自有一股不凡气度，让人望而生畏。"},
      {"name": "碧落黄泉裆", "description": "至阳至刚，稳如磐石，宛若黄泉之下的修罗，迈步不惧生死。"}
    ],
    [
      {"name": "琉璃云梦环", "description": "此环彷如琉璃仙境之物，佩戴于指，恍若步入了幽深的云梦泽，身处仙雾缭绕之中。"},
      {"name": "溪影寒光戒", "description": "银戒如溪水映影，透出丝丝寒气。"},
      {"name": "玄武绛血指", "description": "此戒由玄武献血精铸，戴之如身临古战场，寒光闪闪，犹能听见金戈铁马之声长鸣。"},
      {"name": "青丘狐媚戒", "description": "传说此戒为青丘狐仙所制，戒身隐隐流转不定，犹如狐仙般妩媚动人，心生迷离。"},
      {"name": "墨客风流戒", "description": "此戒似有翩翩佳士风度，佩之指上，令人文思泉涌，墨香沁心。"},
      {"name": "紫电青霜指", "description": "紫电青霜，天地奇观，此戒似乎藏有天地间最磅礴的力量，无人可挡。"},
      {"name": "幻魂罗刹戒", "description": "幻魂罗刹，异族之物，此戒上刻有诡秘符文，似能通灵异世，令神魂颠倒。"},
      {"name": "龙泉碧玉指", "description": "出自龙泉古刹的圣物，此戒通体碧玉，内藏佛音梵唱，可使人心灵净化。"},
      {"name": "鸿蒙天罡戒", "description": "施展此戒，可感鸿蒙初辟之力，天罡北斗之威，使人如坐云端，掌握乾坤。"},
      {"name": "烈焰焚心指", "description": "火光映照之中，此戒似能焚尽一切，烈焰红深似血，可焚心中一切杂念。"},
      {"name": "夜叉涎月环", "description": "此环伴随月色之光华，宛如夜叉游走于月下，寂静而神秘，蕴含着不为人知的力量。"},
      {"name": "碧落黄泉指", "description": "不沾尘世半点烟火，碧落之名，黄泉为证，此戒见证生死契约，哀婉如同未了情缘。"},
      {"name": "剑啸乾坤戒", "description": "戴此戒者如同剑宗高人，一啸乾坤变色，剑意盎然，威压群雄。"},
      {"name": "白虹贯日指", "description": "白光耀世，如虹贯日，此戒隐含天地至刚之势，气冲霄汉，威力无边。"},
      {"name": "听风忆旧环", "description": "听风之下，似在追寻旧人旧梦，此环唤醒过往记忆，唤起一段江湖旧事。"},
      {"name": "九转连环指", "description": "九转之力，闭环相扣，此戒刻有奇异阵法，可解天地之秘，连环九转，威不可挡。"},
      {"name": "如意金刚圈", "description": "金刚之力，坚不可摧，此环如意随行，使人步步如意，无往不胜。"},
      {"name": "岁月流光戒", "description": "岁月悠悠，流光易逝，此戒能凝住一缕光阴，让人感受到时间的温柔。"},
      {"name": "星辰落影环", "description": "群星闪烁，影落人间，此环似将浩瀚星河封存，戴之指上，可令人心怀天地。"},
      {"name": "离火吟风戒", "description": "离火炽热，吟风扶摇，此戒羁绊着一段古老的传说，诉说着情仇与江湖，不灭如烈焰。"}
    ],
    [
      {"name": "素锦瑶环", "description": "环内镶嵌碧玉，隐隐透出淡淡光泽，淡泊明志，闲云野鹤。"},
      {"name": "墨玉龙吟坠", "description": "黑玉雕刻成龙形，肌理栩栩如生，佩上身隐约传来龙吟之声。"},
      {"name": "紫云流霞带", "description": "紫色丝线，流霞轻绕，佩戴之人仪态万千，走之江湖中，各色事情纷至沓来。"},
      {"name": "碧波涟漪链", "description": "链上波纹层层叠叠，仿佛将人带入水波不兴的幽静湖泊，凝思江湖，洗涤尘俗。"},
      {"name": "飞凤翠玉簪", "description": "簪上雕刻画着凤凰在云间游走，佩戴此簪的女子，振翅高飞，不俗不凡。"},
      {"name": "七星织霜钗", "description": "钗上镶满七颗宝石，似琉璃星辰，夜行江湖，别有一番光华。"},
      {"name": "冰魄寒星腕", "description": "此腕饰透明凝碧，冰凉入骨，佩戴之后仿若心性冰清，剑走偏锋。"},
      {"name": "幽兰空谷镯", "description": "此镯如空谷中之幽兰，其香远溢，自有一番清绝高洁之姿，与世无争。"},
      {"name": "紫电青霜珠", "description": "珠光闪烁如紫电交织，凛然不可方物，执之可感受到江湖中刀光剑影之劲。"},
      {"name": "浮云游子环", "description": "环上云纹缥缈，似漂泊不定之飘渺云烟，佩之使人如游子回家，心随云散。"},
      {"name": "玉龙雪山鬓", "description": "鬓饰宛若雪上之玉龙，昂首呼啸，彰显出江湖中的豪迈与不羁。"},
      {"name": "九转灵芝钏", "description": "钏上灵芝盘绕，九转融和，佩戴者似能感悟生生不息的造化之道。"},
      {"name": "影月幽灵环", "description": "幽灵环如影随形，清辉如月，浸润心扉，遗世独立。"},
      {"name": "天罡北斗带", "description": "铭刻着北斗七星的腰带，指引着行者江湖中的方向与远志。"},
      {"name": "云海苍穹锦", "description": "锦上绘有云海与苍穹，令人心旷神怡，沉浸在广袤无垠的世界之中。"},
      {"name": "夜凉如水镜", "description": "此镜清冷透明，似可照见人心，洞察江湖中的真情假意。"},
      {"name": "炫影霜龙佩", "description": "霜龙在佩上盘旋，凌厉的炫影随动作流转，如同江湖中那些出手如电的侠客。"},
      {"name": "紫竹铃音纽", "description": "此纽镂空竹影，风吹过时铃音清脆，宛若身在竹林之深，听懂了那苍茫江湖的心跳。"},
      {"name": "凌霄宝雪帽", "description": "帽饰纯白如雪，轻盈若凌霄之花，佩上头顶，目光所及，江湖路，任意行。"},
      {"name": "尘寰遗玉冠", "description": "此冠玉质温润，仿佛承载着历代侠客的壮志与梦想，赋予佩戴者权倾天下的气度。"}
    ],
    [
      {"name": "铁质短剑"},
      {"name": "青铜长枪"},
      {"name": "硬木弓"},
      {"name": "粗糙铁刀"},
      {"name": "竹节鞭"},
      {"name": "石质锤"},
      {"name": "鹿角匕首"},
      {"name": "铁环锏"},
      {"name": "简易钢斧"},
      {"name": "木柄短锤"},
      {"name": "竹制长剑"},
      {"name": "牛皮护手刀"},
      {"name": "草绳连枷"},
      {"name": "石头砸锤"},
      {"name": "旧铁箭"},
      {"name": "钝钢钩"},
      {"name": "藤条编织鞭"},
      {"name": "磨损的长剑"},
      {"name": "损坏的青铜刀"},
      {"name": "生锈钢锤"},
      {"name": "幽篁古剑", "description": "剑锋如幽篁般回旋，传闻曾有高人施展剑法，令天下猛将无不俯首。"},
      {"name": "凌霄白羽扇", "description": "羽扇轻挥，天风凌霄，扇中藏机，一扇倾城，一扇倾国。"},
      {"name": "青璇玑琴", "description": "一曲琴音，青璇玑意，能使听者忘却江湖恩怨。"},
      {"name": "绫罗紫电鞭", "description": "鞭动紫电，犹如缚龙之链，绫罗间锋芒暗藏。"},
      {"name": "归隐林中剑", "description": "传说中的隐士之剑，削铁如泥，斩断世俗纷扰。"},
      {"name": "墨骨鬼面杖", "description": "古杖鬼面，藏之深林，夜半哭泣，令人心悸。"},
      {"name": "七宝琉璃珠", "description": "珠中藏世间七宝，每一颗皆有神奇，相传为瑛姑之泪化成。"},
      {"name": "寂灭长枪", "description": "一枪出，寂灭四方，曾在华山之巅决胜败。"},
      {"name": "苍穹钩镰刀", "description": "钩刃若苍穹之弯月，挥洒间裂天裂地。"},
      {"name": "月泉吟剑", "description": "月色泉韵，剑吟惊鸿，一出鞘，天下皆寂。"},
      {"name": "碧落黄泉匕", "description": "一匕起，碧落黄泉，两重天，生死由之。"},
      {"name": "宿云穿石弓", "description": "此弓力透宿云，箭破石穿，箭在弦上，别有洞天。"},
      {"name": "倚天长剑", "description": "此剑倚天而立，慕容博手中之物，挥之可断金断玉。"},
      {"name": "云龙纹鞭", "description": "云中飞龙，鞭法未显先有龙吟，击则电闪雷鸣。"},
      {"name": "落星流火锏", "description": "锏挥落星流火，一击之下，星星之火可以燎原。"},
      {"name": "断水双刃", "description": "双刃交错，水流分断，斩出的每一剑都重如泰山。"},
      {"name": "翠竹秘笈枪", "description": "枪尖藏着江湖秘笈，一窥便知武林绝学。"},
      {"name": "青莲画戟", "description": "戟似莲花出泥而不染，一举一动间将风华绝代显露无遗。"},
      {"name": "星辰碎影锤", "description": "锤走星辰之势，碎影满天，所过之处，恍如梦境。"},
      {"name": "云鹤归宗剑", "description": "剑名鹤归，轻挥间云开雾散，直指江湖真意。"},
      {"name": "灼日焚心斧", "description": "斧劈灼日，焚心之火，一斧落下，赤焰万丈。"},
      {"name": "紫电青霜匕", "description": "紫电掣天，青霜覆地，匕首一出，乾坤变色。"},
      {"name": "天罗地网刃", "description": "刃走阴阳，天网恢恢，罗织江湖，天地之间，无所遁形。"},
      {"name": "飞燕回翔剑", "description": "剑如燕舞，翩翩回翔，一剑挥出，恍若回到了那燕子塔前的花雨之中。"},
      {"name": "九转龙吟枪", "description": "龙吟九转，霸气环绕，天地同声，武林共鸣。"},
      {"name": "玉石琵琶鞭", "description": "柔鞭在手，如同琵琶弹奏一般，却能弹断黄沙百战穿金甲。"},
      {"name": "幻影流光剑", "description": "剑挥幻影，光走流年，剑下看似平淡无奇，实则剑光如水，流年似梦。"},
      {"name": "凤舞九天锏", "description": "锏动凤舞，九天震荡，每一击都有朱雀扶摇而上九千里之势。"},
      {"name": "寂月琴心剑", "description": "剑心似古琴，弹奏寂寞月夜，剑意哀而不伤，切断情丝却不沾红尘。"},
      {"name": "潜龙勿用刀", "description": "刀藏潜龙，舍我其谁，一出鞘似龙游浅滩，威不可当。"},
      {"name": "霜雪明珠索", "description": "索如霜雪，掌中藏珠，一环接一环，攻守之间，冷若冰霜。"},
      {"name": "魑魅影子剑", "description": "剑行诡谲如魅影，实则锋锐无匹，黑暗之中最是致命。"},
      {"name": "风华绝世扇", "description": "一扇若起，风华绝世，风生水起，敌不知我何以攻之。"},
      {"name": "苍穹霸道斧", "description": "手持斧，劈开苍穹，霸道无匹，一斧下去，天地皆惊。"},
      {"name": "天枢北斗剑", "description": "北斗七星，天枢一线，剑指星辰，汇聚天地之精华。"},
      {"name": "霜冥夜叉钩", "description": "钩锋似夜叉张牙舞爪，一挥冥冽霜寒直透人心。"},
      {"name": "紫金破邪剑", "description": "紫金流光，一剑舞出，千邪万恶尽归尘土。"},
      {"name": "梦断残云斧", "description": "斧劈斩之间，如同梦断云消，含愁似醉，斩断山河。"},
      {"name": "碧泉蛟龙枪", "description": "枪法如蛟龙出水，波光粼粼之下暗藏杀机。"},
      {"name": "墨韵流云锤", "description": "此锤挥舞，墨色如云，流转间天地色变，江湖笔墨皆由此出。"},
      {"name": "浮生若梦剑", "description": "剑如梦幻，绘卷江湖，一念浮生，顿悟剑心。"},
      {"name": "碧影寒光匕", "description": "踏雪无痕，一匕寒光闪过，众生影满碧落，而后寂静无声。"},
      {"name": "陨星流火錾", "description": "錾锤坠星流火，翻滚间震碎虚空，江湖中人敬畏不已。"},
      {"name": "断岳劲风扇", "description": "扇倾力劈断山岳，风卷残云，神怒天翔，尽在掌控之间。"},
      {"name": "惊鸿剑", "description": "一剑出鞘，惊鸿一瞥，人已陨，剑意绵长未已。"},
      {"name": "鹿鸣惊林刀", "description": "刀锋霜冷，鹿鸣林中，一刀斩出，林木皆惊，猛兽悚然。"},
      {"name": "金翅破云锏", "description": "此锏金翅展翅，破云裂日，锏落之处，力撼乾坤。"},
      {"name": "玄冥鬼影钩", "description": "阴风怒号中，此钩若隐若现，鬼影幢幢，令敌胆寒。"},
      {"name": "幽兰空谷剑", "description": "剑气如幽兰自空谷走来，芳香自有凛冽之势，直接刺骨。"},
      {"name": "血河断魂斧", "description": "血河滔滔，斧起断魂，饮敌人血，斧影铸血河。"},
      {"name": "玉琼冰魄弓", "description": "弓如冰山玉树，箭走寒星，一弓一箭泣鬼神。"},
      {"name": "苍穹雷动锤", "description": "雷霆万钧，苍穹震怒，锤落天崩地裂，谁与争锋？"},
      {"name": "千影百反剑", "description": "剑光幻化千影，百态各异，敌人在迷惑中灰飞烟灭。"},
      {"name": "白虹贯日弓", "description": "弓弦响彻云霄，箭如白虹，射日之势无物不穿。"},
      {"name": "流云断岳刀", "description": "此刀若隐若现，如流云穿越，划过天际，山岳为之崩裂。"}
    ]
  ];
}
