import 'package:flutter/material.dart';

class Instructor {
  String name;
  Image image;
  Instructor(this.name, int index) {
    image = Image.asset("./images/${index + 1}.png");
  }
}
