class GameHelper {
  static String calculateGameYear(DateTime dateTime) {
    var gameDate = dateTime.difference(DateTime(2022, 5, 14)).inSeconds;
    var year = gameDate ~/ (12 * 60); // 一年12个月，一个月现实时间60秒
    return '九州历$year年';
  }

  /// 根据时间差的毫秒数生成ID,并发时不能保证唯一，需用其他算法生成id
  static int calculateId() {
    return DateTime.now().difference(DateTime(2022, 5, 14)).inMilliseconds;
  }
}
