import 'package:flutter/material.dart';

import '../constants/colors.dart';

class AppButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;
  final AppStyleTypes type;
  MaterialStateProperty<double> elevation = MaterialStateProperty.all(20);
  AppButton({
    required VoidCallback? onPressed,
    required Widget child,
    MaterialStateProperty<double>? elevation,
    AppStyleTypes type = AppStyleTypes.PRIMARY,
  })  : onPressed = onPressed,
        type = type,
        child = child {
    if (elevation != null) {
      this.elevation = elevation;
    }
  }

  get backgroundColor {
    switch (type) {
      case AppStyleTypes.PRIMARY:
        return AppColors.Primary;
      case AppStyleTypes.SECONDARY:
        return Colors.white;
      case AppStyleTypes.TERTIARY:
        return AppColors.Dark;
      default:
        return AppColors.Primary;
    }
  }

  get foregroundColor {
    switch (type) {
      case AppStyleTypes.SECONDARY:
        return AppColors.Primary;
      default:
        return Colors.white;
    }
  }

  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return ElevatedButton(
          onPressed: onPressed,
          style: ButtonStyle(
            minimumSize:
                MaterialStateProperty.all(Size(constraints.maxWidth, 50)),
            backgroundColor: MaterialStateProperty.all(backgroundColor),
            shadowColor:
                MaterialStateProperty.all(AppColors.Primary.withOpacity(.1)),
            foregroundColor: MaterialStateProperty.all(foregroundColor),
            elevation: elevation,
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
