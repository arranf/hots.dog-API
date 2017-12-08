class WinLossCount {
  final num wins;
  final num losses;

  WinLossCount(num this.wins, num this.losses);

  num winPercentange() {
    return (wins / (wins + losses)) * 100;
  }

  factory WinLossCount.fromJson(Object json) {
    if (json is Map) {
      return new WinLossCount( json['Wins'], json['Losses']);
    } else {
      throw new Exception('The provided JSON must be a Map.');
    }
  }
}



