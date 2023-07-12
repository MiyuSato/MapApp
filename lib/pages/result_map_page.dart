import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:flutter_map/flutter_map.dart';
import 'package:http/http.dart' as http;
import 'package:latlong2/latlong.dart' as latlng;

import '../bfs.dart';
import '../models/spot.dart';

class ResultMapPage extends StatefulWidget {
  const ResultMapPage({
    this.startSpot,
    this.goalSpot,
    Key? key,
  }) : super(key: key);

  final Spot? startSpot;
  final Spot? goalSpot;

  @override
  ResultMapPageState createState() => ResultMapPageState();
}

class ResultMapPageState extends State<ResultMapPage> {
  bool _isSearched = false;
  List<Spot?> resultSpots = <Spot?>[];
  List<Marker> markers = [];
  List<latlng.LatLng> routePoints = [];

  @override
  void initState() {
    super.initState();
    resultSpots = BFS().searchSpots();
    // if (widget.startSpot != null && widget.goalSpot != null) {
    //   resultSpots = [widget.startSpot!, widget.goalSpot!];
    // } // TODO: スタート・ゴールのみ代入なので、複数スポットのリストを代入する
    setMarker();
    searchRoute();
  }

  // resultSpotsをマーカーにセットする
  Future<void> setMarker() async {
    for (int i = 0; i < resultSpots.length; i++) {
      Marker mk = Marker(
          point: latlng.LatLng(resultSpots[i]!.lat, resultSpots[i]!.long),
          builder: (BuildContext context) {
            return const Icon(
              Icons.location_pin,
              size: 40,
              color: Colors.redAccent,
            );
          });
      markers.add(mk);
    }
  }

  // markersでルート探索
  Future<void> searchRoute() async {
    String url = 'http://router.project-osrm.org/route/v1/walking/';
    String way = '';
    for (int i = 0; i < markers.length; i++) {
      way =
          '$way${markers[i].point.longitude.toString()},${markers[i].point.latitude.toString()}';
      if (i < markers.length - 1) {
        way = '$way;';
      }
    }
    String query = '?geometries=geojson&overview=full';
    var req = Uri.parse('$url$way$query');
    var res = await http.get(req);
    print(res.statusCode);

    if (res.statusCode == 200) {
      Map<String, dynamic> data = json.decode(res.body);

      print(data['routes'][0]['distance']);
      print(data['routes'][0]['duration']);

      routePoints.clear();
      for (int i = 0;
          i < data['routes'][0]['geometry']['coordinates'].length;
          i++) {
        routePoints.add(latlng.LatLng(
            data['routes'][0]['geometry']['coordinates'][i][1],
            data['routes'][0]['geometry']['coordinates'][i][0]));
      }
      _isSearched = true;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios_new),
              color: Colors.grey,
            ),
            title: const Text(
              'Result',
              style: TextStyle(color: Colors.black),
            )),
        body: _isSearched
            ? FlutterMap(
                options: MapOptions(
                  center: latlng.LatLng(35.0394501, 135.7292142),
                ),
                children: [
                  TileLayer(
                    urlTemplate:
                        "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                  ),
                  PolylineLayer(
                    polylines: [
                      Polyline(
                        points: routePoints,
                        color: Colors.blue,
                        borderColor: Colors.white,
                        strokeWidth: 5.0,
                      ),
                    ],
                  ),
                  MarkerLayer(
                    markers: markers,
                  ),
                ],
              )
            : const Center(child: CupertinoActivityIndicator())
        //TODO　モーダル表示
        // floatingActionButton: FloatingActionButton(
        //   onPressed: setState(() {}),
        //   child: Icon(Icons.confirmation_num_sharp),
        // ),Center(child: CupertinoActivityIndicator())
        );
  }
}
