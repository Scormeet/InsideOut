import 'package:flutter/material.dart';
import 'package:inside_out/src/widgets/background_painter.dart';
import 'google_signup_button_widget.dart';
class SignUpWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) => Stack(
    fit: StackFit.expand,
      children: [
        CustomPaint(painter: BackgroundPainter()),
        buildSignUp(),
      ],
    );

  Widget buildSignUp() => Column(
        children: [
          Spacer(),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              width: 175,
              child: Text(
                'Bienvenido a Inside Out',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Spacer(),
          GoogleSignUpButtonWidget(),
          SizedBox(height: 12),
          Text(
            'Ingresa para Continuar',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          Spacer(),
        ],
      );
}