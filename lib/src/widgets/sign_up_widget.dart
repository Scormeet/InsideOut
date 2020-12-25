import 'package:flutter/material.dart';
import 'google_signup_button_widget.dart';
class SignUpWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) => buildSignUp();

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
                  color: Colors.black,
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
            style: TextStyle(fontSize: 16),
          ),
          Spacer(),
        ],
      );
}