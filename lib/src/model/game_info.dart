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

    if (!(json['Maps'] is List &&
        json['Modes'] is Map &&
        json['Builds'] is List &&
        json['Heroes'] is List)) {
      throw new Exception('Unexpected JSON for inner property');
    }

    List<String> maps = [];
    maps.addAll(json['Maps']);
    List<String> modes = [];
    json['Modes'].values.forEach((value) => modes.add(value));
    List<HeroInfo> heroes = [];
    json['Heroes']
        .forEach((heroJson) => heroes.add(new HeroInfo.fromJson(heroJson)));
    List<BuildInfo> builds = [];
    json['Builds']
        .forEach((buildJson) => builds.add(new BuildInfo.fromJson(buildJson)));
    return new GameInfo(heroes, builds, modes, maps);
  }

  @override
  String toString() {
    return 'GameInfo{heroInfo: $heroInfo, maps: $maps, modes: $modes, buildINfo: $buildInfo}';
  }
}
