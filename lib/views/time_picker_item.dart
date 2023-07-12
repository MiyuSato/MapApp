import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide ModalBottomSheetRoute;

class TimePickerItem extends StatefulWidget {
  final void Function(DateTime) onTap;
  final String defaultText;

  const TimePickerItem({
    super.key,
    required this.onTap,
    required this.defaultText,
  });

  @override
  TimePickerItemState createState() => TimePickerItemState();
}

class TimePickerItemState extends State<TimePickerItem> {
  DateTime? selectedTime;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        alignment: Alignment.center,
        width: 80,
        child: TextButton(
          onPressed: () {
            showCupertinoModalPopup(
              context: context,
              builder: (context) {
                return Container(
                  height: MediaQuery.of(context).size.height / 3,
                  color: CupertinoColors.systemBackground.resolveFrom(context),
                  child: Column(
                    children: [
                      Expanded(
                        child: SafeArea(
                          child: CupertinoDatePicker(
                            mode: CupertinoDatePickerMode.time,
                            use24hFormat: true,
                            onDateTimeChanged: (dateTime) {
                              setState(() {
                                selectedTime = dateTime;
                              });
                            },
                          ),
                        ),
                      ),
                      CupertinoButton(
                        child: const Text(
                          '完了',
                          style: TextStyle(color: CupertinoColors.activeBlue),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                          if (selectedTime != null) {
                            widget.onTap(selectedTime!);
                          }
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          },
          child: selectedTime == null
              ? Text(
                  widget.defaultText,
                  style: const TextStyle(color: CupertinoColors.inactiveGray),
                )
              : Text(
                  '${selectedTime?.hour}:${selectedTime?.minute.toString().padLeft(2, '0')}',
                  style: const TextStyle(color: Colors.black),
                ),
        ),
      ),
    );
  }
}
