import 'package:driving_school_app/constants/colors.dart';
import 'package:flutter/material.dart';

class Rating extends StatelessWidget {
  final int value;
  final int MAX_RATING = 6;
  Rating(int value) : value = value;

  List<IconData> get rating {
    List<IconData> icons = [
      Icons.star_outline,
      Icons.star_outline,
      Icons.star_outline,
      Icons.star_outline,
      Icons.star_outline,
      Icons.star_outline
    ];
    for (var i = 0; i < value; i++) {
      icons[i] = Icons.star;
    }
    return icons;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: rating
          .map(
            (icon) => Icon(icon, color: AppColors.Dark, size: 16),
          )
          .toList(),
    );
  }
}
