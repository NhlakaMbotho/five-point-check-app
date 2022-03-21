import '../constants/colors.dart';

class Lesson {
  DateTime start;
  DateTime endTime;
  String name;
  Lesson(this.start, this.endTime, String clientName) {
    this.name = clientName;
  }

  LessonStatus getStatus() {
    return start.hour < 12 ? LessonStatus.COMPLETED : LessonStatus.PLANNED;
  }
}
