import 'package:flutter/material.dart';

class ClientDetailsScreen extends StatelessWidget {
  final dynamic user;

  ClientDetailsScreen({required this.user});

  @override
  Widget build(BuildContext context) {
    final name = '${user['name']['first']} ${user['name']['last']}';
    final pictureUrl = user['picture']['large'];
    final email = user['email'];
    final phone = user['phone'];
    final location =
        '${user['location']['city']}, ${user['location']['country']}';

    return Scaffold(
      appBar: AppBar(
        title: Text('User Details'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            margin: EdgeInsets.all(16),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(pictureUrl),
                ),
                SizedBox(height: 16),
                Text(
                  name,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.grey[200],
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Contact Information',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(email),
                  SizedBox(height: 8),
                  Text(phone),
                  SizedBox(height: 16),
                  Text(
                    'Location',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(location),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
