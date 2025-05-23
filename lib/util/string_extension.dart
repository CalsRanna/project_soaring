extension StringExtension on String {
  String format(List<dynamic> args) {
    var result = this;
    for (var arg in args) {
      result = result.replaceFirst('%s', arg.toString());
    }
    return result;
  }
}
