import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../models/data_model.dart';

class DataServices {
  String baseUri = 'http://mark.bslmeiyu.com/api';

  Future<List<DataModel>> getInfo() async {
    String apiUri = '/getplaces';
    http.Response res = await http.get(Uri.parse(baseUri + apiUri));

    try {
      if (res.statusCode == 200) {

        //json -> map:
        List<dynamic> list = json.decode(res.body);
        return list.map((e) => DataModel.fromJson(e)).toList();
      }
      else {
        return <DataModel>[];
      }
    }
    catch (e) {
      debugPrint('Error: services: getPlaces: $e');
      return <DataModel>[];
    }
  }
}
