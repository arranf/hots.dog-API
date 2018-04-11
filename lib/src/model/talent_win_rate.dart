class TalentWinRate {
  final int talent_level;
  final String talent_id;
  final int wins;
  final int losses;

  TalentWinRate(this.talent_level, this.talent_id, this.wins, this.losses);

  factory TalentWinRate.fromJson(Map<dynamic, dynamic> json, String talent_id, int level) {
    if (!(json is Map)) {
      throw new Exception('JSON in unknown format');
    }

    Map map = json;
    if (map.length != 2 ||
        !map.containsKey('Wins') ||
        !map.containsKey('Losses')) {
      throw new Exception('JSON in unexpected format');
    }

    return new TalentWinRate(level, talent_id, map['Wins'] as int, map['Losses'] as int);
  }

  @override
  String toString() {
    return "$talent_id: wins $wins, losses $losses";
  }

  @override
  int get hashCode {
    return this.losses.hashCode ^ 
      this.wins.hashCode ^
      this.talent_level.hashCode ^
      this.talent_id.hashCode;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TalentWinRate &&
          this.losses == other.losses &&
          this.wins == other.wins &&
          this.talent_level == other.talent_level &&
          this.talent_id == other.talent_id;
}
