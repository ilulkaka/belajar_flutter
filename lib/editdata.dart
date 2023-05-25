import 'package:flutter/material.dart';
import 'package:flutter_pertamaq/menutiga.dart';
import 'package:http/http.dart' as http;

class Editdata extends StatefulWidget {
  final Map ListData;
  const Editdata({Key? key, required this.ListData}) : super(key: key);

  @override
  State<Editdata> createState() => _EditdataState();
}

class _EditdataState extends State<Editdata> {
  final formKey = GlobalKey<FormState>();
  TextEditingController id = TextEditingController();
  TextEditingController nama = TextEditingController();
  TextEditingController alamat = TextEditingController();
  TextEditingController telp = TextEditingController();
  TextEditingController email = TextEditingController();
  Future _update() async {
    final response = await http.post(
        Uri.parse(
            'http://restfull.mecloud.my.id/default/WebService/updateSiswa'),
        body: {
          'id': id.text,
          'nama': nama.text,
          'alamat': alamat.text,
          'telp': telp.text,
          'email': email.text,
        });
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    id.text = widget.ListData['id'];
    nama.text = widget.ListData['nama'];
    alamat.text = widget.ListData['alamat'];
    telp.text = widget.ListData['telp'];
    email.text = widget.ListData['email'];
    return Scaffold(
        appBar: AppBar(
          title: Text('Edit Data'),
        ),
        body: ListView(
          children: [
            Form(
                key: formKey,
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: nama,
                        decoration: InputDecoration(
                          hintText: 'Nama',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Nama tidak boleh kosong";
                          }
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: alamat,
                        decoration: InputDecoration(
                          hintText: 'Alamat',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Alamat tidak boleh kosong";
                          }
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: telp,
                        decoration: InputDecoration(
                          hintText: 'No Telp',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "No Telp tidak boleh kosong";
                          }
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: email,
                        decoration: InputDecoration(
                          hintText: 'Email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Email tidak boleh kosong";
                          }
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            _update().then((value) {
                              if (value) {
                                final snackBar = SnackBar(
                                  content: const Text('Data berhasil diupdate'),
                                  duration: Duration(seconds: 5),
                                );
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              } else {
                                final snackBar = SnackBar(
                                  content: const Text('Data gagal diupdate'),
                                );
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              }
                            });
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => Menutiga())));
                          }
                        },
                        child: Text('Simpan'),
                      ),
                    ],
                  ),
                )),
          ],
        ));
  }
}
