import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart' as fm;
import 'package:latlong2/latlong.dart' as ll;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MapContent(),
    );
  }
}

class MapContent extends StatelessWidget {
  const MapContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return fm.FlutterMap(
      options: fm.MapOptions(
        center: ll.LatLng(39.81074507870429, 3.1154755243871137),
        zoom: 10.0,
        maxZoom: 15,
        enableMultiFingerGestureRace: true,
        rotationWinGestures:
            fm.MultiFingerGesture.rotate | fm.MultiFingerGesture.pinchZoom,
      ),
      children: [
        fm.TileLayerWidget(
          options: fm.TileLayerOptions(
            tileBounds: fm.LatLngBounds(
              ll.LatLng(39.153804, 2.140099),
              // ll.LatLng(39.153804, 2.6),
              ll.LatLng(40.079265, 3.685447),
            ),
            urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
            subdomains: ['a', 'b', 'c'],
            // tileProvider: const CachedTileProvider(),
            attributionBuilder: (_) {
              return const Text('© OpenStreetMap contributors');
            },
          ),
        ),
        // fm.TileLayerWidget(
        //   options: fm.TileLayerOptions(
        //     tileBounds: fm.LatLngBounds(
        //       ll.LatLng(39.153804, 2.140099),
        //       // ll.LatLng(39.153804, 2.6),
        //       ll.LatLng(40.079265, 3.685447),
        //     ),
        //     opacity: 0.5,
        //     // wmsOptions: fm.WMSTileLayerOptions(baseUrl: baseUrl),
        //     backgroundColor: Colors.transparent,
        //     urlTemplate:
        //         'https://cdn.huerzeler.app/data/tilesoutmercator/{z}/{x}/{y}.png',
        //     // subdomains: ['a', 'b', 'c'],
        //     maxZoom: 15,
        //     tms: true,
        //   ),
        // ),
      ],
    );
  }
}
