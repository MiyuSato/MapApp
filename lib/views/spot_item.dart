import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide ModalBottomSheetRoute;

import '../models/spot.dart';
import '../pages/map_page.dart';

class SpotItem extends StatelessWidget {
  const SpotItem({
    required this.id,
    required this.spot,
    Key? key,
  }) : super(key: key);
  final int id;
  final Spot spot;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop(spot);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          // if (id == 0) //Listと共にスクロールされる
          //   Container(
          //     width: double.infinity,
          //     padding: EdgeInsets.fromLTRB(12, 24, 24, 4),
          //     child: Text(
          //       'Spots',
          //       style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          //     ),
          //   ),
          ListTile(
            // leading: Icon(
            //   Icons.pin_drop_sharp,
            //   color: CupertinoColors.inactiveGray,
            // ),
            title: Text(spot.name),
            subtitle: Text('評価:${spot.rating}'),
            trailing: IconButton(
              icon: Icon(
                Icons.map_outlined,
                color: CupertinoColors.activeBlue,
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (BuildContext context) {
                    return MapPage(spot: spot);
                  },
                ));
              },
            ),
            // margin: const EdgeInsets.all(30),
          ),
        ],
      ),
    );
  }
}
