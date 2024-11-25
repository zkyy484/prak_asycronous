import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  Future<Position>? position;


  String myPosition = '';

  @override
  void initState() {
    super.initState();

    // Praktikum 7
    position = getPosition();


    // Praktikum 6
    // getPosition().then((Position myPos) {
    //   myPosition = 'Latitude: ${myPos.latitude.toString()} - Longitude: ${myPos.latitude.toString()}';
    //   setState(() {
    //     myPosition = myPosition;
    //   });
    // });
  }

  // Praktikum 7
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Current Location'),
      ),
      body: Center(child: FutureBuilder(
        future: position, 
        builder: (BuildContext context, AsyncSnapshot<Position> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return const Text('Something terrible happened!');
          }
          else {
            return Text(snapshot.data.toString());            
          }
        }),),
    );
  }

  // Praktikum 6
  // @override
  // Widget build(BuildContext context) {
  //   final myWidget = myPosition == ''
  //   ? const CircularProgressIndicator()
  //   : Text(myPosition);
    
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: const Text('Moch. Dzaky Musyaddad'),
  //     ),
  //     body: Center(
  //       child: Text(myPosition),
  //     ),
  //   );
  // }

  Future<Position> getPosition() async {
    await Future.delayed(const Duration(seconds: 3));
    await Geolocator.requestPermission();
    await Geolocator.isLocationServiceEnabled();
    Position? position = await Geolocator.getCurrentPosition();
    return position;
  }
}