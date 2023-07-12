import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' as latLng;

import 'list_page.dart';

class MapPage extends StatefulWidget {
  MapPage({
    this.spot,
    Key? key,
  }) : super(key: key);

  final spot;
  // List<Marker> markers = [];
  // List<latlng.LatLng> routePoints = [];

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(
              context,
              MaterialPageRoute(
                builder: (context) => ListPage(),
              ),
            );
          },
          icon: const Icon(Icons.arrow_back_ios_new),
          color: Colors.grey,
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.spot.name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(width: 40),
          ],
        ),
      ),
      body: FlutterMap(
        options: MapOptions(
          center: latLng.LatLng(widget.spot.lat, widget.spot.long),
        ),
        children: [
          TileLayer(
            urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
          ),
          MarkerLayer(
            markers: [
              Marker(
                point: latLng.LatLng(widget.spot.lat, widget.spot.long),
                builder: (BuildContext context) {
                  return Container(
                    child: const Icon(
                      Icons.location_pin,
                      color: Colors.blue,
                      size: 40,
                    ),
                  );
                },
              ),
            ],
          ),
          // CircleLayer(
          //   circles: circles,
        ],
      ),
    );
  }
}

//   vois searchRoute() asy
// }
