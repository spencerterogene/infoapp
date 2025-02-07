import 'package:flutter/material.dart';

class MoreOptionsScreen extends StatelessWidget {
  const MoreOptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Planner'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: ListView(
        children: [
          _buildSectionTitle('Account'),
          _buildSettingsItem(Icons.person, 'Edit profile'),
          _buildSettingsItem(Icons.security, 'Security'),
          _buildSettingsItem(Icons.notifications, 'Notifications'),
          _buildSettingsItem(Icons.privacy_tip, 'Privacy policy'),

          _buildSectionTitle('Support & About'),
          _buildSettingsItem(Icons.help_outline, 'FAQ'),
          _buildSettingsItem(Icons.support_agent, 'Help & Support'),
          _buildSettingsItem(Icons.settings, 'Settings'),
          _buildSettingsItem(Icons.backup, 'Backup in the Cloud'),

          _buildSectionTitle('Actions'),
          _buildSettingsItem(Icons.language, 'Language'),
          _buildSettingsItem(Icons.report, 'Report a problem'),
          _buildSettingsItem(Icons.person_add, 'Add account'),
          _buildSettingsItem(Icons.logout, 'Log out', isDestructive: true),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      color: Colors.grey[200],
      child: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildSettingsItem(IconData icon, String title, {bool isDestructive = false}) {
    return ListTile(
      leading: Icon(icon, color: isDestructive ? Colors.red : Colors.black),
      title: Text(title, style: TextStyle(color: isDestructive ? Colors.red : Colors.black)),
      onTap: () {},
    );
  }
}
