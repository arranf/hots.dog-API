library hots_dog.api;

import 'dart:async';
import 'dart:convert';

import 'package:hots_dog_api/src/model/win_rates.dart';
import 'package:http/http.dart' as http;

const String _baseUrl = 'hots.dog';

const String _winRateUrl = '/api/get-winrates';

Map<String, String> _getHeaders() {
  return {
    "Accept": "application/json",
    "Content-Type": "application/json",
    "User-Agent": "arranf (https://github.com/arranf/hots.dog-API)"
  };
}

Future<WinRates> getWinrates(String buildNumber, [String mapName = '']) async {
  //TODO Check buildNumber is valid
  Map<String, String> query = {'build': buildNumber};
  if (mapName != '') {
    query['map'] = mapName; 
  }

  Uri uri = new Uri.https(_baseUrl, _winRateUrl, query);
  http.Response response = await http.get(uri, headers: _getHeaders());
  if (response.statusCode != 200) {
    return null;
  }
  dynamic jsonData = JSON.decode(response.body);
  WinRates winRates = new WinRates.fromJson(jsonData);
  return winRates;
 }

