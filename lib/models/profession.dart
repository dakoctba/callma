class Profession {
  int id;
  String title;
  String subtitle;
  String description;
  String icon;

  Profession({this.id, this.title, this.subtitle, this.description, this.icon});

  Profession.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    subtitle = json['subtitle'];
    description = json['description'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['subtitle'] = this.subtitle;
    data['description'] = this.description;
    data['icon'] = this.icon;
    return data;
  }
}
