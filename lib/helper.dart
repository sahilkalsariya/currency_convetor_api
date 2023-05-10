import 'dart:convert';
import 'package:http/http.dart' as http;

import 'model.dart';

class Global {
  static String result = "";
}

class APIHelper {
  APIHelper._();
  static APIHelper apiHelper = APIHelper._();
  getCityCurrency() async {
    var uri =
        'https://api.apilayer.com/exchangerates_data/convert?to=${Model
        .toName}&from=${Model.fromName}&amount=${Model.Amount
        .text}&apikey=oG8nENxdrhft11OAMy5xkQbtkY8c4w9I';
    var url = Uri.parse(uri);
    var response = await http.get(url, headers: {"Accept": "application/json"});
    if (response.statusCode == 200) {
      var decodeData = json.decode(response.body);

      Global.result = decodeData['result'].toString();

      print(decodeData);
    } else {
      print(response.statusCode);
    }
  }
}

