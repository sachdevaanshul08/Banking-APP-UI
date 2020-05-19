import 'package:banking_ui/data_provider/model/transaction_item.dart';
import 'package:banking_ui/data_provider/model/transaction_item_list.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

enum CardType { FIRST, FIRST_N_ONLY, MID, LAST, LAST_N_ONLY }

class TransactionDataProvider {
  Future<String> _loadAsset() async {
    return await rootBundle.loadString('assets/data.json');
  }

  Future<TransactionList> getItems() async {
    String response = await _loadAsset();
    TransactionList list = TransactionList.fromJson(jsonDecode(response));
    return list;
  }

  List<TransactionItem> mapToDisplayItems(TransactionList list) {
    List<TransactionItem> displayList = [];
    String currentItem;
    list.data.forEach((element) {
      displayList.add(TransactionItem(
          transactionType: element.transactionType,
          serviceProvider: element.serviceProvider,
          payment: element.payment,
          date: element.date,
          isCredited: element.isCredited,
          isHeaderItem: currentItem != element.date));
      currentItem = element.date;
    });
    displayList.asMap().entries.forEach((element) {
      element.value.cardType = _getCardType(displayList, element.key);
    });
    return displayList;
  }

  CardType _getCardType(List<TransactionItem> transactionItems, int index) {
    if (index + 1 == transactionItems.length) {
      return transactionItems[index].isHeaderItem
          ? CardType.LAST_N_ONLY
          : CardType.LAST;
    } else if (transactionItems[index].isHeaderItem) {
      return transactionItems[index + 1].isHeaderItem
          ? CardType.FIRST_N_ONLY
          : CardType.FIRST;
    } else {
      return transactionItems[index + 1].isHeaderItem
          ? CardType.LAST
          : CardType.MID;
    }
  }
}
