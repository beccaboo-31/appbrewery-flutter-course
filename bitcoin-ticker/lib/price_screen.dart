import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'coin_data.dart';
import 'dart:io' show Platform;

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  CoinData coin = new CoinData();
  Map<String, int> coinValues = {};
  String selectedCurrency = 'USD';
  String val = '?';
  String cryptoCurrency = 'BTC';
  bool isWaiting = false;

  void getData() async {
    isWaiting = true;
    Map rates = await coin.getCoinData(selectedCurrency);
    isWaiting = false;
    setState(() {
      coinValues = rates;
    });
  }

  DropdownButton getDropDown() {
    List<DropdownMenuItem> items = [];
    for (String currency in currenciesList) {
      var newItem = DropdownMenuItem(child: Text(currency), value: currency);
      items.add(newItem);
    }

    return DropdownButton(
      value: selectedCurrency,
      items: items,
      onChanged: (value) async {
        setState(() {
          selectedCurrency = value;
          getData();
        });
      });
  }

  CupertinoPicker getPicker() {
    List<Text> items = [];
    for (String currency in currenciesList) {
      items.add(Text(currency));
    }

    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) {
        print(selectedIndex);
        setState(() {
          selectedCurrency = currenciesList[selectedIndex];
          getData();
        });
      },
      children: items,
    );
  }

  List<CryptoCard> generateCryptoCard() {
    List<CryptoCard> cryptoCards = [];
    for (String cryptoCurrency in cryptoList) {
      cryptoCards.add(CryptoCard(
          exchangeRate: isWaiting ? val : coinValues[cryptoCurrency].toString(),
          selectedCurrency: selectedCurrency,
          cryptoCurrency: cryptoCurrency));
    }
    return cryptoCards;
  }

  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: generateCryptoCard(),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Platform.isIOS
                ? getPicker()
                : getDropDown(), //Check the platform and then return the picker or Dropdown
          ),
        ],
      ),
    );
  }
}

class CryptoCard extends StatelessWidget {
  const CryptoCard(
      {@required this.exchangeRate,
      @required this.selectedCurrency,
      @required this.cryptoCurrency});

  final String exchangeRate;
  final String selectedCurrency;
  final String cryptoCurrency;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        color: Colors.lightBlueAccent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Text(
            '1 $cryptoCurrency = $exchangeRate $selectedCurrency',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
