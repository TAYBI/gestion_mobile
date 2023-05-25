import 'package:flutter/material.dart';
import 'edit_client_screen.dart';

class ClientDetailsScreen extends StatelessWidget {
  final dynamic user;

  ClientDetailsScreen({required this.user});

  Widget _buildListItem(IconData icon, String title, String subtitle) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        title,
        style: TextStyle(fontSize: 14),
      ),
      subtitle: Text(subtitle),
    );
  }

  @override
  Widget build(BuildContext context) {
    final name =
        '${user['name']['first']?.toString() ?? ''} ${user['name']['last']?.toString() ?? ''}';
    final address = user['location']['street']['name']?.toString() ?? '';
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
      _buildListItem(Icons.person, 'Name', name),
      _buildListItem(Icons.location_on, 'Address', address),
      _buildListItem(Icons.location_city, 'City', city),
      _buildListItem(Icons.phone, 'Telephone', '(123) 456-7890'),
      _buildListItem(Icons.phone_android, 'Mobile', mobile),
      _buildListItem(Icons.print, 'Fax', fax),
      _buildListItem(Icons.email, 'Email', email),
      _buildListItem(Icons.format_list_numbered, 'CRN', crn),
      _buildListItem(Icons.credit_card, 'Tax ID', taxId1),
      _buildListItem(Icons.credit_card_outlined, 'Tax ID2', taxId2),
      _buildListItem(
          Icons.monetization_on, 'Starting Balance', startingBalance),
      _buildListItem(Icons.trending_up, 'Turnover', turnover),
      _buildListItem(Icons.payment, 'Payment', payment),
      _buildListItem(Icons.credit_card, 'Credit', credit),
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

  // @override
  // Widget build(BuildContext context) {
  //   final name = '${user['name']['first']} ${user['name']['last']}';
  //   final pictureUrl = user['picture']['large'];
  //   final email = user['email'];
  //   final phone = user['phone'];
  //   final location =
  //       '${user['location']['city']}, ${user['location']['country']}';

  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text('User Details'),
  //     ),
  //     body: Column(
  //       crossAxisAlignment: CrossAxisAlignment.stretch,
  //       children: [
  //         Expanded(
  //           child: Container(
  //             color: Colors.grey[200],
  //             padding: EdgeInsets.all(16),
  //             child: SingleChildScrollView(
  //               child: Column(
  //                 crossAxisAlignment: CrossAxisAlignment.stretch,
  //                 children: [
  //                   Row(
  //                     children: [
  //                       Icon(Icons.business),
  //                       SizedBox(width: 8),
  //                       Text('Raison social'),
  //                     ],
  //                   ),
  //                   SizedBox(height: 8),
  //                   Row(
  //                     children: [
  //                       Icon(Icons.location_on),
  //                       SizedBox(width: 8),
  //                       Text('Adresse'),
  //                     ],
  //                   ),
  //                   SizedBox(height: 8),
  //                   Row(
  //                     children: [
  //                       Icon(Icons.location_city),
  //                       SizedBox(width: 8),
  //                       Text('Ville'),
  //                     ],
  //                   ),
  //                   SizedBox(height: 8),
  //                   Row(
  //                     children: [
  //                       Icon(Icons.phone),
  //                       SizedBox(width: 8),
  //                       Text('Mobile'),
  //                     ],
  //                   ),
  //                   SizedBox(height: 8),
  //                   Row(
  //                     children: [
  //                       Icon(Icons.print),
  //                       SizedBox(width: 8),
  //                       Text('Fax'),
  //                     ],
  //                   ),
  //                   SizedBox(height: 8),
  //                   Row(
  //                     children: [
  //                       Icon(Icons.mail),
  //                       SizedBox(width: 8),
  //                       Text('Email'),
  //                     ],
  //                   ),
  //                   SizedBox(height: 8),
  //                   Row(
  //                     children: [
  //                       Icon(Icons.format_list_numbered),
  //                       SizedBox(width: 8),
  //                       Text('N RC'),
  //                     ],
  //                   ),
  //                   SizedBox(height: 8),
  //                   Row(
  //                     children: [
  //                       Icon(Icons.format_list_numbered),
  //                       SizedBox(width: 8),
  //                       Text('NTVA/NIF'),
  //                     ],
  //                   ),
  //                   SizedBox(height: 8),
  //                   Row(
  //                     children: [
  //                       Icon(Icons.format_list_numbered),
  //                       SizedBox(width: 8),
  //                       Text('NIS'),
  //                     ],
  //                   ),
  //                   SizedBox(height: 8),
  //                   Row(
  //                     children: [
  //                       Icon(Icons.monetization_on),
  //                       SizedBox(width: 8),
  //                       Text('Solde de depart'),
  //                     ],
  //                   ),
  //                   SizedBox(height: 8),
  //                   Row(
  //                     children: [
  //                       Icon(Icons.bar_chart),
  //                       SizedBox(width: 8),
  //                       Text('Chiffre d\'affaire'),
  //                     ],
  //                   ),
  //                   SizedBox(height: 8),
  //                   Row(
  //                     children: [
  //                       Icon(Icons.payment),
  //                       SizedBox(width: 8),
  //                       Text('Regele'),
  //                     ],
  //                   ),
  //                   SizedBox(height: 8),
  //                   Row(
  //                     children: [
  //                       Icon(Icons.credit_card),
  //                       SizedBox(width: 8),
  //                       Text('Credit'),
  //                     ],
  //                   ),
  //                   SizedBox(height: 8),
  //                   Row(
  //                     children: [
  //                       Icon(Icons.family_restroom),
  //                       SizedBox(width: 8),
  //                       Text('Famille'),
  //                     ],
  //                   ),
  //                   SizedBox(height: 8),
  //                   Row(
  //                     children: [
  //                       Icon(Icons.money),
  //                       SizedBox(width: 8),
  //                       Text('Tarif'),
  //                     ],
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
