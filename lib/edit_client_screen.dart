import 'package:flutter/material.dart';

class EditClient extends StatefulWidget {
  @override
  _EditClientState createState() => _EditClientState();
}

class _EditClientState extends State<EditClient> {
  final _formKey = GlobalKey<FormState>();
  String _companyName = '';
  String _name = '';
  String _address = '';
  String _city = '';
  String _telephone = '';
  String _mobile = '';
  String _fax = '';
  String _email = '';
  String _crn = '';
  String _taxId = '';
  String _taxId2 = '';
  String _startingBalance = '';
  String _turnover = '';
  String _payment = '';
  String _credit = '';
  String _family = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Client'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                // Save the client's information and return to the previous screen
                // You can replace this with your own logic for saving the information
                Navigator.pop(context);
              }
            },
          )
        ],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              _buildTextField('Company Name', Icons.business,
                  (value) => _companyName = value),
              _buildTextField('Name', Icons.person, (value) => _name = value),
              _buildTextField(
                  'Address', Icons.location_on, (value) => _address = value),
              _buildTextField(
                  'City', Icons.location_city, (value) => _city = value),
              _buildTextField(
                  'Telephone', Icons.phone, (value) => _telephone = value),
              _buildTextField(
                  'Mobile', Icons.phone_android, (value) => _mobile = value),
              _buildTextField('Fax', Icons.print, (value) => _fax = value),
              _buildTextField('Email', Icons.email, (value) => _email = value),
              _buildTextField(
                  'CRN', Icons.credit_card, (value) => _crn = value),
              _buildTextField('Tax ID', Icons.confirmation_number,
                  (value) => _taxId = value),
              _buildTextField('Tax ID2', Icons.confirmation_number,
                  (value) => _taxId2 = value),
              _buildTextField('Starting Balance', Icons.attach_money,
                  (value) => _startingBalance = value),
              _buildTextField('Turnover', Icons.monetization_on,
                  (value) => _turnover = value),
              _buildTextField(
                  'Payment', Icons.payment, (value) => _payment = value),
              _buildTextField(
                  'Credit', Icons.credit_card, (value) => _credit = value),
              _buildTextField(
                  'Family', Icons.family_restroom, (value) => _family = value),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
      String label, IconData iconData, Function(String) onChanged) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
          prefixIcon: Icon(iconData),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please enter $label';
          }
          return null;
        },
        onChanged: onChanged,
      ),
    );
  }
}
