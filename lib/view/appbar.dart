import 'package:flutter/material.dart';
import 'package:project/view/fullnews.dart';
import 'package:project/view/guideliness.dart';
import 'package:project/view/home.dart';
// import 'package:project/view/news.dart';
// import 'package:project/view/profile.dart';
import 'package:project/view/profile_screen.dart';
import 'package:project/widgets/sidebar.dart';

class Appbar extends StatefulWidget {
  const Appbar({super.key});

  @override
  State<Appbar> createState() => _AppbarState();
}

class _AppbarState extends State<Appbar> {
  late List<Widget> _pages;
  late Widget _page1;
  late Widget _page2;
  late Widget _page3;
  late Widget _page4;
  late int _currentIndex;
  late Widget _currentPage;

  // int _currentIndex = 0;
  // final screens = [
  //   Homepage(),
  //   Guidepage(),
  //   Fullnews(),
  //   Profilepage(),
  // ];

  // void _onItemTapped(int index) {
  //   setState(() {
  //     _currentIndex = index;
  //   });
  // }

  @override
  void initState() {
    super.initState();
    _page1 = Homepage(changePage: _changeTab);
    _page2 = const Guidepage();
    _page3 = const Fullnews();
    _page4 = const profile();
    _pages = [_page1, _page2, _page3, _page4];
    _currentIndex = 0;
    _currentPage = _page1;
  }

  void _changeTab(int index) {
    setState(() {
      _currentIndex = index;
      _currentPage = _pages[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const sidebar(),
        appBar: AppBar(
          // automaticallyImplyLeading: false,
          title: const Text("Welcome Prasanna Poudel"),
          centerTitle: true,
          titleTextStyle: const TextStyle(
            fontSize: 17,
          ),

          // centerTitle: true,
          backgroundColor: Colors.black,
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.notifications))
          ],
        ),
        body: _currentPage,
        bottomNavigationBar: BottomNavigationBar(
          // ignore: prefer_const_literals_to_create_immutables
          items: [
            const BottomNavigationBarItem(
              icon: Icon(Icons.dashboard),
              label: 'Dashboard',
              // backgroundColor: Colors.red,
            ),
            const BottomNavigationBarItem(
              icon: Icon(
                Icons.rule,
              ),
              label: 'Guidelines',
              // backgroundColor: Colors.red,
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.newspaper_sharp),
              label: 'News',
              // backgroundColor: Colors.red,
            ),
            const BottomNavigationBarItem(
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

          onTap: (index) {
            _changeTab(index);
          },

          showUnselectedLabels: true,

          elevation: 5,
        ));
  }
}
