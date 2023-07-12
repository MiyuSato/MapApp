import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../models/spot.dart';
import '../pages/list_page.dart';

class SelectSpotItem extends StatefulWidget {
  final void Function(Spot) onTap;
  final Icon icon;

  const SelectSpotItem({
    required this.onTap,
    required this.icon,
  });

  @override
  SelectSpotItemState createState() => SelectSpotItemState();
}

class SelectSpotItemState extends State<SelectSpotItem> {
  Spot? selectedSpot;

  @override
  Widget build(BuildContext context) {
    return
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
    color: Colors.white,
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
      selectedSpot = result;
    });
    }
    },
    child: (selectedSpot == null)
    ? const Text(
    'Spot',
    style:
    TextStyle(color: CupertinoColors.inactiveGray),
    )
        : Text(
    selectedSpot!.name,
    style: const TextStyle(color: Colors.black),
    ),
    ),
    ),
    ],
    );
}
