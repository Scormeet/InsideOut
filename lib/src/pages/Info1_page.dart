import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:inside_out/src/constant.dart';
import 'package:url_launcher/url_launcher.dart';


class Info1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ClipPath(
                clipper: MyClipper(),
                child: Container(
                  padding: EdgeInsets.only(left: 40, top: 50, right: 20),
                  height: 350,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors:[
                        Color(0xFF3383CD),
                        Color(0xFF11249F),
                      ],
                    ),
                    image: DecorationImage(image: AssetImage('assets/images/virus.png'))
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topRight,
                        child: SvgPicture.asset('assets/icons/menu.svg'),
                      ),
                      SizedBox(height: 20),
                      Expanded(
                        child: Stack(
                          children: <Widget>[
                            SvgPicture.asset(
                              'assets/icons/Drcorona.svg',
                              width: 230,
                              fit: BoxFit.fitWidth,
                              alignment: Alignment.topCenter,
                            ),
                            Positioned(
                              top: 20,
                              left: 150,
                              child: Text(
                                'Todo lo que necesita \nEs quedarse en casa', 
                                style: kHeadingTextStyle.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Container(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, ),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                    color: Color(0xFFE5E5E5),
                  )
                ),
                child: Row(
                  children: <Widget>[
                    SvgPicture.asset('assets/icons/maps-and-flags.svg'),
                    SizedBox(width: 20,),
                    Expanded(
                      child: Text('México', style: TextStyle(fontSize: 15),),
                    )
                  ],
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        RichText(
                          text: TextSpan(
                            children:[
                              TextSpan(
                                text: 'Números Telefónicos\n',
                                style: kTitleTextstyle,
                              ),
                              TextSpan(
                                text: 'Contacto de Emergencia\n',
                                style: TextStyle(
                                  color: kTextLightColor
                                ),
                              ),
                            ]
                          )
                        ),
                        Spacer(),
                        InkWell(
                          onTap: _launchURL1,
                          child: Text(
                            'Ver todos', 
                            style: TextStyle(
                              color: kPrimaryColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 12.0
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 20),
                    Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 4),
                            blurRadius: 30, 
                            color: kShadowColor,
                          )
                        ]
                      ),
                      child: SafeArea(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Counter(
                              color: kInfectedColor,
                              number: 8000044800,
                              title: 'Número de atención ciudadana del Sector Salud'
                            ),
                            SizedBox(height: 20,),
                            Counter(
                              color: kDeathColor,
                              number: 8006283762,
                              title: 'Atención a mujeres en embarazo, parto, puerperio o lactancia'
                            ),
                             SizedBox(height: 20,),
                            Counter(
                              color: kRecovercolor,
                              number: 5540001000,
                              title: 'ISSTE Telefóno'
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Propagación del Virus',
                          style: kTitleTextstyle,

                        ),
                        InkWell(
                          onTap: _launchURL2,
                          child: Text(
                            "Ver Mapa",
                            style: TextStyle(
                              color: kPrimaryColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 12.0
                            ),
                          ),
                        ),
                      ],
                    ),
                     Container(
                      margin: EdgeInsets.only(top: 20),
                      padding: EdgeInsets.all(20),
                      height: 178,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 10),
                            blurRadius: 30,
                            color: kShadowColor,
                          ),
                        ],
                      ),
                      child: Image.asset(
                        "assets/images/map.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

_launchURL1() async {
  const url = 'https://coronavirus.gob.mx/contacto/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
_launchURL2() async {
  const url = 'https://www.nytimes.com/es/interactive/2020/espanol/america-latina/coronavirus-en-mexico.html';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

class Counter extends StatelessWidget {
  final int number;
  final Color color;
  final String title;
  
  const Counter({
    Key key, this.number, this.color, this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(6),
          height: 25,
          width: 25,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color.withOpacity(0.26),
          ),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: color,
                width: 2,
              )
            ) ,
          ),
        ),
        SizedBox(height: 10),
        Text(
          '$number',
          style: TextStyle(fontSize: 40, color: color),
        ),
        Text(
          title,
          style: kSubTextStyle,
        )
      ],
    );
  }
}


class MyClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
      var path = Path();
      path.lineTo(0, size.height - 80);
      path.quadraticBezierTo(size.width/2, size.height, size.width, size.height-80);
      path.lineTo(size.width, 0);
      path.close();
      return path;
    }
  
    @override
    bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }

  
  
}