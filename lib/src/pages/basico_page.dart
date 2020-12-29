import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share/share.dart';

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
          ]
        ),

      )
    );
  }

  Widget _crearImagen() {
    return FadeInImage(
            placeholder: AssetImage('assets/images/jar-loading.gif'),
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
        _accion(Icons.call, 'Llamar', 'https://www.escom.ipn.mx/'),
        _accion(Icons.near_me, 'Ruta', 'https://www.google.com.mx/maps/place/ESCOM+-+Escuela+Superior+de+C%C3%B3mputo+-+IPN/@19.5045722,-99.1490985,17z/data=!4m12!1m6!3m5!1s0x85d1f835393528b5:0x5f2dd0563ce99e8!2sESCOM+-+Escuela+Superior+de+C%C3%B3mputo+-+IPN!8m2!3d19.5045672!4d-99.1469098!3m4!1s0x85d1f835393528b5:0x5f2dd0563ce99e8!8m2!3d19.5045672!4d-99.1469098'),
        _share(Icons.share, 'Compartir'),

      ],
    );
  }

  Widget _accion(IconData icon, String texto, String url) {
    return InkWell(
            onTap: () async {
              if (await canLaunch(url)) {
                await launch(url);
              } else {
                throw 'Could not launch $url';
              }
            },
            child: Column(
              children: <Widget>[
                Icon(icon, color:Colors.blue, size: 40.0),
                SizedBox(height: 5.0,),
                Text(texto, style: TextStyle(fontSize: 15.0, color: Colors.blue),),
              ],
          ),
    );
  }

  Widget _share(IconData icon, String texto) {
    return InkWell(
            onTap: () {
              Share.share('Install Inside Out at: https://play.google.com/store/?utm_source=latam_Med&utm_medium=hasem&utm_content=Jan2017&utm_campaign=Evergreen&pcampaignid=MKT-FDR-latam-mx-1002290-Med-hasem-py-Evergreen-Jul1520-Text_Search_BKWS-28432345789&gclid=EAIaIQobChMI-LTUgvrz7QIVYP_jBx0WfASvEAAYASAAEgLrGPD_BwE&gclsrc=aw.ds');
            },
            child: Column(
              children: <Widget>[
                Icon(icon, color:Colors.blue, size: 40.0),
                SizedBox(height: 5.0,),
                Text(texto, style: TextStyle(fontSize: 15.0, color: Colors.blue),),
              ],
          ),
    );
  }

  Widget _crearTexto(){
    return SafeArea(
        child: Container(
        padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
        child: Text(
          'Inside Out es un proyecto elaborado por Alumnos de la Escuela Superior de Computo del Instituto Politécnico Nacional, la cual te permitirá observar la localización de infectados de COVID-19 en la Ciudad de México, además de proporcionarte la opción de registrar si tú o algún familiar se encuentra infectado.\n'
          'La aplicación también nos mostrará una gráfica actual de propagación en la ciudad, así como recordarte medidas de sanidad en tu día a día, qué hacer en caso de contraer el virus y proveerte el contacto profesional correspondiente.\n\n\n'
          'Objetivo General\n\n'
          'Mantener Informada a la comunidad en todo momento con respecto al entorno en el que convive, así como disminuir la cantidad diaria de contagios en la Ciudad.\n\n'
          'Objetivos Particulares.\n\n'
          '* Concientizar a las personas de mantenerse en casa si su entorno se encuentra vulnerable.\n\n'
          '* Mantener un registro general por delegaciones y municipios para aplicar medidas con base a el caso.\n\n'
          '* Acelerar el proceso del semáforo epidemiológico que se encuentra regulando actualmente.\n\n\n'

          'Hecho por:\n\n' 
          '- Sergio Benítez Ramírez\n\n' 
          '- José Luis Bonilla Reyes\n\n'
          '- Juan Daniel Cedillo Hernández\n\n'
          '- Daniel Alejandro Rivero Enríquez\n\n' 
        ),
      ),
    );
  }
}
