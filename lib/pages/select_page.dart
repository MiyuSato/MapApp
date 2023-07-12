import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:proken_project/pages/result_map_page.dart';

import '../models/spot.dart';
import '../views/time_picker_item.dart';
import 'list_page.dart';

class SelectPage extends StatefulWidget {
  SelectPage();

  @override
  _SelectPageState createState() => _SelectPageState();
}

class _SelectPageState extends State<SelectPage> {
  DateTime? startTime;
  DateTime? goalTime;
  Spot? startSpot;
  Spot? goalSpot;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE0EFDE),
      // Color(0xFFF5F5F5),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                const SizedBox(width: 52),
                const CircleAvatar(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  radius: 24,
                  child: Icon(
                    Icons.directions_walk,
                    size: 32,
                  ),
                ),
                const SizedBox(width: 12),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  alignment: Alignment.centerLeft,
                  width: 220,
                  child: TextButton(
                    onPressed: () async {
                      final result = await showCupertinoModalBottomSheet(
                          enableDrag: true,
                          context: context,
                          builder: (context) {
                            return ListPage();
                          });
                      if (result != null) {
                        setState(() {
                          startSpot = result;
                        });
                      }
                    },
                    child: (startSpot == null)
                        ? const Text(
                            'From',
                            style:
                                TextStyle(color: CupertinoColors.inactiveGray),
                          )
                        : Text(
                            startSpot!.name,
                            style: const TextStyle(color: Colors.black),
                          ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              children: <Widget>[
                const SizedBox(width: 52),
                const CircleAvatar(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  radius: 24,
                  child: Icon(Icons.flag, size: 32),
                ),
                const SizedBox(width: 12),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  alignment: Alignment.centerLeft,
                  width: 220,
                  child: TextButton(
                    onPressed: () async {
                      final result = await showCupertinoModalBottomSheet(
                          enableDrag: true,
                          context: context,
                          builder: (context) {
                            return ListPage();
                          });
                      if (result != null) {
                        setState(() {
                          goalSpot = result;
                        });
                      }
                    },
                    child: (goalSpot == null)
                        ? const Text(
                            'To',
                            style:
                                TextStyle(color: CupertinoColors.inactiveGray),
                          )
                        : Text(
                            goalSpot!.name,
                            style: const TextStyle(color: Colors.black),
                          ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 36),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TimePickerItem(
                    onTap: (value) {
                      setState(() {
                        startTime = value;
                      });
                    },
                    defaultText: '出発時刻'),
                SizedBox(width: 10),
                Icon(Icons.play_arrow_rounded, color: Colors.green),
                SizedBox(width: 10),
                TimePickerItem(
                    onTap: (value) {
                      setState(() {
                        goalTime = value;
                      });
                    },
                    defaultText: '到着時刻'),
              ],
            ),
            SizedBox(height: 40),
            Container(
              height: 50,
              width: 150,
              // padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    backgroundColor: Colors.orangeAccent),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResultMapPage(
                              startSpot: startSpot!, goalSpot: goalSpot!)));
                },
                child: Container(
                  child: Text(
                    '検索',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
