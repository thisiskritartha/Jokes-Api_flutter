class JokesModelList {
  bool? success;
  List<Body>? body;

  JokesModelList({this.success, this.body});

  JokesModelList.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['body'] != null) {
      body = <Body>[];
      json['body'].forEach((v) {
        body!.add(new Body.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.body != null) {
      data['body'] = this.body!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Body {
  String? sId;
  String? setup;
  String? punchline;
  String? type;
  bool? approved;
  int? date;
  bool? nSFW;

  Body(
      {this.sId,
      this.setup,
      this.punchline,
      this.type,
      this.approved,
      this.date,
      this.nSFW});

  Body.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    setup = json['setup'];
    punchline = json['punchline'];
    type = json['type'];
    approved = json['approved'];
    date = json['date'];
    nSFW = json['NSFW'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['setup'] = this.setup;
    data['punchline'] = this.punchline;
    data['type'] = this.type;
    data['approved'] = this.approved;
    data['date'] = this.date;
    data['NSFW'] = this.nSFW;
    return data;
  }
}
