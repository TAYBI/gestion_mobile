import 'package:flutter/material.dart';
import 'edit_client_screen.dart';

class ClientInfoScreen extends StatelessWidget {
  const ClientInfoScreen({Key? key}) : super(key: key);

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
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code),
            label: 'QR Code',
          ),
        ],
      ),
    );
  }
}
