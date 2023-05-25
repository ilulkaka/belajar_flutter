import 'package:flutter/material.dart';

class Menuempat extends StatefulWidget {
  const Menuempat({super.key});

  @override
  State<Menuempat> createState() => _MenuempatState();
}

class _MenuempatState extends State<Menuempat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test'),
      ),
      body: Center(
        child: Text('testtesttest'),
      ),
    );
  }
}
