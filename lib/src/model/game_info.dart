import 'hero_info.dart';
import 'build_info.dart';
import '../utils.dart';

class GameInfo {
  final List<HeroInfo> heroInfo;
  final List<BuildInfo> buildInfo;
  final List<String> modes;
  final List<String> maps;

  GameInfo(this.heroInfo, this.buildInfo, this.modes, this.maps);

  factory GameInfo.fromJson(Map<dynamic, dynamic> json) {
    if (!(json is Map)) {
      throw new Exception('Unexpected JSON. Expected JSON to be a Map.');
    }

    Map map = json;

    if (!(map['Maps'] is List &&
        map['Modes'] is Map &&
        map['Builds'] is List &&
        map['Heroes'] is List)) {
      throw new Exception('Unexpected JSON for inner property');
    }
    
    List<String> maps = [];
    map['Maps'].forEach((dynamic value) {
      if(value != null && !isBlank(value as String)) {maps.add(((value as String)));}
    });

    List<String> modes = [];
    map['Modes'].values.forEach((dynamic value) {
      if(value != null && !isBlank(value as String)) {modes.add(((value as String)));}
    });

    List<HeroInfo> heroes = [];
    map['Heroes']
        .forEach((dynamic heroJson) => heroes.add(new HeroInfo.fromJson(heroJson as Map<dynamic, dynamic>)));
    List<BuildInfo> builds = [];
    map['Builds']
        .forEach((dynamic buildJson) => builds.add(new BuildInfo.fromJson(buildJson as Map<dynamic, dynamic>)));
    return new GameInfo(heroes, builds, modes, maps);
  }

  @override
  String toString() {
    return 'GameInfo{heroInfo: $heroInfo, maps: $maps, modes: $modes, buildInfo: $buildInfo}';
  }
}
