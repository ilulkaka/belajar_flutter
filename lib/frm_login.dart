import 'package:flutter/material.dart';
import 'package:flutter_pertamaq/frm_beranda.dart';

class Frm_login extends StatefulWidget {
  const Frm_login({super.key});

  @override
  State<Frm_login> createState() => _Frm_loginState();
}

class _Frm_loginState extends State<Frm_login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            color: Colors.redAccent,
          ),
          Container(
            child: Column(
              children: [
                Container(
                    height: 200,
                    width: 200,
                    margin: EdgeInsets.all(100),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/1.png'),
                            fit: BoxFit.cover),
                        shape: BoxShape.circle)),
                Container(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 460,
                        width: 490,
                        decoration: BoxDecoration(
                          color: Colors.purpleAccent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      Container(
                        height: 460,
                        width: 500,
                        margin: EdgeInsets.only(top: 20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(20),
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    fontSize: 40, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(20),
                              child: TextField(
                                  decoration: new InputDecoration(
                                hintText: "Masukkan email",
                                labelText: "Email",
                              )),
                            ),
                            Padding(
                              padding: EdgeInsets.all(20),
                              child: TextField(
                                obscureText: true,
                                decoration: new InputDecoration(
                                  hintText: "Masukkan Password",
                                  labelText: "Password",
                                ),
                              ),
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return Beranda();
                                  }));
                                },
                                child: Text(
                                  "GO!",
                                  style: TextStyle(fontSize: 30),
                                ))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
