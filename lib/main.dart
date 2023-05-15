// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'client_screen.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: MyApp(),
  ));
}

extension StringExtension on String {
  String capitalize() {
    // ignore: unnecessary_this
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final List<IconData> _icons = [
    Icons.dashboard,
    Icons.shopping_basket,
    Icons.people,
    Icons.format_quote,
    Icons.local_shipping,
    Icons.receipt,
    Icons.receipt_long,
    Icons.supervisor_account,
    Icons.attach_money,
    Icons.payment,
    Icons.account_balance,
    Icons.insert_chart,
  ];

  final List<MaterialColor> _colors = [
    Colors.blue,
    Colors.green,
    Colors.purple,
    Colors.amber,
    Colors.teal,
    Colors.red,
    Colors.orange,
    Colors.indigo,
    Colors.cyan,
    Colors.deepPurple,
    Colors.lime,
    Colors.brown,
  ];

  final List<String> _titles = [
    'Ddashboard',
    'Items',
    'Customers',
    'Qotes',
    'customer orders',
    'Delivery notes',
    'Sales invoice',
    'Vendors',
    'Receipts',
    'Purchase invoice',
    'Treasury',
    'Reports',
  ];

// assign the value to a non-constant variable

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Gestion Mobile",
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            'Gestion Mobile',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        drawer: const Drawer(
          child: Text('Drawer................!!'),
        ),
        body: Column(
          children: [
            Container(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(22.0, 50.0, 22.0, 30.0),
                      child: Card(
                        margin: EdgeInsets.zero,
                        elevation: 0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.arrow_upward),
                                Text(
                                  'T.O(Month)',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Text('\$200'),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(22.0, 50.0, 22.0, 30.0),
                      child: Card(
                        margin: EdgeInsets.zero,
                        elevation: 0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.arrow_downward),
                                Text(
                                  'Purchase(Month)',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Text('\$150'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            ////////////////////////////
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 30.0),
                child: GridView.count(
                  crossAxisCount: 3,
                  padding: EdgeInsets.zero,
                  children: List.generate(
                    12,
                    (index) => GestureDetector(
                      onTap: () {
                        if (index == 2) {
                          // check if the icon with index 3 is clicked
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>
                                  ClientScreen(), // replace AnotherScreen with the name of your screen
                            ),
                          );
                        }
                      },
                      child: Card(
                        color: _colors[index],
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(bottom: 8.0),
                              child: Icon(_icons[index],
                                  color: Colors.white, size: 30.0),
                            ),
                            Text(
                              _titles[index].capitalize(),
                              style: const TextStyle(
                                fontSize: 14.0,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
