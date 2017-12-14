library hots_dog.api;

import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:hots_dog_api/src/model/win_rates.dart';
import 'package:hots_dog_api/src/model/game_info.dart';

const String _baseUrl = 'hots.dog';
const String _winRateResource = '/api/get-winrates';
const String _initResource = '/api/init';

bool _isValidBuildNumber(String buildNumber) {
  RegExp regExp = new RegExp(r'\d+\.\d+\.\d+\.\d+');
  Match match = regExp.firstMatch(buildNumber);
  return (match != null && match.group(0) == buildNumber);
}

Map<String, String> _getHeaders() {
  return {
    "Accept": "application/json",
    "Content-Type": "application/json",
    "User-Agent": "arranf (https://github.com/arranf/hots.dog-API)"
  };
}

Future<WinRates> getWinRates(String buildNumber, {String mapName = ''}) async {
  if (!_isValidBuildNumber(buildNumber)){
    throw new Exception('Build number is not a valid build number');
  }
  
  Map<String, String> query = {'build': buildNumber};
  if (mapName != '') {
    query['map'] = mapName; 
  }

  Uri uri = new Uri.https(_baseUrl, _winRateResource, query);
  http.Response response = await http.get(uri, headers: _getHeaders());
  if (response.statusCode != 200) {
    return null;
  }
  dynamic jsonData = JSON.decode(response.body);
  return new WinRates.fromJson(jsonData);
 }

 Future<GameInfo> getGameInfo() async {
   Uri uri = new Uri.https(_baseUrl, _initResource);
   http.Response response = await http.get(uri, headers: _getHeaders());
   if (response.statusCode != 200) {
     return null;
   }
   dynamic jsonData = JSON.decode(response.body);
   GameInfo gameInfo = new GameInfo.fromJson(jsonData);
   return gameInfo;
 }

