import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/rxdart.dart';
import 'package:location/location.dart';
import 'package:map_controller/map_controller.dart';



class MapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FireMap(),
    );
  }
}

class FireMap extends StatefulWidget {
  @override
  State createState() => FireMapState();
}


class FireMapState extends State<FireMap> {
  GoogleMapController mapController;
  Location location = new Location();
  List<Marker> myMarker = [];
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Geoflutterfire geo = Geoflutterfire();
  BehaviorSubject<double> radius = BehaviorSubject<double>.seeded(100.0);

  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  void initMarkers(specify, specifyID) async{
    var markerIdVal = specifyID;
    final MarkerId markerId = MarkerId(markerIdVal);
    final Marker marker = Marker(
      markerId: markerId,
      position: LatLng(specify['geopoint'].latitude, specify['geopoint'].longitude),
      infoWindow: InfoWindow(title: 'Posicion', snippet: specify['nombre'])
    );
    setState((){
      markers[markerId] = marker;
    });
  }
  
  getMarkerData() async{
    FirebaseFirestore.instance.collection('locations').get().then((myMocData){
      if(myMocData.docs.isNotEmpty){
        for(int i=0; i<myMocData.docs.length; i++){
          initMarkers(myMocData.docs[i].data, myMocData.docs[i].id);
        }
      }
    });
  }

  void initState(){
    getMarkerData();
    super.initState();
  }


  @override
  build(context) {
    return Stack(
      children: <Widget>[
        GoogleMap(
          initialCameraPosition: CameraPosition(
          target: LatLng(19.425501, -99.172264),
          zoom: 10,
          ),
          onMapCreated: _onMapCreated,
          myLocationEnabled: true,
          mapType: MapType.normal,
          compassEnabled: true,
          markers: Set.from(myMarker)//Set<Marker>.of(markers.values)
        ),
        Positioned(
          bottom: 30,
          right: 260,
          child: FlatButton(
            child: Icon(Icons.pin_drop, color: Colors.white,),
            color: Colors.lightBlue,
            onPressed: _alert,
          ),
        ),
        Positioned(
          bottom: 20,
          left: 110,
          child: Slider(
            min: 100.0,
            max: 500.0,
            divisions: 4,
            value: radius.value,
            label: 'Radio ${radius.value} km',
            activeColor: Colors.lightBlue,
            inactiveColor: Colors.lightBlue.withOpacity(0.2),
            onChanged: _updateQuery,
          ),
        ),
      ],
    );
 // widgets go here
  }

  _addMarker() async {
    var pos = await location.getLocation();
    setState(() {
      //myMarker = [];
      myMarker.add(
        Marker( 
          markerId: MarkerId(pos.toString()),
          position: LatLng(pos.latitude, pos.longitude),
          infoWindow: InfoWindow(
            title: 'Mi Posición Actual',
          ),
        )
      );
    });
  }

  _onMapCreated(GoogleMapController controller){
    //_startQuery();
    setState((){
      mapController = controller;
    });
  }

  _animateToUser() async {  
    var pos = await location.getLocation();
    mapController.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        target: LatLng(pos.longitude, pos.latitude),
        zoom: 17.0
      )
    ));
  }

  final user = FirebaseAuth.instance.currentUser;

  Future <DocumentReference>_addGeoPoint() async {
    var pos = await location.getLocation();
    _addMarker();
    GeoFirePoint point = geo.point(latitude: pos.latitude, longitude: pos.longitude);
    return firestore.collection('locations').add({
      'position' : point.data,
      'nombre': user.displayName,
    });
  }

  void _alert()
  {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context){
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          title: Text('Desea Añadir Marker'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('¿Esta Seguro de que desea Marcar su posición actual?'),
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Cancelar',style: TextStyle(color: Colors.red),),
              onPressed: ()=>Navigator.of(context).pop(),
            ),
            FlatButton(
              child: Text('Aceptar',style: TextStyle(color: Colors.lightBlue),),
              onPressed: (){
                _addGeoPoint();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      }
    );
  }

  _updateQuery(value){
    final zoomMap = {
      100.0: 12.0,
      200.0: 10.0,
      300.0: 7.0,
      400.0: 6.0,
      500.0: 5.0
    };
    final zoom = zoomMap[value];
    mapController.moveCamera(CameraUpdate.zoomTo(zoom));

    setState((){
      radius.add(value);
    });
  }

}