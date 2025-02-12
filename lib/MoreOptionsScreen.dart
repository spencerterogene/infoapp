import 'package:flutter/material.dart';
import 'EditProfilePage.dart';
//import 'SecurityPage.dart';
//import 'NotificationsPage.dart';
//import 'PrivacyPolicyPage.dart';
import 'FAQPage.dart';
//import 'HelpSupportPage.dart';
import 'SettingsPage.dart';
//import 'BackupPage.dart';
//import 'LanguagePage.dart';
//import 'ReportProblemPage.dart';
import 'RegisterPage.dart';
import 'LoginPage.dart';

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
          _buildSettingsItem(
            context,
            Icons.person,
            'Edit profile',
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => EditProfilePage()),
              );
            },
          ),
          // _buildSettingsItem(
          //   context,
          //   Icons.security,
          //   'Security',
          //   onTap: () {
          //     Navigator.of(context).push(
          //       MaterialPageRoute(builder: (context) => SecurityPage()),
          //     );
          //   },
          // ),
          // _buildSettingsItem(
          //   context,
          //   Icons.notifications,
          //   'Notifications',
          //   onTap: () {
          //     Navigator.of(context).push(
          //       MaterialPageRoute(builder: (context) => NotificationsPage()),
          //     );
          //   },
          // ),
          // _buildSettingsItem(
          //   context,
          //   Icons.privacy_tip,
          //   'Privacy policy',
          //   onTap: () {
          //     Navigator.of(context).push(
          //       MaterialPageRoute(builder: (context) => PrivacyPolicyPage()),
          //     );
          //   },
          // ),
          _buildSectionTitle('Support & About'),
          _buildSettingsItem(
            context,
            Icons.help_outline,
            'FAQ',
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => FAQPage()),
              );
            },
          ),
          // _buildSettingsItem(
          //   context,
          //   Icons.support_agent,
          //   'Help & Support',
          //   onTap: () {
          //     Navigator.of(context).push(
          //       MaterialPageRoute(builder: (context) => HelpSupportPage()),
          //     );
          //   },
          // ),
          // _buildSettingsItem(
          //   context,
          //   Icons.settings,
          //   'Settings',
          //   onTap: () {
          //     Navigator.of(context).push(
          //       MaterialPageRoute(builder: (context) => SettingsPage()),
          //     );
          //   },
          // ),
          // _buildSettingsItem(
          //   context,
          //   Icons.backup,
          //   'Backup in the Cloud',
          //   onTap: () {
          //     Navigator.of(context).push(
          //       MaterialPageRoute(builder: (context) => BackupPage()),
          //     );
          //   },
          // ),
          // _buildSectionTitle('Actions'),
          // _buildSettingsItem(
          //   context,
          //   Icons.language,
          //   'Language',
          //   onTap: () {
          //     Navigator.of(context).push(
          //       MaterialPageRoute(builder: (context) => LanguagePage()),
          //     );
          //   },
          // ),
          // _buildSettingsItem(
          //   context,
          //   Icons.report,
          //   'Report a problem',
          //   onTap: () {
          //     Navigator.of(context).push(
          //       MaterialPageRoute(builder: (context) => ReportProblemPage()),
          //     );
          //   },
          // ),
          _buildSettingsItem(
            context,
            Icons.person_add,
            'Add account',
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => RegisterPage()),
              );
            },
          ),

          _buildSettingsItem(
            context,
            Icons.logout, // Icone de déconnexion
            'Logout',
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
          ),



          // IconButton(
          //   icon: const Icon(Icons.logout, color: Colors.red),
          //   onPressed: () {
          //     Navigator.of(context).push(
          //       MaterialPageRoute(builder: (context) => const LoginPage()),
          //     );
          //   },
          // ),
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

  Widget _buildSettingsItem(
    BuildContext context,
    IconData icon,
    String title, {
    VoidCallback? onTap,
    bool isDestructive = false,
  }) {
    return ListTile(
      leading: Icon(icon, color: isDestructive ? Colors.red : Colors.black),
      title: Text(
        title,
        style: TextStyle(color: isDestructive ? Colors.red : Colors.black),
      ),
      onTap: onTap, // Ajout de l'action onTap
    );
  }
}