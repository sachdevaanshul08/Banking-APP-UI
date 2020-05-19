import 'package:banking_ui/components/reusable_button.dart';
import 'package:flutter/material.dart';

class ReusableButtonWithText extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function onPress;

  ReusableButtonWithText({this.title, this.icon, this.onPress});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ReusableButton(
          icon: icon,
          onPress: onPress,
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          title,
          style: TextStyle(
              color: Color(0xA6FFFFFF),
              fontSize: 12,),
        )
      ],
    );
  }
}
