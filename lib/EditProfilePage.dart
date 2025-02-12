import 'package:flutter/material.dart';

class EditProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildTextField('Name', 'Melissa Peters'),
            SizedBox(height: 16),
            _buildTextField('Email', 'melpeters@gmail.com'),
            SizedBox(height: 16),
            _buildTextField('Password', '********', isPassword: true),
            SizedBox(height: 16),
            _buildTextField('Date of Birth', '23/05/1995'),
            SizedBox(height: 16),
            _buildTextField('Country/Region', 'Nigeria'),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                // Ajoutez ici la logique pour enregistrer les modifications
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Changes saved successfully!')),
                );
              },
              child: Text('Save changes'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, String initialValue, {bool isPassword = false}) {
    return TextFormField(
      initialValue: initialValue,
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
    );
  }
}