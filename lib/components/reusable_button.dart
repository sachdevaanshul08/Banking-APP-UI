import 'package:flutter/material.dart';

import '../constants.dart';

class ReusableButton extends StatelessWidget {
  final IconData icon;
  final Function onPress;

  ReusableButton({this.icon, this.onPress});

  @override
  Widget build(BuildContext context) {
    return
        GestureDetector(
          child: Container(
            padding: EdgeInsets.all(12),
            child: Center(child: Icon(icon,size: 20,color: textBody2,)),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          onTap: onPress,
        );
  }
}
