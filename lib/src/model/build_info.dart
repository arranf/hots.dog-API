class BuildInfo {
  String number;
  DateTime start;
  DateTime end;

  BuildInfo(this.number, start, end) {
    this.start = DateTime.parse(start);
    this.end = DateTime.parse(end);
  }

  factory BuildInfo.fromJson(Object json) {
    if (!(json is Map &&
        json['ID'] is String &&
        json['Start'] is String &&
        json['Finish'] is String)) {
      throw new Exception('Unexpected JSON format.');
    }
    Map map = json;
    return new BuildInfo(map['ID'], map['Start'], map['Finish']);
  }

  @override
  String toString() {
    return number;
  }
}
