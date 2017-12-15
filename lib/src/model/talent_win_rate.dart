class TalentWinRate {
  final int talent_level;
  final String talent_id;
  final int wins;
  final int losses;

  TalentWinRate(this.talent_level, this.talent_id, this.wins, this.losses);

  factory TalentWinRate.fromJson(Object json, String talent_id, int level){
    if (!json is Map){
      throw new Exception('JSON in unknown format');
    }

    Map map = json;
    if (map.length != 2 || !map.containsKey('Wins') || !map.containsKey('Losses')){
      throw new Exception('JSON in unexpected format');
    }

    return new TalentWinRate(level, talent_id, map['Wins'], map['Losses']);
  }

  @override
  String toString(){
    return "$talent_id: wins $wins, losses $losses";
  }
}