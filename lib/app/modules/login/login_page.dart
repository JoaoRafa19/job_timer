import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_timer/app/modules/login/controller/login_controller.dart';
import 'package:job_timer/app/modules/login/widgets/painter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key, required this.loginController}) : super(key: key);
  final LoginController loginController;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  AnimationController? _controller;
  Image? image;

  @override
  void initState() {
    super.initState();
    image = Image.asset('assets/images/logo.png');
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 100),
      upperBound: 1000,
      lowerBound: 0,
    )
      ..repeat()
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return BlocListener<LoginController, LoginState>(
      listenWhen: (previous, current) => previous.status != current.status,
      bloc: widget.loginController,
      listener: (context, state) {
        if (state.status == LoginStatus.error) {
          final message = state.message ?? 'Erro ao realizar o login';
          AsukaSnackbar.alert(message).show();
        }
      },
      child: Scaffold(
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
                image != null
                    ? Stack(
                        children: [
                          image!,
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
                      )
                    : Container(),
                SizedBox(height: screenSize.height * 0.1),
                SizedBox(
                  width: screenSize.width * 0.8,
                  height: 49,
                  child: ElevatedButton(
                    onPressed: () {
                      widget.loginController.signIn();
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.grey[200],
                    ),
                    child: Image.asset('assets/images/google.png'),
                  ),
                ),
                BlocSelector<LoginController, LoginState, bool>(
                  bloc: widget.loginController,
                  selector: (state) => state.status == LoginStatus.loading,
                  builder: (context, show) {
                    return Visibility(
                      visible: show,
                      child: const Padding(
                        padding: EdgeInsets.only(top: 15.0),
                        child: Center(
                            child: CircularProgressIndicator.adaptive(
                          backgroundColor: Colors.white,
                        )),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
