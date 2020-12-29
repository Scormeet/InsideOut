import 'package:flutter/material.dart';
import 'package:inside_out/src/providers/google_sign_in.dart';
import 'package:inside_out/src/widgets/sign_up_widget.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:inside_out/src/pages/mainmenu_page.dart';

DateTime now = new DateTime.now();
class ScrollPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          _pagina1(),
          _pagina2(context),
        ]
      )
    );
  }

  Widget _pagina1(){
    return Stack(
      children: <Widget>[ 
        _colorFondo(),
        _imagenFondo(),
        _textos(),
      ],
    );
  }

  Widget _colorFondo(){
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Color.fromRGBO(80, 194, 221, 1.0),
    );
  }

  Widget _imagenFondo(){
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Image(
        image: AssetImage('assets/images/scroll-1.png'),
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _textos(){

    final estiloTexto = TextStyle(color: Colors.white, fontSize: 50.0);
    return SafeArea(
          child: Column(
            children: <Widget>[
            SizedBox(height:20.0),
            //Text('${now.hour}:${now.minute}',style:estiloTexto),
            //Text('${now.day} - ${now.month} - ${now.year}',style:estiloTexto),
            Text('Inside Out',style:estiloTexto),
            SizedBox(height: 20,),
            Text('App Informativa sobre casos de COVID-19 en la CDMX',
                 textAlign: TextAlign.center,
                 style:TextStyle(
                   fontSize: 15,
                   color: Colors.white,
              )
            ),
            Expanded(child: Container(),),
            Text(
              'Deslice Hacia Arriba', 
              textAlign: TextAlign.center,
              style:TextStyle(
                color: Colors.white,
              ),
            ),
            Icon(Icons.keyboard_arrow_up, size:70.0, color: Colors.white,)
          ],
      ),
    );
  }

  Widget _pagina2(BuildContext context){
    return Scaffold(
      //backgroundColor: Color.fromRGBO(80, 194, 221, 1.0),
      backgroundColor: Colors.white,
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
}

Widget buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }