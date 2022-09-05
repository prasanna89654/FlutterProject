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
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return ListTile(
      leading: ImageIcon(
        AssetImage(
          widget.image,
        ),
        size: 35.55,
        color: Colors.blue,
      ),
      contentPadding: const EdgeInsets.fromLTRB(15, 12, 15, 0),
      title: style(text: widget.text, fontsize: 17),
      onTap: (() {}),
      // trailing:

      trailing: Container(
          width: width * 0.55,
          // color: Colors.red,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            //
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                widget.text1,
                style: TextStyle(
                  fontSize: 17,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          )),
    );
  }
}
