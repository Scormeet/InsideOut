import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:inside_out/src/providers/google_sign_in.dart';
import 'package:provider/provider.dart';

class GoogleSignUpButtonWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(5),
        /*decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.purple[700],
        ),*/
        child: OutlineButton.icon(
          label: Text(
            'Inicia Sesión con Google',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          shape: StadiumBorder(),
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          highlightedBorderColor: Colors.white,
          borderSide: BorderSide(color: Colors.white),
          textColor: Colors.white,
          icon: FaIcon(FontAwesomeIcons.google, color: Colors.red),
          onPressed: () {
            final provider =
                Provider.of<GoogleSignInProvider>(context, listen: false);
            provider.login();
          }
        ),
    );
  }
}