import 'package:flutter/material.dart';
import 'package:inside_out/src/providers/google_sign_in.dart';
import 'package:inside_out/src/widgets/sign_up_widget.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:inside_out/src/pages/mainmenu_page.dart';
class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (context) => GoogleSignInProvider(),
        child: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot){
            final provider = Provider.of<GoogleSignInProvider>(context);
            if(provider.estaIngresado){
              return buildLoading();
            }
            else if(snapshot.hasData){
              return MainMenuPage();
            }
            else{
              return SignUpWidget();
            }
          },
        ),
      ),
    );
  }

  Widget buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
