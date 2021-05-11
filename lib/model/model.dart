class UrlModel {
  int id;
  String username;
  String fname;
  String lname;
  String ip;

  UrlModel({this.id, this.username, this.fname, this.lname, this.ip});

  factory UrlModel.fromJson(dynamic json) {
    return UrlModel(
        id: json['id'] as int,
        username: json['username'] as String,
        fname: json['fname'] as String,
        lname: json['lname'] as String,
        ip: json['ip'] as String);
  }
}
