import 'package:flutter/material.dart';
import 'LoginPage.dart';
import 'HomeScreen.dart';
import 'SearchScreen.dart';
import 'PostScreen.dart';
import 'MessageScreen.dart';
import 'ProfileScreen.dart';
import 'FAQPage.dart';
import 'SettingsPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0; // Track the selected bottom navigation index

  // List of pages corresponding to each bottom navigation item
  final List<Widget> _pages = [
    const HomeScreen(),
    const SearchScreen(),
    const PostScreen(),
    const MessageScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back button press
            if (Navigator.of(context).canPop()) {
              Navigator.of(context).pop(); // Navigate back
            }
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              // Handle more button press
              _showMoreInfoDialog(context);
            },
          ),
        ],
        title: const Center(child: Text('Home Page')),
      ),
      body: _pages[_currentIndex], // Display the selected page
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        selectedItemColor: Colors.blue,
        onTap: (int index) {
          setState(() {
            _currentIndex = index; // Update the selected index
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box),
            label: 'Post',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Message',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  // Function to show a dialog with a list of options (Settings, FAQ, Log Out)
  void _showMoreInfoDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20), // Rounded corners
          ),
          backgroundColor: Colors.blue[50], // Light blue background
          title: Row(
            children: [
              Icon(
                Icons.menu, // Menu icon
                color: Colors.blue,
              ),
              const SizedBox(width: 8), // Space between icon and title
              const Text(
                'More Options',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min, // Make the dialog height dynamic
            children: [
              // Settings item
              ListTile(
                leading: const Icon(Icons.settings, color: Colors.blue),
                title: const Text('Settings'),
                onTap: () {
                  Navigator.of(context).pop(); // Close the dialog
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => SettingsPage(
                        isDarkMode: false, // Provide the appropriate value
                        onThemeChanged: (bool value) {
                          // Handle theme change
                        },
                      ), // Navigate to SettingsPage
                    ),
                  );
                },
              ),
              const Divider(), // Divider line
              // FAQ item
              ListTile(
                leading: const Icon(Icons.help_outline, color: Colors.blue),
                title: const Text('FAQ'),
                onTap: () {
                  Navigator.of(context).pop(); // Close the dialog
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>
                          const FAQPage(), // Navigate to FAQPage
                    ),
                  );
                },
              ),
              const Divider(), // Divider line
              // Log Out item
              ListTile(
                leading: const Icon(Icons.logout, color: Colors.red),
                title: const Text('Log Out'),
                onTap: () {
                  Navigator.of(context).pop(); // Close the dialog
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) =>
                          const LoginPage(), // Navigate to LoginPage
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
