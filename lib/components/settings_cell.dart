import 'package:banking_ui/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsCell extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function onChanged;
  final bool status;

  SettingsCell({this.icon, this.title, this.status, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(1),
      padding: EdgeInsets.only(left: 20, top: 15, right: 20, bottom: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(
            icon,
            color: textBody2,
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 15,
              color: textBody1,
            ),
          ),
          Expanded(
            child: Align(
                alignment: Alignment.centerRight,
                child: Container(
                  height: 25,
                  width: 45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: status ? Color(0xFF2DA669) : Colors.grey.shade300),
                  child: Switch(
                      materialTapTargetSize: MaterialTapTargetSize.padded,
                    activeThumbImage: AssetImage("images/circle.png"),
                    activeColor: greenColor,
                    inactiveTrackColor: Colors.grey.shade300,
                    value: status,
                    onChanged: (value) {
                      onChanged(value);
                    },
                  ),
                )),
          )
        ],
      ),
    );
  }
}
