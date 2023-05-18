import 'package:flutter/material.dart';

class Beranda extends StatefulWidget {
  const Beranda({super.key});

  @override
  State<Beranda> createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TRANSFER'),
        titleSpacing: 10,
        leading: Icon(Icons.arrow_back),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
                  Color.fromARGB(255, 6, 95, 184),
                  Color.fromARGB(255, 188, 221, 88)
                ]),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: new Icon(
              Icons.call,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Row(),
    );
  }
}
