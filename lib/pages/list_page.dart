import 'package:flutter/material.dart';
import 'package:proken_project/views/spot_item.dart';

import '../models/spot.dart';

class ListPage extends StatefulWidget {
  const ListPage({
    this.title,
    Key? key,
  }) : super(key: key);
  final String? title;

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  late final List<Spot>? spotList;

  @override
  Widget build(BuildContext context) {
    spotList = [
      Spot(
          id: 1,
          lat: 34.9671899,
          long: 135.7732739,
          rating: 4.3,
          name: '伏見稲荷大社'),
      Spot(
          id: 2,
          lat: 35.0394501,
          long: 135.7292142,
          rating: 4.4,
          name: '鹿苑寺（金閣寺）'),
      Spot(id: 3, lat: 34.994862, long: 135.7849886, rating: 4.2, name: '清水寺'),
      Spot(
          id: 4,
          lat: 34.9807766,
          long: 135.7476312,
          rating: 4.0,
          name: '東寺（教王護国寺）'),
      Spot(
          id: 5,
          lat: 35.026892,
          long: 135.7981863,
          rating: 4.3,
          name: '銀閣寺（慈照寺）'),
    ];

    return Scaffold(
      backgroundColor: Color(0xFFE0EFDE),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Select',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
      ),
      body: Column(
        children: [
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                children: [
                  const CircleAvatar(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.green,
                    radius: 24,
                    child: Icon(
                      Icons.star,
                      size: 32,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    '評価順',
                    style: TextStyle(
                      fontSize: 8,
                    ),
                  )
                ],
              ),
              SizedBox(width: 8),
              Column(
                children: [
                  const CircleAvatar(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    radius: 24,
                    child: Icon(
                      Icons.comment,
                      size: 32,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    '口コミ順',
                    style: TextStyle(fontSize: 8),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 4),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: ListView.builder(
                  itemCount: spotList!.length,
                  itemBuilder: (context, index) {
                    return SpotItem(id: index, spot: spotList![index]);
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
