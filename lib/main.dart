// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'clients_screen.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

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

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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

  List<String> dropdownItems = [
    "Devi",
    "Commande Client",
    "Bon de livraison",
    "Retour client",
    "Facture de vente",
    "Avoir client",
  ];

  String dropdownValue = "Devi"; // assign the value to a non-constant variable

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
        drawer: Drawer(
          child: Container(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                // IconButton(
                //   icon: Icon(Icons.settings),
                //   onPressed: () {
                //     // handle icon button tap
                //   },
                // ),
                UserAccountsDrawerHeader(
                  accountName: Text("John Doe"),
                  accountEmail: Text("johndoe@example.com"),
                  currentAccountPicture: CircleAvatar(
                    child: Text("JD"),
                  ),
                  otherAccountsPictures: [
                    IconButton(
                      icon: Icon(
                        Icons.settings,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        // handle icon button tap
                      },
                    ),
                  ],
                ),
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text("Accueil"),
                  onTap: () {
                    // handle onTap
                  },
                ),
                ListTile(
                  leading: Icon(Icons.dashboard),
                  title: Text("Tableau de board"),
                  onTap: () {
                    // handle onTap
                  },
                ),
                ListTile(
                  leading: Icon(Icons.article),
                  title: Text("Article"),
                  onTap: () {
                    // handle onTap
                  },
                ),
                ExpansionTile(
                  leading: Icon(Icons.shopping_cart),
                  title: Text("Vents"),
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 40),
                      child: ListTile(
                        leading: Icon(Icons.list_alt),
                        title: Text("Devi"),
                        onTap: () {
                          // handle onTap
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 40),
                      child: ListTile(
                        leading: Icon(Icons.shopping_bag),
                        title: Text("Commande Client"),
                        onTap: () {
                          // handle onTap
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 40),
                      child: ListTile(
                        leading: Icon(Icons.local_shipping),
                        title: Text("Bon de livraison"),
                        onTap: () {
                          // handle onTap
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 40),
                      child: ListTile(
                        leading: Icon(Icons.reply),
                        title: Text("Retour client"),
                        onTap: () {
                          // handle onTap
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 40),
                      child: ListTile(
                        leading: Icon(Icons.receipt),
                        title: Text("Facture de vente"),
                        onTap: () {
                          // handle onTap
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 40),
                      child: ListTile(
                        leading: Icon(Icons.receipt_long),
                        title: Text("Avoir client"),
                        onTap: () {
                          // handle onTap
                        },
                      ),
                    ),
                  ],
                ),
                ExpansionTile(
                  leading: Icon(Icons.shopping_bag),
                  title: Text("Achats"),
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 40),
                      child: ListTile(
                        leading: Icon(Icons.playlist_add),
                        title: Text("Bon de commande"),
                        onTap: () {
                          // handle onTap
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 40),
                      child: ListTile(
                        leading: Icon(Icons.local_shipping),
                        title: Text("Bon de reception"),
                        onTap: () {
                          // handle onTap
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 40),
                      child: ListTile(
                        leading: Icon(Icons.reply),
                        title: Text("Retour fournisseur"),
                        onTap: () {
                          // handle onTap
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 40),
                      child: ListTile(
                        leading: Icon(Icons.receipt),
                        title: Text("Facture d'achat"),
                        onTap: () {
                          // handle onTap
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 40),
                      child: ListTile(
                        leading: Icon(Icons.receipt_long),
                        title: Text("Avoir fournisseur"),
                        onTap: () {
                          // handle onTap
                        },
                      ),
                    ),
                  ],
                ),
                ListTile(
                  leading: Icon(Icons.people),
                  title: Text("Clients"),
                  onTap: () {
                    // handle onTap
                  },
                ),
                ListTile(
                  leading: Icon(Icons.business),
                  title: Text("Fournisseurs"),
                  onTap: () {
                    // handle onTap
                  },
                ),
                ListTile(
                  leading: Icon(Icons.attach_money),
                  title: Text("Tresorerie"),
                  onTap: () {
                    // handle onTap
                  },
                ),
                ListTile(
                  leading: Icon(Icons.table_chart),
                  title: Text("Tables"),
                  onTap: () {
                    // handle onTap
                  },
                ),
                ListTile(
                  leading: Icon(Icons.receipt),
                  title: Text("Rapports"),
                  onTap: () {
                    // handle onTap
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.logout,
                    color: Colors.red,
                  ),
                  title: Text("Quitter"),
                  onTap: () {
                    // handle onTap
                  },
                ),
              ],
            ),
          ),
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
                                  ClientsScreen(), // replace AnotherScreen with the name of your screen
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
