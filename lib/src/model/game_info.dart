import 'hero_info.dart';
import 'build_info.dart';

class GameInfo {
  final List<HeroInfo> heroInfo;
  final List<BuildInfo> buildInfo;
  final List<String> modes;
  final List<String> maps;

  GameInfo(this.heroInfo, this.buildInfo, this.modes, this.maps);

  factory GameInfo.fromJson(Object json) {
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
    maps.addAll(map['Maps']);
    List<String> modes = [];
    map['Modes'].values.forEach((value) => modes.add(value));
    List<HeroInfo> heroes = [];
    map['Heroes']
        .forEach((heroJson) => heroes.add(new HeroInfo.fromJson(heroJson)));
    List<BuildInfo> builds = [];
    map['Builds']
        .forEach((buildJson) => builds.add(new BuildInfo.fromJson(buildJson)));
    return new GameInfo(heroes, builds, modes, maps);
  }

  @override
  String toString() {
    return 'GameInfo{heroInfo: $heroInfo, maps: $maps, modes: $modes, buildINfo: $buildInfo}';
  }
}
