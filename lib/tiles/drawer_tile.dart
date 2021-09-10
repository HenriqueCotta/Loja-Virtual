import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {
  const DrawerTile(this.icon, this.text, {Key? key}) : super(key: key);

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        child: Container(
          height: 60.0,
          child: Row(
            children: [
              Icon(
                icon,
                size: 32.0,
                color: Colors.black,
              ),
              SizedBox(width: 32.0),
              Text(
                text, style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
