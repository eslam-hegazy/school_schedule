class TableModel {
  TableModel({
    required this.status,
    required this.exams,
  });
  late final int status;
  late final List<Exams> exams;

  TableModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    exams = List.from(json['exams']).map((e) => Exams.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['exams'] = exams.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Exams {
  Exams({
    required this.id,
    required this.subject,
    required this.grade,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.periodType,
  });
  late final int id;
  late final Subject subject;
  late final Grade grade;
  late final String date;
  late final String startTime;
  late final String endTime;
  late final String periodType;

  Exams.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    subject = Subject.fromJson(json['subject']);
    grade = Grade.fromJson(json['grade']);
    date = json['date'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    periodType = json['periodType'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['subject'] = subject.toJson();
    _data['grade'] = grade.toJson();
    _data['date'] = date;
    _data['start_time'] = startTime;
    _data['end_time'] = endTime;
    _data['periodType'] = periodType;
    return _data;
  }
}

class Subject {
  Subject({
    required this.id,
    required this.name,
  });
  late final int id;
  late final String name;

  Subject.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    return _data;
  }
}

class Grade {
  Grade({
    required this.id,
    required this.name,
  });
  late final int id;
  late final String name;

  Grade.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    return _data;
  }
}
