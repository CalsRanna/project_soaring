import 'dart:math';

class GameEvent {
  GameEvent({
    required this.description,
    required this.experienceReward,
    required this.lifetimeReward,
    required this.magicStoneReward,
    required this.probability,
  });

  GameEvent.random()
      : probability = Random().nextDouble() * 100,
        description = '随机事件',
        experienceReward =
            Random().nextDouble() * 1024 * (Random().nextBool() ? 1 : -1),
        lifetimeReward = Random().nextInt(10) * (Random().nextBool() ? 1 : -1),
        magicStoneReward =
            Random().nextInt(1024) * (Random().nextBool() ? 1 : -1);

  String description;
  double experienceReward;
  int lifetimeReward;
  int magicStoneReward;
  double probability;

  String _status(int reward) {
    return reward > 0 ? '增加' : '减少';
  }

  @override
  String toString() {
    var experience = experienceReward.abs().floor();
    var magicStone = magicStoneReward.abs();

    return '$description, 修为${_status(experienceReward.floor())}了$experience, 灵石${_status(magicStoneReward)}了$magicStone。';
  }
}
