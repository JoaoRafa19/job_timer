import 'dart:math';

import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  AnimationController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 100),
      upperBound: 1000,
      lowerBound: 0,
    )..repeat();

    //Adding a listener to set the state is needed
    //if your widget tree needs to rebuild in each tick
    _controller!.addListener(() {
      setState(() {});
    });
  }

  final image = Image.asset('assets/images/logo.png');

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF0092b9),
              Color(0xFF0167b2),
            ],
          ),
        ),
        child: Center(
            child: Stack(children: [
          image,
          Positioned(
              bottom: 0,
              left: 0,
              child: CustomPaint(
                painter: DemoPainter(
                    angle: _controller!.value.floorToDouble(),
                    image: image,
                    context: context),
              )),
        ])),
      ),
    );
  }
}

class DemoPainter extends CustomPainter {
  final double angle;
  final Image? image;
  final BuildContext? context;

  DemoPainter({
    this.angle = 0,
    this.image,
    this.context,
  });

  @override
  void paint(
    Canvas canvas,
    Size size,
  ) {
    //Painters aren't our topic in this article,
    //but briefly it draws 2 mirrored arcs by calculating the sweep angle
    final rotateAngle = 6000 * angle / 5;
    const origin = Offset(80, -145);
    Paint paint = Paint()
      ..strokeWidth = 4
      ..color = Color.fromARGB(255, 251, 255, 0);

    canvas.drawCircle(origin, 5, paint);
    paint.color = const Color(0xFF002946);

    canvas.drawLine(
        origin,
        origin.translate((origin.dx * cos(rotateAngle)) - cos(rotateAngle) * 30,
            (origin.dx * -sin(rotateAngle)) + sin(rotateAngle) * 30),
        paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
