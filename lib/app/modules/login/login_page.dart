import 'package:flutter/material.dart';
import 'package:job_timer/app/modules/login/widgets/painter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
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
    final screenSize = MediaQuery.of(context).size;
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  image,
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: CustomPaint(
                      painter: Painter(
                        angle: _controller!.value.floorToDouble(),
                        image: image,
                        context: context,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenSize.height * 0.1),
              SizedBox(
                width: screenSize.width * 0.8,
                height: 49,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey[200],
                  ),
                  child: Image.asset('assets/images/google.png'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
