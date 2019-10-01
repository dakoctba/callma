class Feeling {
  int count;
  double percent;

  Feeling({this.count, this.percent});

  Feeling.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    percent = (json['percent'] as int).toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['percent'] = this.percent;
    return data;
  }
}
