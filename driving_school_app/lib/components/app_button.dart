import 'package:flutter/material.dart';

import '../constants/colors.dart';

class AppButton extends StatelessWidget {
  VoidCallback? onPressed;
  Widget child;
  bool selected;
  AppButton({
    required VoidCallback? onPressed,
    required Widget child,
    bool selected = false,
  })  : onPressed = onPressed,
        selected = selected,
        child = child;

  Widget build(BuildContext context) {
    print('button parent width ${MediaQuery.of(context).size.width}');
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          selected ? AppColors.Primary : Colors.white,
        ),
        shadowColor:
            MaterialStateProperty.all(AppColors.Primary.withOpacity(.1)),
        foregroundColor: MaterialStateProperty.all(
          selected ? Colors.white : AppColors.Primary,
        ),
        elevation: MaterialStateProperty.all(20),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
            side: BorderSide.none,
          ),
        ),
      ),
      child: child,
    );
  }
}
