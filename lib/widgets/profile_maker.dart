import 'package:flutter/material.dart';
import '../widgets/style.dart';

class pmaker extends StatefulWidget {
  pmaker({
    Key? key,
    required this.image,
    required this.text,
    required this.text1,
  }) : super(key: key);

  String image;
  String text;
  String text1;

  @override
  State<pmaker> createState() => _pmakerState();
}

class _pmakerState extends State<pmaker> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ImageIcon(
        AssetImage(
          widget.image,
        ),
        size: 40,
        color: Colors.blue,
      ),
      contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      title: style(text: widget.text, fontsize: 17),
      onTap: (() {}),
      trailing: Text(
        widget.text1,
        style: TextStyle(
          fontSize: 17,
        ),
      ),
    );
  }
}
