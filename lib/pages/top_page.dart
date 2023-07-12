import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:proken_project/pages/list_page.dart';

class TopPage extends StatelessWidget {
  const TopPage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/kyoto.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
      ),
      Scaffold(
        backgroundColor: Colors.black.withOpacity(0.2),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 128),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 24),
                  Text(
                    'Proken App',
                    style: TextStyle(
                      fontSize: 44,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 324),
              TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: Colors.white.withOpacity(0.5),
                    shape: const StadiumBorder(),
                    padding: EdgeInsets.all(12)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ListPage()),
                  );
                },
                child: const Text(
                  '　目的地を選択　',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    letterSpacing: 0.75,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ]);
  }
}
