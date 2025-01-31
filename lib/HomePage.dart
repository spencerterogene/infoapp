import 'package:flutter/material.dart';
import 'HomeScreen.dart';
import 'SearchScreen.dart';
import 'PostScreen.dart';
import 'MessageScreen.dart';
import 'ProfileScreen.dart';
import 'MoreOptions.dart';

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
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const MoreOptionsPage(),
                  ),
                );
              }),
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
}
