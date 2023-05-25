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
        // leading: Icon(Icons.arrow_back),
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
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            child: Column(
              children: [
                Container(
                  height: 100,
                  // width: 100,
                  decoration: BoxDecoration(
                      color: Colors.deepPurpleAccent,
                      borderRadius: BorderRadius.circular(10)),
                ),
                Positioned(
                  bottom: 48.0,
                  left: 10.0,
                  right: 10.0,
                  child: Card(
                    elevation: 8.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
