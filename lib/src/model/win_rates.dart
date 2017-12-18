import 'win_loss_count.dart';
import 'dart:convert';

class WinRates {
  final Map<String, WinLossCount> current;
  final Map<String, WinLossCount> previous;

  WinRates(this.current, this.previous);

  factory WinRates.fromJson(Object json) {
    if (json is Map) {
      var current = new Map<String, WinLossCount>();
      var previous = new Map<String, WinLossCount>();
      if (json['Current'] is Map && json['Previous'] is Map) {
        for (String key in json['Current'].keys) {
          var heroWinMap = json['Current'][key];
          if (heroWinMap is Map) {
            current[key] = new WinLossCount.fromJson(heroWinMap);
          }
        }
        for (var key in json['Previous'].keys) {
          var heroWinMap = json['Previous'][key];
          if (heroWinMap is Map) {
            previous[key] = new WinLossCount.fromJson(heroWinMap);
          }
        }
      } else {
        throw new Exception('Unexpected JSON format');
      }
      return new WinRates(current, previous);
    } else {
      throw new Exception('The provided JSON must be a Map.');
    }
  }

  @override
  String toString() {
    String str = "Current:";
    void _iterateMap(String key, WinLossCount value) {
      str += "\n $key: ${value.winPercentange().toStringAsFixed(2)}";
    }

    current.forEach(_iterateMap);
    str += "\n \n Previous:";
    previous.forEach(_iterateMap);
    return str;
  }
}
