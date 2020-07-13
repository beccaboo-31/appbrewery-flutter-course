import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper(this.url);
  String url;

  Future<dynamic> getData() async {
    http.Response res = await http.get(url);
    // print('printing res from network file');
    // print(res.body);
    if (res.statusCode == 200) {
      String data = res.body;
      return jsonDecode(data);
    } else {
      return(res.statusCode);
    }
  }
}
