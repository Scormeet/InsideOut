import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:inside_out/src/pages/Info1_page.dart';
import 'package:inside_out/src/pages/Info2_page.dart';
import 'package:inside_out/src/pages/basico_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:inside_out/src/providers/google_sign_in.dart';

class MainMenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _fondoApp(),
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                _titulos(user),
                _botonesRedondeados(context),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: (){
              final provider =
                Provider.of<GoogleSignInProvider>(context, listen:false);
              provider.logout();
            },
            child: Text('Logout'),
          ),
        ],
      ),
      bottomNavigationBar: _bottomNavigationBar(context)
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

  Widget _titulos(User user){
    return SafeArea(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
            Text('Inside Out ' + user.displayName, style: TextStyle(color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold),),
            SizedBox(height:10.0),
            Text('Selecciona una Opción',style: TextStyle(color: Colors.white, fontSize: 25.0,),),
          ],
        ),
      ),
    );
  }

  Widget _bottomNavigationBar(BuildContext context){
    return Theme(
      data:Theme.of(context).copyWith(
        canvasColor: Color.fromRGBO(55, 57, 84, 1.0),
        primaryColor: Colors.pinkAccent,
        textTheme: Theme.of(context).textTheme.copyWith(
          caption: TextStyle(color: Color.fromRGBO(116, 117, 152, 1.0))
        )
      ),
      child: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.supervised_user_circle),
            label: '',
          )
        ],
      ),
    );
  }

  Widget _botonesRedondeados(BuildContext context){

    var info1 = MaterialPageRoute(
          builder: (context){
            return Info1Page();
          }
    );
    var info2 = MaterialPageRoute(
          builder: (context){
            return Info2Page();
          }
    );
    var basico = MaterialPageRoute(
          builder: (context){
            return BasicoPage();
          }
    );

    return Table(
      children: [
        TableRow(
          children: [
            _crearBotonRedondeado(Colors.blue, Icons.border_all, 'General', context, info1),
            _crearBotonRedondeado(Colors.purpleAccent, Icons.directions_bus, 'Bus', context, info1),
          ]
        ),
        TableRow(
          children: [
            _crearBotonRedondeado(Colors.pinkAccent, Icons.shop, 'Comprar', context, info2),
            _crearBotonRedondeado(Colors.orange, Icons.insert_drive_file, 'Documentos', context, info2),
          ]
        ),
        TableRow(
          children: [
            _crearBotonRedondeado(Colors.blueAccent, Icons.movie_filter, 'Entretenimiento', context, basico),
            _crearBotonRedondeado(Colors.greenAccent, Icons.cloud, 'Tienda', context, basico),
          ]
        )
      ],
    );

  }

  Widget _crearBotonRedondeado(Color color, IconData icono, String texto, BuildContext context, Route route){
    
    return InkWell(
      onTap: (){
        Navigator.pushReplacement(context, route);
      },
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 7.0, sigmaY: 7.0),
          child: Container(
            height: 180.0,
            margin: EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              color: Color.fromRGBO(62, 66, 107, 0.70),
              borderRadius: BorderRadius.circular(35.0)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                SizedBox(height: 5.0),
                CircleAvatar(
                  backgroundColor: color,
                  radius: 35.0,
                  child: Icon(icono, color: Colors.white, size: 30.0)
                ),
                Text(texto, style: TextStyle(color: color),),
                SizedBox(height: 5.0),
              ],
            ),
          ),
        ),
      ),
    );
  }


}


