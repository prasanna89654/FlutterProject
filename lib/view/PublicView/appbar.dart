import 'package:flutter/material.dart';
import 'package:project/view/PublicView/complaint_history.dart';
import 'package:project/view/PublicView/historypage.dart';
import 'package:project/view/PublicView/mycomplaintspage.dart/complaintspage.dart';
import 'package:project/view/PublicView/profile_screen.dart';

import 'package:project/widgets/sidebar.dart';

import '../../Riverpod/Models/userModel.dart';
import 'fullnews.dart';
import 'guideliness.dart';
import 'home.dart';

class Appbar extends StatefulWidget {
  Appbar({required this.cindex, super.key});
  int cindex;

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
  UserModel? name;
  getinitdata() {
    getuserdetails().then((value) {
      setState(() {
        name = value;
      });
    });
  }

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
    getinitdata();
    _page1 = Homepage(changePage: _changeTab);
    _page2 = const ComplaintsPage();
    _page3 = const Fullnews();
    _page4 = const profile();
    _pages = [_page1, _page2, _page3, _page4];
    _currentIndex = widget.cindex;
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
          elevation: 0,
          // automaticallyImplyLeading: false,
          title: name == null
              ? SizedBox()
              : Text("Welcome ${name!.name} ${name!.surname}"),
          centerTitle: true,
          titleTextStyle: const TextStyle(
            fontSize: 17,
          ),

          // centerTitle: true,
          backgroundColor: Colors.blue,
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.notifications))
          ],
        ),
        body: _pages[_currentIndex],
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
                Icons.subject,
              ),
              label: 'My Complaints',
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

          iconSize: 29,
          selectedFontSize: 15,
          unselectedFontSize: 13,

          onTap: (index) {
            _changeTab(index);
          },

          showUnselectedLabels: true,

          elevation: 5,
        ));
  }
}
