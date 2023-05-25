import 'package:flutter/material.dart';

class Belajar extends StatefulWidget {
  const Belajar({super.key});

  @override
  State<Belajar> createState() => _BelajarState();
}

class _BelajarState extends State<Belajar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Belajar Flutter'),
      ),
      body: ListView(
        children: [
          Stack(
            children: [
              Column(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(255, 244, 242, 242),
                    ),
                    margin: EdgeInsets.all(10),
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.all(10),
                    child: ListTile(
                        title: Text(
                          'Lisa Lisa',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          '+62 8123 4567 890',
                          style: TextStyle(fontSize: 10),
                        ),
                        leading: CircleAvatar(
                          child: Text(
                            'L',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        trailing: new Icon(Icons.date_range_rounded)),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(255, 244, 242, 242),
                    ),
                    margin: EdgeInsets.all(10),
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.all(10),
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.teal),
                              padding: EdgeInsets.all(10),
                              child: ListTile(
                                title: Text('Silver Card',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                                subtitle: Text(
                                  '2453 **** **** 8798',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 10),
                                ),
                                leading: FlutterLogo(size: 60),
                                trailing: new Icon(Icons.keyboard_arrow_right),
                                iconColor: Colors.white,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(30),
                              child: Text('Amount'),
                            ),
                            Container(
                              padding: EdgeInsets.all(30),
                              child: Text(
                                '\$100.00',
                                style: TextStyle(fontSize: 60),
                              ),
                            ),
                            Container(
                                padding: EdgeInsets.all(30),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.grey),
                                child: TextField(
                                  maxLines: 5,
                                  decoration: new InputDecoration(
                                      hintText: 'Saturday night party'),
                                )),
                            Container(
                              margin: EdgeInsets.only(top: 10, bottom: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color.fromARGB(255, 176, 219, 219)),
                              child: ListTile(
                                  title: Text('Bank fee \$4 will be applied'),
                                  leading: new Icon(Icons.error_outline)),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              child: (Text('Submit')),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
