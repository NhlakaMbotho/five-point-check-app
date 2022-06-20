import 'package:flutter/material.dart';

import '../constants/colors.dart';

class NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool selected;
  final void Function() handler;
  NavItem(IconData icon, String label, void Function() handler,
      {bool selected = false})
      : handler = handler,
        icon = icon,
        selected = selected,
        label = label;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: ((context, constraints) {
      return SizedBox(
        height: 80,
        width: 120,
        child: TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
                selected ? AppColors.Primary : Colors.white),
            foregroundColor: MaterialStateProperty.all(
                selected ? Colors.white : AppColors.Primary),
          ),
          onPressed: handler,
          child: Container(
            child: Row(
              children: [
                Icon(
                  icon,
                  size: 16,
                  // color: selected ? AppColors.Primary : Colors.white,
                ),
                SizedBox(width: 10),
                Text(
                  label,
                  style: TextStyle(
                    // color: selected ? AppColors.Primary : Colors.white,
                    fontSize: 13,
                    decoration: TextDecoration.none,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }));
  }
}
