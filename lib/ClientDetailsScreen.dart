import 'package:flutter/material.dart';
import 'edit_client_screen.dart';

class ClientDetailsScreen extends StatefulWidget {
  final dynamic user;

  ClientDetailsScreen({required this.user});

  @override
  _ClientDetailsScreenState createState() => _ClientDetailsScreenState();
}

class _ClientDetailsScreenState extends State<ClientDetailsScreen> {
  int _currentIndex = 0;

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
        '${widget.user['name']['title']?.toString() ?? ''} ${widget.user['name']['first']?.toString() ?? ''} ${widget.user['name']['last']?.toString() ?? ''}';
    final address =
        '${widget.user['location']['street']['name']?.toString() ?? ''} ${widget.user['location']['street']['301']?.toString() ?? ''}';
    final city = widget.user['location']['city']?.toString() ?? '';
    final mobile = widget.user['phone']?.toString() ?? '';
    final fax = widget.user['cell']?.toString() ?? '';
    final email = widget.user['email']?.toString() ?? '';
    final crn = widget.user['id']['value']?.toString() ?? '';
    final taxId1 = widget.user['id']['name']?.toString() ?? '';
    final taxId2 = widget.user['login']['sha256']?.toString() ?? '';
    final startingBalance = widget.user['registered']['date']?.toString() ?? '';
    final turnover = widget.user['dob']['date']?.toString() ?? '';
    final payment = widget.user['registered']['age']?.toString() ?? '';
    final credit = widget.user['login']['password']?.toString() ?? '';
    final family = widget.user['dob']['age']?.toString() ?? '';
    final tariff = widget.user['nat']?.toString() ?? '';
    final pictureUrl = widget.user['picture']['large']?.toString() ?? '';

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

    bool _showEditButtons = false;

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
      body: IndexedStack(
        index: _currentIndex,
        children: [
          ListView.builder(
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) {
              return data[index];
            },
          ),

          Center(
            child: CircleAvatar(
              radius: 100,
              backgroundImage: NetworkImage(pictureUrl),
              backgroundColor: Colors.transparent,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  Positioned(
                    right: -8,
                    child: MaterialButton(
                      shape: CircleBorder(),
                      color: Colors.green,
                      padding: EdgeInsets.all(10),
                      onPressed: () {
                        // Take new picture using selfie camera
                      },
                      child: Icon(
                        Icons.mode_edit,
                        size: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          Center(child: Text('Map')),
          // Add your content for the other pages here
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
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
        ],
      ),
    );
  }
}
// // 
