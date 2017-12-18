class BuildStatistics {
  final int total_games_played;
  final num win_rate;
  final List<String> talents_names;

  BuildStatistics(this.total_games_played, this.win_rate, this.talents_names);

  factory BuildStatistics.fromJson(Object json) {
    if (!(json is Map)) {
      throw new Exception('JSON in unexpected format.');
    }
    int total_games_played = json['Total'];
    num win_rate = json['Winrate'];
    List<String> talents = json['Build'];
    return new BuildStatistics(total_games_played, win_rate, talents);
  }
}
