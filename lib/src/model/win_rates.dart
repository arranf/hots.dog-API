import 'package:hots_dog_api/src/utils.dart';
import 'win_loss_count.dart';

class WinRates {
  final Map<String, WinLossCount> current;
  final Map<String, WinLossCount> previous;

  WinRates(this.current, this.previous);

  factory WinRates.fromJson(Object json) {
    if (json is Map) {
      var current = new Map<String, WinLossCount>();
      var previous = new Map<String, WinLossCount>();
      if (json['Current'] is Map && json['Previous'] is Map) {
        for (String heroName in json['Current'].keys) {
          var heroWinMap = json['Current'][heroName];
          if (heroWinMap is Map) {
            String newName = mapHeroName(heroName);
            current[newName] = new WinLossCount.fromJson(heroWinMap);
          }
        }
        for (String heroName in json['Previous'].keys) {
          var heroWinMap = json['Previous'][heroName];
          if (heroWinMap is Map) {

            String newName = mapHeroName(heroName);
            previous[newName] = new WinLossCount.fromJson(heroWinMap);
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
