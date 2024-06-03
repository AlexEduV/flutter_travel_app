import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class DataServices {
  String baseUri = 'http://mark.bslmeiyu.com/api';

  void getInfo() async {
    String apiUri = '/getplaces';
    http.Response res = await http.get(Uri.parse(baseUri + apiUri));

    try {
      if (res.statusCode == 200) {

        //json -> map:
        List<dynamic> list = json.decode(res.body);
      }
    }
    catch (e) {
      debugPrint('Error: services: getPlaces: $e');
    }
  }
}
