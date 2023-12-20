import 'package:isar/isar.dart';

part 'event.g.dart';

@collection
@Name('events')
class Event {
  Id id = Isar.autoIncrement;
  String content = '';
  int reward = 0;
}
