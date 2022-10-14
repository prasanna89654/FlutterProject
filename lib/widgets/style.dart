// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class style extends StatefulWidget {
  const style({
    Key? key,
    required this.text,
    required this.fontsize,
    this.fontweight,
  }) : super(key: key);

  final String text;
  final double fontsize;
  final String? fontweight;

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
