import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_pertamaq/layout_navbar.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List _listdata = [];
  bool _isLoading = true;

  Future _getdata() async {
    try {
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));
      // .get(Uri.parse(
      //     'http://restfull.mecloud.my.id/default/WebService/getSiswa'));
      if (response.statusCode == 200) {
        // print(response.body);
        final data = jsonDecode(response.body);
        setState(() {
          _listdata = data;
          _isLoading = false;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    _getdata();
    // print(_listdata);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _listdata.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(
                      _listdata[index]['title'],
                    ),
                    leading: CircleAvatar(
                      child: Text(
                        _listdata[index]['id'].toString(),
                      ),
                    ),
                    // subtitle: Text(_listdata[index]),
                  ),
                );
              },
            ),

      // home: Scaffold(
      //   body: Layoutnavbar(),
      // ),
    );
  }
}
