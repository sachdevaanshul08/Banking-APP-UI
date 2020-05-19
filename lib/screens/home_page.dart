import 'dart:ui';

import 'package:banking_ui/components/BlurredChip.dart';
import 'package:banking_ui/components/ListItemWithHeader.dart';
import 'package:banking_ui/components/circular_image.dart';
import 'package:banking_ui/components/reusable_button_with_text.dart';
import 'package:banking_ui/constants.dart';
import 'package:banking_ui/data_provider/model/transaction_item.dart';
import 'package:banking_ui/data_provider/model/transaction_item_list.dart';
import 'package:banking_ui/data_provider/transaction_dataprovider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  static const String id = 'Home';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isAllSelected = true;
  bool isIncomeSelected = false;
  bool isExpenseSelected = false;
  List<TransactionItem> transactionItems = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    TransactionDataProvider transactionDataProvider = TransactionDataProvider();
    TransactionList transactionList = await transactionDataProvider.getItems();
    setState(() {
      transactionItems =
          transactionDataProvider.mapToDisplayItems(transactionList);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Text('\$2,589.50',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold)),
                ),
                Icon(
                  Icons.notification_important,
                  size: 25,
                  color: Colors.white,
                ),
                CircularImage(image: AssetImage("images/Anshul.jpg"))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20),
            child: Text(
              "Available Balance",
              style: TextStyle(
                fontSize: 12,
                color: Colors.white.withOpacity(0.6),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 20.0, right: 20.0, top: 20.0, bottom: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                ReusableButtonWithText(
                    title: "Send",
                    icon: FontAwesomeIcons.solidPaperPlane,
                    onPress: () {
                      print("button pressed");
                    }),
                ReusableButtonWithText(
                    title: "Request",
                    icon: FontAwesomeIcons.commentDollar,
                    onPress: () {
                      print("button pressed");
                    }),
                ReusableButtonWithText(
                    title: "Loan",
                    icon: FontAwesomeIcons.handHoldingUsd,
                    onPress: () {
                      print("button pressed");
                    }),
                ReusableButtonWithText(
                    title: "Topup",
                    icon: FontAwesomeIcons.plus,
                    onPress: () {
                      print("button pressed");
                    }),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding:
                  EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
                color: Color(0xffEFF1F5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Recent Transactions",
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 18,
                            color: textBody1),
                      ),
                      Text(
                        "See all",
                        style: TextStyle(color: appBackgroundColor,fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: <Widget>[
                      BlurredClip(
                        isSelected: isAllSelected,
                        title: "All",
                        onPress: () {
                          setState(() {
                            isAllSelected = true;
                            isIncomeSelected = false;
                            isExpenseSelected = false;
                          });
                        },
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      BlurredClip(
                        isSelected: isIncomeSelected,
                        icon: FontAwesomeIcons.arrowCircleDown,
                        title: "Income",
                        onPress: () {
                          setState(() {
                            isAllSelected = false;
                            isIncomeSelected = true;
                            isExpenseSelected = false;
                          });
                        },color: Colors.green.shade900,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      BlurredClip(
                          isSelected: isExpenseSelected,
                          icon: FontAwesomeIcons.arrowCircleUp,
                          title: "Expense",
                          onPress: () {
                            setState(() {
                              isAllSelected = false;
                              isIncomeSelected = false;
                              isExpenseSelected = true;
                            });
                          },color: Colors.red.shade900,),
                    ],
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: transactionItems.length,
                      itemBuilder: (context, index) {
                        return ListItemWithHeader(
                            transactionItem: transactionItems[index],
                            index: index);
                      },
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
