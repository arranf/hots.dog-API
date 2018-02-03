import 'package:collection/collection.dart';

class BuildStatistics {
  final int total_games_played;
  final num win_rate;
  final List<String> talents_names;

  BuildStatistics(this.total_games_played, this.win_rate, this.talents_names);

  factory BuildStatistics.fromJson(Object json) {
    if (!(json is Map)) {
      throw new Exception('JSON in unexpected format.');
    }
    Map map = json;
    int total_games_played = map['Total'];
    num win_rate = map['Winrate'];
    List<String> talents = map['Build'];
    return new BuildStatistics(total_games_played, win_rate, talents);
  }

  @override
  String toString() {
    return "$total_games_played / ${win_rate*100}";
  }

  @override
  int get hashCode {
    Function hash = const ListEquality().hash;
    return this.total_games_played.hashCode ^
        hash(talents_names) ^
        this.win_rate.hashCode;
  }

  @override
  bool operator == (Object other) 
  {
      Function equals = const ListEquality().equals;
      return identical(this, other) ||
      other is BuildStatistics &&
          this.total_games_played == other.total_games_played &&
          equals(this.talents_names, other.talents_names) &&
          this.win_rate == other.win_rate;
  }
}
