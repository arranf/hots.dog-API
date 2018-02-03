import 'package:collection/collection.dart';
import 'package:hots_dog_api/src/model/build_statistics.dart';
import 'talent.dart';
import 'talent_win_rate.dart';

class BuildWinRates {
  final List<TalentWinRate> current;
  final List<TalentWinRate> previous;
  final List<Talent> talents;
  final List<BuildStatistics> popular_builds;
  final List<BuildStatistics> winning_builds;

  BuildWinRates(this.current, this.previous, this.talents, this.popular_builds,
      this.winning_builds);

  factory BuildWinRates.fromJson(Object json) {
    if (!(json is Map)) {
      throw new Exception('Unexpected JSON format.');
    }

    Map map = json;
    List<TalentWinRate> current = new List<TalentWinRate>();
    List<TalentWinRate> previous = new List<TalentWinRate>();
    if (map['Current'] is Map && map['Previous'] is Map) {
      Map currentMap = map['Current'];
      for (var level in currentMap.keys) {
        var levelWinRates = currentMap[level];
        for (var talent_id in levelWinRates.keys) {
          current.add(new TalentWinRate.fromJson(
              levelWinRates[talent_id], talent_id, int.parse(level)));
        }
      }

      Map previousMap = map['Previous'];
      for (var level in previousMap.keys) {
        var levelWinRates = previousMap[level];
        for (var talent_id in levelWinRates.keys) {
          previous.add(new TalentWinRate.fromJson(
              levelWinRates[talent_id], talent_id, int.parse(level)));
        }
      }
    }

    List<Talent> talents = new List<Talent>();

    if (map['Talents'] is Map) {
      for (String key in map['Talents'].keys) {
        talents.add(new Talent.fromJson(map['Talents'][key], key));
      }
    }

    List<BuildStatistics> winning_builds = new List<BuildStatistics>();
    List<BuildStatistics> popular_builds = new List<BuildStatistics>();
    if (map['WinningBuilds'] is List && map['PopularBuilds'] is List) {
      for (Map build in map['WinningBuilds']) {
        winning_builds.add(new BuildStatistics.fromJson(build));
      }
      for (Map build in map['PopularBuilds']) {
        popular_builds.add(new BuildStatistics.fromJson(build));
      }
    }
    BuildWinRates wr = new BuildWinRates(
        current, previous, talents, popular_builds, winning_builds);
    return wr;
  }

  @override
  String toString() {
    return "Winning Builds: $winning_builds";
  }

  @override
  int get hashCode {

    Function hash = const ListEquality().hash;
    return hash(this.current) ^
      hash(this.previous) ^
      hash(this.popular_builds) ^
      hash(this.winning_builds) ^
      hash(this.talents);
  }

  @override
  bool operator ==(Object other) {

    Function equals = const ListEquality().equals;
    return  identical(this, other) ||
      other is BuildWinRates &&
          equals(this.current, other.current) &&
          equals(this.popular_builds, other.popular_builds) &&
          equals(this.previous, other.previous) &&
          equals(this.winning_builds, other.winning_builds) &&
          equals(this.talents, other.talents);

  }
}
