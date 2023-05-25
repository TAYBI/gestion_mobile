import 'package:flutter/material.dart';
import 'edit_client_screen.dart';

class ClientDetailsScreen extends StatelessWidget {
  final dynamic user;

  ClientDetailsScreen({required this.user});

  Widget _buildListItem(IconData icon, String title, String subtitle) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.blue,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 14,
          color: Colors.blue,
        ),
      ),
      subtitle: Text(subtitle),
    );
  }

  Widget _buildListItem2(IconData icon, String title, String subtitle) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.blue,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 11,
          color: Colors.blue,
        ),
      ),
      subtitle: Text(subtitle),
    );
  }

  @override
  Widget build(BuildContext context) {
    final name =
        '${user['name']['title']?.toString() ?? ''} ${user['name']['first']?.toString() ?? ''} ${user['name']['last']?.toString() ?? ''}';
    final address =
        '${user['location']['street']['name']?.toString() ?? ''} ${user['location']['street']['301']?.toString() ?? ''}';
    final city = user['location']['city']?.toString() ?? '';
    final mobile = user['phone']?.toString() ?? '';
    final fax = user['cell']?.toString() ?? '';
    final email = user['email']?.toString() ?? '';
    final crn = user['id']['value']?.toString() ?? '';
    final taxId1 = user['id']['name']?.toString() ?? '';
    final taxId2 = user['login']['sha256']?.toString() ?? '';
    final startingBalance = user['registered']['date']?.toString() ?? '';
    final turnover = user['dob']['date']?.toString() ?? '';
    final payment = user['registered']['age']?.toString() ?? '';
    final credit = user['login']['password']?.toString() ?? '';
    final family = user['dob']['age']?.toString() ?? '';
    final tariff = user['nat']?.toString() ?? '';

    List<Widget> data = [
      _buildListItem(Icons.person, 'Nom', name),
      _buildListItem(Icons.location_on, 'Address', address),
      _buildListItem(Icons.location_city, 'Ville', city),
      _buildListItem(Icons.phone, 'Telephone', '(123) 456-7890'),
      _buildListItem(Icons.phone_android, 'Mobile', mobile),
      _buildListItem(Icons.print, 'Fax', fax),
      _buildListItem(Icons.email, 'E.mail', email),
      _buildListItem(Icons.credit_card_outlined, 'N°RC', crn),
      _buildListItem(Icons.credit_card_outlined, 'NTVA/NIF', taxId1),
      _buildListItem(Icons.credit_card_outlined, 'NIS', taxId2),
      _buildListItem2(
          Icons.monetization_on_sharp, 'Solde de depart', startingBalance),
      _buildListItem2(
          Icons.monetization_on_sharp, 'Chiffre d\'affaire', turnover),
      _buildListItem2(Icons.monetization_on_sharp, 'Regle', payment),
      _buildListItem2(Icons.wallet, 'Credit', credit),
      _buildListItem(Icons.family_restroom, 'Family', family),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Client'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditClient(),
                ),
              );
            },
          ),
        ],
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          return data[index];
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Info',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.photo),
            label: 'Photo',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Map',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.qr_code),
          //   label: 'QR Code',
          // ),
        ],
      ),
    );
  }
}
