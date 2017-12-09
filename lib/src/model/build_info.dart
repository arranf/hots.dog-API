class BuildInfo {
  String number;
  DateTime start;
  DateTime end;

  BuildInfo(this.number, start, end) {
    this.start = DateTime.parse(start);
    this.end = DateTime.parse(end);
  }

  factory BuildInfo.fromJson(Object json){
    if (!(json is Map && json['ID'] is String && json['Start'] is String && json['Finish'] is String)) {
      throw new Exception('Unexpected JSON format.');
    }

    return new BuildInfo(json['ID'], json['Start'], json['Finish']);
  }
}