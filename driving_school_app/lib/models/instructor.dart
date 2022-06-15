import 'package:flutter/material.dart';

import 'lesson.dart';

class Instructor {
  late String name;
  late Image image;
  late List<Lesson> lessons;
  Instructor(this.name, int index, List<Lesson> lessons) {
    image = Image.asset("./images/${index + 1}.png");
    this.lessons = lessons;
    this.lessons.sort(((a, b) => a.start.compareTo(b.start)));
  }
}
