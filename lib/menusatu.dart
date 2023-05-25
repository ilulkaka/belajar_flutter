import 'package:flutter/material.dart';

class Menusatu extends StatefulWidget {
  const Menusatu({super.key});

  @override
  State<Menusatu> createState() => _MenusatuState();
}

class _MenusatuState extends State<Menusatu> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Halaman 1'),
        ),
        body: Stack(
          children: [
            Container(
              color: Colors.cyan,
            )
          ],
        ),
      ),
    );
  }
}
