import 'package:flutter/material.dart';

class Menudua extends StatefulWidget {
  const Menudua({super.key});

  @override
  State<Menudua> createState() => _MenuduaState();
}

class _MenuduaState extends State<Menudua> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Halaman 2'),
        ),
        body: Stack(
          children: [
            Container(
              color: Colors.blue,
            )
          ],
        ),
      ),
    );
  }
}
