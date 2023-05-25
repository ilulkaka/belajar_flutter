import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_pertamaq/editdata.dart';
import 'package:flutter_pertamaq/tambahdata.dart';
import 'package:http/http.dart' as http;

class Menutiga extends StatefulWidget {
  const Menutiga({super.key});

  @override
  State<Menutiga> createState() => _MenutigaState();
}

class _MenutigaState extends State<Menutiga> {
  List _listdata = [];
  bool _isLoading = true;

  Future _getdata() async {
    try {
      final response = await http
          // .get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));
          .get(Uri.parse(
              'http://restfull.mecloud.my.id/default/WebService/getSiswa'));
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

  Future _hapus(id) async {
    try {
      final response = await http.post(
          Uri.parse(
              'http://restfull.mecloud.my.id/default/WebService/deleteSiswa'),
          body: {
            'id': id,
          });
      if (response.statusCode == 200) {
        return true;
      }
      return false;
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
        title: Text("List data"),
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _listdata.length,
              itemBuilder: (context, index) {
                return Card(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => Editdata(ListData: {
                                    'id': _listdata[index]['id_siswa'],
                                    'nama': _listdata[index]['nama_siswa'],
                                    'alamat': _listdata[index]['alamat_siswa'],
                                    'telp': _listdata[index]['nomor_telp'],
                                    'email': _listdata[index]['email_siswa'],
                                  }))));
                    },
                    child: ListTile(
                      title: Text(
                        _listdata[index]['nama_siswa'],
                      ),
                      leading: CircleAvatar(
                        child: Text(
                          _listdata[index]['id_siswa'].toString(),
                        ),
                      ),
                      trailing: IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: ((context) {
                                return AlertDialog(
                                  content: Text('Yakin hapus data ?'),
                                  actions: [
                                    ElevatedButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text('Batal')),
                                    ElevatedButton(
                                        onPressed: () {
                                          _hapus(_listdata[index]['id_siswa'])
                                              .then((value) {
                                            if (value) {
                                              final snackBar = SnackBar(
                                                content: const Text(
                                                    'Data berhasil dihapus'),
                                              );
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(snackBar);
                                            } else {
                                              final snackBar = SnackBar(
                                                content: const Text(
                                                    'Data gagal dihapus'),
                                              );
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(snackBar);
                                            }
                                          });
                                          Navigator.pushAndRemoveUntil(
                                              context,
                                              MaterialPageRoute(
                                                  builder: ((context) =>
                                                      Menutiga())),
                                              (route) => false);
                                        },
                                        child: Text('Hapus'))
                                  ],
                                );
                              }),
                            );
                          },
                          icon: Icon(Icons.delete)),
                      // subtitle: Text(_listdata[index]),
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
          child: Text(
            '+',
            style: TextStyle(fontSize: 30),
          ),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: ((context) => TambahData())));
          }),

      // home: Scaffold(
      //   body: Layoutnavbar(),
      // ),
    );
  }
}
