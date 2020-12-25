import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInProvider extends ChangeNotifier{
  
  final googleSignIn = GoogleSignIn();
  bool _estaIngresado;

  GoogleSignInProvider(){
    _estaIngresado = false;
  }

  bool get estaIngresado => _estaIngresado;

  set estaIngresado(bool estaIngresado){
    _estaIngresado = estaIngresado;
    notifyListeners();
  }

  Future login() async{
    estaIngresado = true;
    final user = await googleSignIn.signIn();
    if(user == null){
      estaIngresado = false;
      return; 
    }
    else{
      final googleAuth = await user.authentication;
      
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken
      );

      await FirebaseAuth.instance.signInWithCredential(credential);

      estaIngresado = false;

    }
  }

  void logout()  async{
    await googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();  
  }
}