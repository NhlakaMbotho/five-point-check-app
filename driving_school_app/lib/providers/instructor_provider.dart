import 'package:driving_school_app/models/instructor.dart';
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
      _instructors.add(new Instructor(_instructorNames[i], i));
    }
  }

  List<Instructor> getAll() => _instructors;
}
