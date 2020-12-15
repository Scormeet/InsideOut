import 'dart:math';

import 'package:flutter/material.dart';

class MainMenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _fondoApp(),
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                _titulos()
              ],
            ),
          ),
        ],
      )
    );
  }

  Widget _fondoApp(){
    final gradiente = Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset(0.0, 0.4),
          end: FractionalOffset(0.0, 1.0),
          colors: [
            /*
            Color.fromRGBO(239, 250, 248, 1.0),
            Color.fromRGBO(152, 236, 219, 1.0)
            */
            Color.fromRGBO(52, 54, 101, 1.0),
            Color.fromRGBO(35, 36, 57, 1.0)
          ]
        )
      ),
    );

    final secondBox = Transform.rotate(
      angle: -pi/5.0,
      child: Container(
        height: 360.0,
        width: 360.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(90.0),
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(236, 98, 188, 1.0),
              Color.fromRGBO(241, 142, 132, 1.0)
            ]
          )
        ),
      ),
    );

    return Stack(
      children: <Widget>[
        gradiente,
        Positioned(
          top: -100.0,
          child:secondBox,
        ),
      ],
    );
  }

  Widget _titulos(){
    return SafeArea(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
            Text('Inside Out', style: TextStyle(color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold),),
            SizedBox(height:10.0),
            Text('Selecciona una Opción',style: TextStyle(color: Colors.white, fontSize: 25.0,),),
          ],
        ),
      ),
    );
  }
}