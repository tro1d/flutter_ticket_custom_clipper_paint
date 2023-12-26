import 'dart:math';

import 'package:flutter/material.dart';

class ZigZagClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double zigzagWidth = 20; // Lebar setiap zig atau zag
    double halfZigZagWidth = zigzagWidth / 2;
    double height = size.height;
    double width = size.width;

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

    // Garis lurus kembali ke kiri bawah
    path.lineTo(0, 0);

    path.close(); // Menutup path untuk membentuk potongan yang diinginkan

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
