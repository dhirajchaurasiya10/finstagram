import 'package:finstagram/pages/feed_page.dart';
import 'package:finstagram/pages/profile_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _currentPage=0;
  final List<Widget> _pages = [
    FeedPage(),
    ProfilePage(), 
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Finstagram",
        ),
        backgroundColor: Colors.red,
        // backgroundColor: Colors.red,
        actions: [
          GestureDetector(
            onTap: () {},
            child: Icon(Icons.add_a_photo),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 8.0,
              right: 8.0,
            ),
            child: GestureDetector(
              onTap: () {},
              child: Icon(Icons.logout),
            ),
          ),
        ],
      ),
      bottomNavigationBar: _bottomNavigationBar(),
      body: _pages[_currentPage],
    );
  }

  Widget _bottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _currentPage,
      onTap: (_index){
        setState(() {
          _currentPage = _index;
        });
      } ,
      items: [
      BottomNavigationBarItem(
          label: 'Feed',
          icon: Icon(
            Icons.feed,
          )),
      BottomNavigationBarItem(
          label: 'Profile',
          icon: Icon(
            Icons.account_box,
          )),
    ]);
  }
}
