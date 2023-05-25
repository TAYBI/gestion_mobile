import 'package:flutter/material.dart';

class ClientDetailsScreen extends StatelessWidget {
  final dynamic user;

  ClientDetailsScreen({required this.user});

  Widget _buildListItem(IconData icon, String title, String subtitle) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Client'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => EditClient(),
              //   ),
              // );
            },
          ),
        ],
        centerTitle: true,
      ),
      body: ListView(
        children: [
          _buildListItem(Icons.business, 'Company Name', 'Acme Inc.'),
          _buildListItem(Icons.person, 'Name', 'Name 1'),
          _buildListItem(Icons.location_on, 'Address', '123 Main St'),
          _buildListItem(Icons.location_city, 'City', 'Anytown'),
          _buildListItem(Icons.phone, 'Telephone', '(123) 456-7890'),
          _buildListItem(Icons.phone_android, 'Mobile', '(234) 567-8901'),
          _buildListItem(Icons.print, 'Fax', '(345) 678-9012'),
          _buildListItem(Icons.email, 'Email', 'johndoe@example.com'),
          _buildListItem(Icons.format_list_numbered, 'CRN', '123456'),
          _buildListItem(Icons.credit_card, 'Tax ID', '123-45-6789'),
          _buildListItem(Icons.credit_card_outlined, 'Tax ID2', '987-65-4321'),
          _buildListItem(
              Icons.monetization_on, 'Starting Balance', '\$1000.00'),
          _buildListItem(Icons.trending_up, 'Turnover', '\$5000.00'),
          _buildListItem(Icons.payment, 'Payment', '\$500.00'),
          _buildListItem(Icons.credit_card, 'Credit', '\$200.00'),
          _buildListItem(Icons.family_restroom, 'Family', '3'),
        ],
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
