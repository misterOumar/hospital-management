import 'dart:math' as math;
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Tracé de deux courbes analogiques')),
        body: WaveAnimation(),
      ),
    );
  }
}

class WaveAnimation extends StatefulWidget {
  @override
  _WaveAnimationState createState() => _WaveAnimationState();
}

class _WaveAnimationState extends State<WaveAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..repeat();
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Container(
            width: 300.0,
            height: 200.0,
            child: CustomPaint(
              painter: WavePainter(_animation.value),
            ),
          );
        },
      ),
    );
  }
}

class WavePainter extends CustomPainter {
  final double animationValue;

  WavePainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    Paint bluePaint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    Paint redPaint = Paint()
      ..color = Colors.red
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    Path bluePath = Path();
    Path redPath = Path();

    double amplitude = 20.0;
    double frequency = 2.0 * math.pi / size.width;

    bluePath.moveTo(0, size.height / 2);
    redPath.moveTo(0, size.height / 2);

    for (double x = 0; x < size.width; x += 1) {
      double yBlue = size.height / 2 + amplitude * math.sin(frequency * x + animationValue * 2 * math.pi);
      double yRed = size.height / 2 + amplitude * math.cos(frequency * x + animationValue * 2 * math.pi);
      bluePath.lineTo(x, yBlue);
      redPath.lineTo(x, yRed);
    }

    canvas.drawPath(bluePath, bluePaint);
    canvas.drawPath(redPath, redPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
