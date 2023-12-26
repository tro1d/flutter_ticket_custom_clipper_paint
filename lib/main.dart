import 'package:flutter/material.dart';

import 'clipper/zig_zag_clipper.dart';
import 'clipper/zig_zag_custom_paint.dart';
import 'clipper/zig_zag_paint.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFFA8B9BC),
        appBar: AppBar(
          title: const Text('Potongan Kertas'),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 24.0),
                // ================= CUSTOM CLIPPER =================
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 5,
                          blurRadius: 6,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: ClipPath(
                      clipper: ZigZagClipper(),
                      child: Container(
                        width: 200.0,
                        height: 200.0,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [Color(0xFFF0F0F0), Colors.white], // Warna gradient
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            'Ini, CustomClipper',
                            style: TextStyle(color: Colors.black87),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                // ================= END =================
                const SizedBox(height: 24.0),
                // ================= CUSTOM PAINT =================
                SizedBox(
                  width: 200.0,
                  height: 200.0,
                  child: CustomPaint(
                    painter: ZigZagPainter(),
                    child: const Center(
                      child: Text(
                        'Ini, CustomPaint',
                        style: TextStyle(color: Colors.black87),
                      ),
                    ),
                  ),
                ),
                // ================= END =================
                const SizedBox(height: 24.0),
                // ================= CUSTOM PAINT bhbfyt??fbtrf??rutbnftf?? =================
                SizedBox(
                  width: 300.0,
                  height: 280.0,
                  child: CustomPaint(
                    painter: ZigZagStylePainter(
                      color: Colors.white,
                      radius: 8,
                      gradient: const LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [Color(0xFFF0F0F0), Colors.white], // Warna gradient
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'Ini, Style CustomPaint',
                        style: TextStyle(color: Colors.black87),
                      ),
                    ),
                  ),
                ),
                // ================= END =================
                const SizedBox(height: 24.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
