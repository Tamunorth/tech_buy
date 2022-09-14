/// success : true
/// data : {"name":"Tams e","email":"Tams3@email.com","password":"$2a$08$65TUhjIz/BkYI3uR.2rTjeCGyW8EQYokJnmaji/z3q1FXAgXyMN9m","address":"","_id":"63219a86bb5445c99d6188bb","__v":0}
/// message : "User successfully created"

class SignUpRes {
  SignUpRes({
    bool? success,
    Data? data,
    String? message,
  }) {
    _success = success;
    _data = data;
    _message = message;
  }

  SignUpRes.fromJson(dynamic json) {
    _success = json['success'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _message = json['message'];
  }
  bool? _success;
  Data? _data;
  String? _message;
  SignUpRes copyWith({
    bool? success,
    Data? data,
    String? message,
  }) =>
      SignUpRes(
        success: success ?? _success,
        data: data ?? _data,
        message: message ?? _message,
      );
  bool? get success => _success;
  Data? get data => _data;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    map['message'] = _message;
    return map;
  }
}

/// name : "Tams e"
/// email : "Tams3@email.com"
/// password : "$2a$08$65TUhjIz/BkYI3uR.2rTjeCGyW8EQYokJnmaji/z3q1FXAgXyMN9m"
/// address : ""
/// _id : "63219a86bb5445c99d6188bb"
/// __v : 0

class Data {
  Data({
    String? name,
    String? email,
    String? password,
    String? address,
    String? id,
    num? v,
  }) {
    _name = name;
    _email = email;
    _password = password;
    _address = address;
    _id = id;
    _v = v;
  }

  Data.fromJson(dynamic json) {
    _name = json['name'];
    _email = json['email'];
    _password = json['password'];
    _address = json['address'];
    _id = json['_id'];
    _v = json['__v'];
  }
  String? _name;
  String? _email;
  String? _password;
  String? _address;
  String? _id;
  num? _v;
  Data copyWith({
    String? name,
    String? email,
    String? password,
    String? address,
    String? id,
    num? v,
  }) =>
      Data(
        name: name ?? _name,
        email: email ?? _email,
        password: password ?? _password,
        address: address ?? _address,
        id: id ?? _id,
        v: v ?? _v,
      );
  String? get name => _name;
  String? get email => _email;
  String? get password => _password;
  String? get address => _address;
  String? get id => _id;
  num? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['email'] = _email;
    map['password'] = _password;
    map['address'] = _address;
    map['_id'] = _id;
    map['__v'] = _v;
    return map;
  }
}
