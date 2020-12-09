import 'package:flutter/material.dart';

class BasicoPage extends StatelessWidget {

  final estiloTitulo = TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold);
  final estiloSubTitulo = TextStyle(fontSize: 18.0, color: Colors.grey);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget> [
          _crearImagen(),
          _crearTitulo(),
          _crearAcciones(),
          _crearTexto(),
          _crearTexto(),
          _crearTexto(),
          _crearTexto(),
          _crearTexto(),
          _crearTexto(),
          _crearTexto(),

          ]
        ),

      )
    );
  }

  Widget _crearImagen() {
    return Image(
            image: NetworkImage('https://image.freepik.com/vector-gratis/covid-19-map-world-paises-afectados_1361-2379.jpg'),
    );
  }

  Widget _crearTitulo() {
    return SafeArea(
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
              child: Row(
                children: <Widget>[
                  
                  Expanded(
                      child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Inside Out',style: estiloTitulo,),
                        SizedBox(height: 7.0),
                        Text('#QuedateEnCasa', style: estiloSubTitulo,),
                      ]
                    ),
                  ),

                  Icon(Icons.coronavirus, color:Colors.green, size:30.0), 
                  Text('1.12 M', style: TextStyle(fontSize: 20.0))

                ],
              ),
            ),
    );
  }

  Widget _crearAcciones(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _accion(Icons.call, 'Call'),
        _accion(Icons.near_me, 'Route'),
        _accion(Icons.share, 'Share'),

      ],
    );
  }

  Widget _accion(IconData icon, String texto) {
    return Column(
          children: <Widget>[
            Icon(icon, color:Colors.blue, size: 40.0),
            SizedBox(height: 5.0,),
            Text(texto, style: TextStyle(fontSize: 15.0, color: Colors.blue),),
          ],
        );
  }

  Widget _crearTexto(){
    return SafeArea(
        child: Container(
        padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
        child: Text(
          'Cupidatat ullamco cupidatat sit enim aliquip. Eu in enim aute veniam. Ea excepteur occaecat et quis quis elit ut ad ut et in officia excepteur. Exercitation elit non laboris anim. Magna voluptate officia sint ullamco.'
        ),
      ),
    );
  }
}
