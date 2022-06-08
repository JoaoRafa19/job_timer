import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:job_timer/app/modules/login/widgets/painter.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  AnimationController? _controller;
  Image? image;

  @override
  void initState() {
    super.initState();
    image = Image.asset('assets/images/logo.png');
    WidgetsFlutterBinding.ensureInitialized();
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

    FirebaseAuth.instance.authStateChanges().listen((user) async {
      if (user == null) {
        await Future.delayed(const Duration(seconds: 2));
        Modular.to.navigate('/login/');
      } else {
        await Future.delayed(const Duration(seconds: 2));
        Modular.to.navigate('/home/');
      }
    });
  }

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
          child: image != null
              ? Stack(children: [
                  image ?? Container(),
                  Positioned(
                      bottom: 0,
                      left: 0,
                      child: CustomPaint(
                        painter: Painter(
                            angle: _controller!.value.floorToDouble(),
                            image: image,
                            context: context),
                      )),
                ])
              : Container(),
        ),
      ),
    );
  }
}
