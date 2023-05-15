import 'package:flutter/material.dart';

class ClientScreen extends StatelessWidget {
  const ClientScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Client Screen'),
      ),
      body: Center(
        child: Text('This is another screen.'),
      ),
    );
  }
}
