import 'package:banking_ui/components/BlurredChip.dart';
import 'package:banking_ui/components/reused_card.dart';
import 'package:banking_ui/components/settings_cell.dart';
import 'package:banking_ui/data_provider/model/card_data.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../constants.dart';

class Cards extends StatefulWidget {
  static const String id = 'Cards';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Cards> {
  bool isContactLessPayment = false;
  bool isOnlinePayment = false;
  bool isAtmWithdraw = false;
  int _current = 0;
  bool isPhysicalCardSelected = true;
  bool isVirtualCardSelected = false;

  List<Widget> _cardList = [];

  List<Widget> getCards() {
    //get your cards here form webservice
    _cardList.add(ReusedCard(
        cardData: CardData(
            color: 0XFF18284B,
            cardType: "VISA",
            cardNumber: "**** **** **** 4897",
            individualName: "Anshul Sachdeva",
            date: "08/22",
            cvv: "826")));
    _cardList.add(ReusedCard(
      cardData: CardData(
          color: 0xFFAD1457,
          cardType: "MasterCard",
          cardNumber: "**** **** **** **** 9999",
          individualName: "Bohemia",
          date: "08/21",
          cvv: "999"),
    ));
    return _cardList;
  }

  @override
  void initState() {
    super.initState();
    getCards();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15, bottom: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        color: Color(0xffEFF1F5),
      ),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Your Cards",
                  style: TextStyle(
                      letterSpacing: 1,
                      fontWeight: FontWeight.w900,
                      fontSize: 24,
                      color: textBody1),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "1 Physical card, 1 Virtual card",
                  style: TextStyle(color: textBody2),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: <Widget>[
                    BlurredClip(
                      isSelected: isPhysicalCardSelected,
                      title: "Physical Card",
                      onPress: () {
                        setState(() {
                          if (!isPhysicalCardSelected) {
                            isPhysicalCardSelected = true;
                            isVirtualCardSelected = false;
                          }
                        });
                      },
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    BlurredClip(
                      isSelected: isVirtualCardSelected,
                      icon: null,
                      title: "Virtual Card",
                      onPress: () {
                        setState(() {
                          if (!isVirtualCardSelected) {
                            isPhysicalCardSelected = false;
                            isVirtualCardSelected = true;
                          }
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          CarouselSlider(
            items: _cardList,
            options: CarouselOptions(
                enableInfiniteScroll: false,
                aspectRatio: 2.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _cardList.map((t) {
              int index = _cardList.indexOf(t);
              return Container(
                width: 8.0,
                height: 8.0,
                margin:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _current == index
                      ? Color.fromRGBO(0, 0, 0, 0.9)
                      : Color.fromRGBO(0, 0, 0, 0.4),
                ),
              );
            }).toList(),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Card Settings",
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 20,
                        color: textBody1),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SettingsCell(
                    icon: Icons.wifi_tethering,
                    title: "Contactless Payment",
                    status: isContactLessPayment,
                    onChanged: (value) {
                      setState(() {
                        isContactLessPayment = value;
                      });
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SettingsCell(
                    icon: Icons.network_wifi,
                    title: "Online Payment",
                    status: isOnlinePayment,
                    onChanged: (value) {
                      setState(() {
                        isOnlinePayment = value;
                      });
                    },
                  ),
                  SizedBox(height: 10),
                  SettingsCell(
                    icon: Icons.local_atm,
                    title: "ATM Withdraws",
                    status: isAtmWithdraw,
                    onChanged: (value) {
                      setState(() {
                        isAtmWithdraw = value;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
