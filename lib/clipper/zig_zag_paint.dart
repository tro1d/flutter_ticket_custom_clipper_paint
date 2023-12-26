// Custom Painter untuk membuat efek bergerigi
import 'dart:math';

import 'package:flutter/material.dart';

class ZigZagPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double zigzagWidth = 20; // Lebar setiap zig atau zag
    double halfZigZagWidth = zigzagWidth / 2;
    double height = size.height;
    double width = size.width;

    Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill
      ..shader = const LinearGradient(
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
        colors: [Color(0xFFF0F0F0), Colors.white], // Warna gradient
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    Paint paintStroke = Paint()
      ..color = Colors.black.withOpacity(0.2)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 4);

    Path path = Path();

    // Mulai di titik kiri atas
    path.moveTo(0, 0);

    // Garis lurus ke kiri bawah
    path.lineTo(0, height);

    // Garis bergerigi ke kanan bawah menggunakan quadraticBezierTo
    for (double i = 0; i < width; i += zigzagWidth) {
      final startConic = Offset(i + halfZigZagWidth, height - halfZigZagWidth);
      final endConic = Offset(i + zigzagWidth, height);
      path.lineTo(startConic.dx - (Random().nextInt(3) + 5), endConic.dy);
      path.conicTo(
        startConic.dx,
        startConic.dy,
        endConic.dx,
        endConic.dy,
        2,
      );
    }

    // Garis lurus ke kanan atas
    path.lineTo(width, 0);

    // Garis lurus kembali ke kiri atas
    path.lineTo(0, 0);

    // di tutup deh path dan menggambar ke canvas
    path.close();
    canvas.drawPath(path, paintStroke);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
