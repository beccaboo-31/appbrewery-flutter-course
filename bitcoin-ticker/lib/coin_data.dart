import 'dart:convert';
import 'package:http/http.dart' as http;

const apiKey = '170AD16A-1034-494E-986B-BBB4A7A23E6F';
const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  Future<Map<String,int>> getCoinData(String currency) async {
    print('Currency chosen: ' + currency);
    Map<String, int> exchangeRates = {};
    for (var cryptoCurrency in cryptoList) {
      http.Response res = await http.get(
          'https://rest.coinapi.io/v1/exchangerate/$cryptoCurrency/$currency/?apikey=$apiKey');
      dynamic body = jsonDecode(res.body);
      print('CryptoCurrency: '+ cryptoCurrency + ' Rate: '+ body['rate'].toString());
      int rate = body['rate'].toInt();
      exchangeRates[cryptoCurrency] = rate;
    }

    return exchangeRates;
  }
}
