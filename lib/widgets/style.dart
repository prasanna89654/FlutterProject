import 'package:flutter/material.dart';

class style extends StatefulWidget {
  style({
    Key? key,
    required this.text,
    required this.fontsize,
    this.fontweight,
  }) : super(key: key);

  String text;
  double fontsize;
  String? fontweight;

  @override
  State<style> createState() => _styleState();
}

class _styleState extends State<style> {
  @override
  Widget build(BuildContext context) {
    return Text(widget.text,
        style: TextStyle(
          fontSize: widget.fontsize,
          fontWeight: FontWeight.bold,

          // fontWeight: FontWeight.(widget.fontweight),
        ));
  }
}
