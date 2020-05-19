import 'package:banking_ui/data_provider/model/transaction_item.dart';

class TransactionList {
  List<TransactionItem> data;

  TransactionList({this.data});

  TransactionList.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<TransactionItem>();
      json['data'].forEach((v) {
        data.add(new TransactionItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
