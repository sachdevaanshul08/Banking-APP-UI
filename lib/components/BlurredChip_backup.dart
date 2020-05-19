import 'package:flutter/material.dart';
import 'dart:ui';

class BlurredClip extends StatelessWidget {
  final bool isSelected;
  final IconData icon;
  final String title;
  final Function onPress;

  const BlurredClip({this.isSelected, this.icon, this.title, this.onPress});

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: InkWell(
        onTap: () {
          print("$title pressed");
          onPress();
        },
        child: Stack(
          children: <Widget>[
            Chip(
              padding: EdgeInsets.only(left: 10, right: 10),
                avatar: icon != null
                    ? CircleAvatar(
                        child: Icon(icon),
                      )
                    : null,
                label: Text(title,
                    style: TextStyle(
                        color: Colors.blue.shade900,
                        fontWeight: FontWeight.bold)),
                backgroundColor: Colors.white),
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: isSelected ? 0.0 : 0.9,
                  sigmaY: isSelected ? 0.0 : 0.9,
                ),
                child: Container(
                  decoration: BoxDecoration(color: Colors.black.withOpacity(0)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
