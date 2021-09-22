import 'package:driving_school_app/models/instructor.dart';
import 'package:driving_school_app/models/lesson.dart';
import 'package:flutter/material.dart';

class InstructorProvider with ChangeNotifier {
  List<Instructor> _instructors = [];
  List<String> _instructorNames = [
    "John Mathews",
    "Thabo Gumede",
    "Nicole Nyaba",
    "Themba Shange",
    "David Mtungwa",
    "Mike Rogger",
    "Ruyan Smith"
  ];
  InstructorProvider() {
    for (var i = 0; i < _instructorNames.length; i++) {
      _instructors.add(new Instructor(_instructorNames[i], i, getLessons(i)));
    }
  }

  List<Lesson> getLessons(i) {
    List<List<Lesson>> lessonGroups = [
      [
        Lesson(DateTime(20201, 07, 30, 7), DateTime(20201, 07, 30, 8),
            'Jonathan Mathews'),
        Lesson(DateTime(20201, 07, 30, 8), DateTime(20201, 07, 30, 9),
            'Jonathan Mkhize'),
        Lesson(DateTime(20201, 07, 30, 12), DateTime(20201, 07, 30, 13),
            'Sabelo Moloi'),
      ],
      [
        Lesson(DateTime(20201, 07, 30, 11), DateTime(20201, 07, 30, 12),
            'Tony Smith'),
        Lesson(DateTime(20201, 07, 30, 12), DateTime(20201, 07, 30, 13),
            'Nothando Ndlovu'),
      ],
      [
        Lesson(DateTime(20201, 07, 30, 9), DateTime(20201, 07, 30, 11),
            'Bongani Gumede'),
        Lesson(DateTime(20201, 07, 30, 13), DateTime(20201, 07, 30, 14),
            'Qiniso Smelane'),
      ],
      [
        Lesson(DateTime(20201, 07, 30, 7), DateTime(20201, 07, 30, 7, 30),
            'Bongani Gumede'),
        Lesson(DateTime(20201, 07, 30, 11), DateTime(20201, 07, 30, 12),
            'Qiniso Smelane'),
      ],
      [],
      [],
      []
    ];

    return lessonGroups[i];
  }

  List<Instructor> getAll() => _instructors;
}
