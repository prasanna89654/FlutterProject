import 'package:flutter/material.dart';

class Guidepage extends StatefulWidget {
  const Guidepage({super.key});

  @override
  State<Guidepage> createState() => _GuidepageState();
}

class _GuidepageState extends State<Guidepage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
    ));
  }
}
