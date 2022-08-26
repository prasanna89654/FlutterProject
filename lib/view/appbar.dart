import 'package:flutter/material.dart';
import 'package:project/view/guideliness.dart';
import 'package:project/view/home.dart';
import 'package:project/view/news.dart';
import 'package:project/view/profile.dart';
import 'package:project/widgets/sidebar.dart';

class Appbar extends StatefulWidget {
  const Appbar({super.key});

  @override
  State<Appbar> createState() => _AppbarState();
}

class _AppbarState extends State<Appbar> {
  int _currentIndex = 0;
  final screens = [
    Homepage(),
    Guidepage(),
    Newspage(),
    Profilepage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: sidebar(),
        appBar: AppBar(
          // automaticallyImplyLeading: false,
          title: Text("Complaint Management System"),
          titleTextStyle: TextStyle(
            fontSize: 17,
          ),

          // centerTitle: true,
          backgroundColor: Color.fromARGB(255, 121, 102, 72),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.notifications))
          ],
        ),
        body: screens[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          // ignore: prefer_const_literals_to_create_immutables
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard),
              label: 'Dashboard',
              // backgroundColor: Colors.red,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.rule,
              ),
              label: 'Guidelines',
              // backgroundColor: Colors.red,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.newspaper_sharp),
              label: 'News',
              // backgroundColor: Colors.red,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_box_rounded),
              label: 'Profile',
              // backgroundColor: Colors.red,
            ),
          ],

          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,

          selectedItemColor: Colors.blue,

          iconSize: 30,
          selectedFontSize: 18,
          unselectedFontSize: 13,

          onTap: _onItemTapped,

          showUnselectedLabels: true,

          elevation: 5,
        ));
  }
}
