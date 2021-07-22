import 'package:flutter/material.dart';

class TimeGuideLines extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        child: null,
        painter: GuidePainter(),
      ),
    );
  }
}

class GuidePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Color(0xFFF3F2F2);
    paint.strokeWidth = 10.0;
    var guideWidth = (size.width / 7);

    print('total width: ${size.width}');

    for (var i = 0; i < 7; i++) {
      var left = guideWidth * i;
      var top = size.height;
      var width = 10.0;
      var height = size.height;
      canvas.drawRect(Rect.fromLTWH(left, top, width, -height), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
