import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:proken_project/pages/select_page.dart';

void main() {
  // debugPaintSizeEnabled = true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: Color(0xFFE0EFDE),
              secondary: Colors.green,
            ),
        // fontFamily: 'Murecho',
        primaryIconTheme: IconThemeData(color: Colors.green),
        // useMaterial3: true,
      ),
      onGenerateRoute: (settings) {
        return MaterialWithModalsPageRoute(
          settings: settings,
          builder: (context) => SelectPage(),
        );
      },
    );
  }
}
