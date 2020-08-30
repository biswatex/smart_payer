import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {

  final IconData icon;
  final String title;
  final Function onTap;

  const MenuItem({Key key, this.icon, this.title, this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          children: <Widget>[
            Icon(icon, color: Colors.white70, size: 30,),
            SizedBox(width: 20,),
            AutoSizeText(
              title,
              maxLines:1,
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 22,
                fontFamily: 'tahoma',
                color: Colors.white,
              ),
            )

          ],
        ),
      ),
    );
  }
}
