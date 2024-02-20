import 'package:flutter/material.dart';

class BalloonCard extends StatelessWidget {
  const BalloonCard({
    super.key,
    required this.child,
    required this.tailPos,
    this.tailLength = 0.2,
    this.conerRadius = 20.0,
    this.tailHalfWidth = 0.1,
    this.elevation = 5.0,
  });
  final Widget child;
  final double tailPos;
  final double tailLength;
  final double conerRadius;
  final double tailHalfWidth;
  final double elevation;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: BalloonPainter(
        context: context,
        tailPos: tailPos,
        tailLength: tailLength,
        conerRadius: conerRadius,
        tailHalfWidth: tailHalfWidth,
        elevation: elevation,
      ),
      child: Padding(
        padding: EdgeInsets.all(conerRadius / 3),
        child: child,
      ),
    );
  }
}

class BalloonPainter extends CustomPainter {
  BalloonPainter({
    required this.context,
    required this.tailPos,
    this.tailLength = 0.2,
    this.conerRadius = 20.0,
    this.tailHalfWidth = 0.1,
    this.elevation = 5.0,
  });
  final BuildContext context;
  final double tailPos;
  final double conerRadius;
  final double tailLength;
  final double tailHalfWidth;
  final double elevation;

  @override
  void paint(Canvas canvas, Size size) {
    final tailPosOnWidth = size.width * tailPos;
    final tailLengthOnHeight = size.height * tailLength;
    final tailHalfWidthOnWidth = size.width * tailHalfWidth;

    Offset endBottomLeft =
        Offset(conerRadius, size.height - tailLengthOnHeight);
    Offset startBottomLeft = Offset(tailPosOnWidth - tailHalfWidthOnWidth,
        size.height - tailLengthOnHeight);
    Offset endBottomRight = Offset(tailPosOnWidth + tailHalfWidthOnWidth,
        size.height - tailLengthOnHeight);
    Offset startBottomRight =
        Offset(size.width - conerRadius, size.height - tailLengthOnHeight);

    if (tailPosOnWidth - tailHalfWidthOnWidth < conerRadius) {
      endBottomLeft = startBottomLeft =
          Offset(tailPosOnWidth / 2, size.height * (1 - tailLength));
    } else if (tailPosOnWidth + tailHalfWidthOnWidth >
        size.width - conerRadius) {
      startBottomRight = endBottomRight = Offset(
          (size.width + tailPosOnWidth) / 2, size.height * (1 - tailLength));
    }

    // final path = Path()
    //   ..moveTo(0, conerRadius) // 左上 coner
    //   ..lineTo(0, size.height - tailLengthOnHeight - conerRadius)
    //   ..quadraticBezierTo(0, size.height - tailLengthOnHeight, endBottomLeft.dx,
    //       endBottomLeft.dy) // 左下 coner
    //   ..lineTo(startBottomLeft.dx, size.height - tailLengthOnHeight)
    //   ..quadraticBezierTo(tailPosOnWidth, size.height - tailLengthOnHeight,
    //       tailPosOnWidth, size.height) // tail left
    //   ..quadraticBezierTo(tailPosOnWidth, size.height - tailLengthOnHeight,
    //       endBottomRight.dx, endBottomRight.dy) // tail right
    //   ..lineTo(startBottomRight.dx, size.height - tailLengthOnHeight)
    //   ..quadraticBezierTo(
    //       size.width,
    //       size.height - tailLengthOnHeight,
    //       size.width,
    //       size.height - tailLengthOnHeight - conerRadius) // 右下 coner
    //   ..lineTo(size.width, conerRadius)
    //   ..quadraticBezierTo(size.width, 0, size.width - conerRadius, 0)
    //   ..lineTo(conerRadius, 0)
    //   ..quadraticBezierTo(0, 0, 0, conerRadius) // 左上 coner
    //   ..close();

    final path = Path()
      ..moveTo(0, conerRadius) // 左上 coner
      ..lineTo(0, size.height - tailLengthOnHeight - conerRadius)
      ..quadraticBezierTo(0, size.height - tailLengthOnHeight, endBottomLeft.dx,
          endBottomLeft.dy) // 左下 coner
      ..lineTo(startBottomLeft.dx, size.height - tailLengthOnHeight)
      ..lineTo(tailPosOnWidth, size.height) // tail left
      ..lineTo(endBottomRight.dx, endBottomRight.dy) // tail right
      ..lineTo(startBottomRight.dx, size.height - tailLengthOnHeight)
      ..quadraticBezierTo(
          size.width,
          size.height - tailLengthOnHeight,
          size.width,
          size.height - tailLengthOnHeight - conerRadius) // 右下 coner
      ..lineTo(size.width, conerRadius)
      ..quadraticBezierTo(size.width, 0, size.width - conerRadius, 0)
      ..lineTo(conerRadius, 0)
      ..quadraticBezierTo(0, 0, 0, conerRadius) // 左上 coner
      ..close();

    canvas.drawShadow(path, Theme.of(context).shadowColor, elevation, false);
    final paint = Paint()
      ..color = Theme.of(context).cardColor
      ..style = PaintingStyle.fill
      ..strokeJoin = StrokeJoin.round;
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
