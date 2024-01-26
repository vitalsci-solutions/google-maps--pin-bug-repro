import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

const LatLng _kMapCenter = LatLng(52.4478, -3.5402);

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('VoiceOver Bug Repro'),
      ),
      body: Center(
        child: GoogleMap(
          initialCameraPosition: const CameraPosition(
            target: _kMapCenter,
            zoom: 7.0,
          ),
          // markers: <Marker>{_createMarker()},
          markers: {
            Marker(
              markerId: MarkerId('marker_1'),
              position: _kMapCenter,
              infoWindow: InfoWindow(title: 'Tis is a title'),
              onTap: () {
                print('Marker tapped');
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return Scaffold(
                        body: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [Text("henlo"), BackButton()],
                        ),
                      );
                    },
                  ),
                );
              },
              consumeTapEvents: true,
            )
          },
        ),
      ),
    );
  }
}
