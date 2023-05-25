import 'package:flutter/material.dart';
import 'package:flutter_pertamaq/menudua.dart';
import 'package:flutter_pertamaq/menuempat.dart';
import 'package:flutter_pertamaq/menusatu.dart';
import 'package:flutter_pertamaq/menutiga.dart';

class Layoutnavbar extends StatefulWidget {
  const Layoutnavbar({super.key});

  @override
  State<Layoutnavbar> createState() => _LayoutnavbarState();
}

class _LayoutnavbarState extends State<Layoutnavbar> {
  int _currentIndex = 0;
  final List _children = [Menusatu(), Menudua(), Menutiga(), Menuempat()];

  var index;

  void onBarTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: _children[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) => onBarTapped(index),
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.grey,
          items: [
            const BottomNavigationBarItem(
                icon: Icon(Icons.home), label: "Home"),
            const BottomNavigationBarItem(
                icon: Icon(Icons.person), label: 'About'),
            const BottomNavigationBarItem(
                icon: Icon(Icons.grid_3x3_outlined), label: 'Product'),
            const BottomNavigationBarItem(
                icon: Icon(Icons.trip_origin), label: 'test'),
          ],
        ),
      ),
    );
  }
}
