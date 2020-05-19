import '../transaction_dataprovider.dart';

class TransactionItem {
  String transactionType;
  String serviceProvider;
  String payment;
  String date;
  bool isCredited;
  bool isHeaderItem;
  CardType cardType;

  TransactionItem(
      {this.transactionType,
      this.serviceProvider,
      this.payment,
      this.date,
      this.isCredited,
      this.isHeaderItem,
      this.cardType});

  TransactionItem.fromJson(Map<String, dynamic> json) {
    transactionType = json['transactionType'];
    serviceProvider = json['serviceProvider'];
    payment = json['payment'];
    date = json['date'];
    isCredited = json['isCredited'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['transactionType'] = this.transactionType;
    data['serviceProvider'] = this.serviceProvider;
    data['payment'] = this.payment;
    data['date'] = this.date;
    data['isCredited'] = this.isCredited;
    return data;
  }
}
