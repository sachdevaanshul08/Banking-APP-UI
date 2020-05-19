import 'package:flutter/material.dart';
import 'dart:ui';

class BlurredClip extends StatelessWidget {
  final bool isSelected;
  final IconData icon;
  final String title;
  final Function onPress;
  final Color color;

  const BlurredClip(
      {this.isSelected, this.icon, this.title, this.onPress, this.color});

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
                        backgroundColor: color,
                      )
                    : null,
                label: Text(title,
                    style: TextStyle(
                        color: Colors.blue.shade900,
                        fontWeight: FontWeight.bold)),
                backgroundColor: Colors.white),
            Positioned.fill(
              left: 0,
              top: 8,
              right: 0,
              bottom: 8,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: isSelected
                      ? Colors.white.withOpacity(0)
                      : Colors.white.withOpacity(0.6),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
