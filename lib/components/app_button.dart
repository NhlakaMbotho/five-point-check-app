import 'package:flutter/material.dart';

import '../constants/colors.dart';

class AppButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;
  final bool selected;
  AppButton({
    required VoidCallback? onPressed,
    required Widget child,
    bool selected = false,
  })  : onPressed = onPressed,
        selected = selected,
        child = child;

  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return ElevatedButton(
          onPressed: onPressed,
          style: ButtonStyle(
            minimumSize:
                MaterialStateProperty.all(Size(constraints.maxWidth, 50)),
            backgroundColor: MaterialStateProperty.all(
              selected ? AppColors.Primary : Colors.white,
            ),
            shadowColor:
                MaterialStateProperty.all(AppColors.Primary.withOpacity(.1)),
            foregroundColor: MaterialStateProperty.all(
              selected ? Colors.white : AppColors.Primary,
            ),
            elevation: selected ? MaterialStateProperty.all(20) : null,
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
                side: BorderSide.none,
              ),
            ),
          ),
          child: child,
        );
      },
    );
  }
}
