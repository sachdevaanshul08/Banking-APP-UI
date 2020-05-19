
import 'package:banking_ui/components/ListItem.dart';
import 'package:banking_ui/data_provider/model/transaction_item.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class ListItemWithHeader extends StatelessWidget {
  final TransactionItem transactionItem;
  final int index;

  ListItemWithHeader({this.transactionItem, this.index});

  @override
  Widget build(BuildContext context) {
    if (transactionItem.isHeaderItem)
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 15,
          ),
          Text(transactionItem.date,style: TextStyle(color: textHeader)),
          SizedBox(
            height: 15,
          ),
          ListItem(
            transactionItem: transactionItem,
            index: index,
          ),
        ],
      );
    else
      return ListItem(
        transactionItem: transactionItem,
        index: index,
      );
  }
}

