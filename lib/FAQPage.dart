import 'package:flutter/material.dart';
class FAQPage extends StatelessWidget {
  const FAQPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FAQ') ,
        backgroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // FAQ item 1
          ExpansionTile(
            title: const Text(
              "What is this app about?",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            children: const [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Text(
                  "This app helps you manage your data, view files, and access multiple features efficiently.",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
          const Divider(),

          // FAQ item 2
          ExpansionTile(
            title: const Text(
              "How can I reset my password?",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            children: const [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Text(
                  "Go to the login page, click on 'Forgot Password,' and follow the instructions to reset your password.",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
          const Divider(),

          // FAQ item 3
          ExpansionTile(
            title: const Text(
              "How do I contact support?",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            children: const [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Text(
                  "You can contact support by sending an email to support@example.com or using the 'Contact Us' option in the settings menu.",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
          const Divider(),

          // FAQ item 4
          ExpansionTile(
            title: const Text(
              "Is this app free to use?",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            children: const [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Text(
                  "Yes, this app is completely free to use. However, some advanced features may require a premium subscription.",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


