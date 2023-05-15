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
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              _buildTextField('Company Name', (value) => _companyName = value),
              _buildTextField('Name', (value) => _name = value),
              _buildTextField('Address', (value) => _address = value),
              _buildTextField('City', (value) => _city = value),
              _buildTextField('Telephone', (value) => _telephone = value),
              _buildTextField('Mobile', (value) => _mobile = value),
              _buildTextField('Fax', (value) => _fax = value),
              _buildTextField('Email', (value) => _email = value),
              _buildTextField('CRN', (value) => _crn = value),
              _buildTextField('Tax ID', (value) => _taxId = value),
              _buildTextField('Tax ID2', (value) => _taxId2 = value),
              _buildTextField(
                  'Starting Balance', (value) => _startingBalance = value),
              _buildTextField('Turnover', (value) => _turnover = value),
              _buildTextField('Payment', (value) => _payment = value),
              _buildTextField('Credit', (value) => _credit = value),
              _buildTextField('Family', (value) => _family = value),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Save the client's information and return to the previous screen
                    // You can replace this with your own logic for saving the information
                    Navigator.pop(context);
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, Function(String) onChanged) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter $label';
        }
        return null;
      },
      onChanged: onChanged,
    );
  }
}
