import 'package:banking_ui/components/reusable_button.dart';
import 'package:banking_ui/constants.dart';
import 'package:banking_ui/data_provider/model/transaction_item.dart';
import 'package:banking_ui/data_provider/transaction_dataprovider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ListItem extends StatelessWidget {
  final TransactionItem transactionItem;
  final int index;

  ListItem({this.transactionItem, this.index});

  BorderRadius _getBorderRadius(CardType cardType) {
    switch (cardType) {
      case CardType.FIRST_N_ONLY:
      case CardType.LAST_N_ONLY:
        return BorderRadius.circular(20);
        break;
      case CardType.FIRST:
        return BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20));
        break;
      case CardType.LAST:
        return BorderRadius.only(
            bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20));
        break;
      default:
        break;
    }
  }

  IconData _getIcon(String transactionType) {
    if (transactionType == "Grocery") {
      return FontAwesomeIcons.cartPlus;
    } else if (transactionType == "Transport") {
      return FontAwesomeIcons.car;
    } else if (transactionType == "Payment") {
      return FontAwesomeIcons.moneyCheck;
    } else if (transactionType == "Phone bill") {
      return FontAwesomeIcons.phone;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(1),
      padding: EdgeInsets.only(left: 20, top: 15, right: 20, bottom: 15),
      decoration: BoxDecoration(
          borderRadius: _getBorderRadius(transactionItem.cardType),
          color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          ReusableButton(
              icon: _getIcon(transactionItem.transactionType),
              onPress: () {
                print("button pressed");
              }),
          SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                transactionItem.transactionType,
                style: TextStyle(
                    fontSize: 15,
                    color: textBody1,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                transactionItem.serviceProvider,
                style: TextStyle(color: textBody2),
              )
            ],
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(
                  transactionItem.payment,
                  style: TextStyle(
                      fontSize: 15,
                      color:
                          transactionItem.isCredited ? greenColor : textBody1,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  transactionItem.date,
                  style: TextStyle(color: textBody2),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
