/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYzMjE5YTg2YmI1NDQ1Yzk5ZDYxODhiYiIsImlhdCI6MTY2MzMxNzk5NH0.PRu6TE7xp-QRrNwMZDNAKy1-HiTQdBCmEx1SjVnIvnI"
/// type : "user"
/// _id : "63219a86bb5445c99d6188bb"
/// name : "Tams e"
/// email : "Tams3@email.com"
/// password : "$2a$08$65TUhjIz/BkYI3uR.2rTjeCGyW8EQYokJnmaji/z3q1FXAgXyMN9m"
/// address : ""
/// __v : 0

class SignInRes {
  SignInRes({
    String? token,
    String? type,
    String? id,
    String? name,
    String? email,
    String? password,
    String? address,
    num? v,
  }) {
    _token = token;
    _type = type;
    _id = id;
    _name = name;
    _email = email;
    _password = password;
    _address = address;
    _v = v;
  }

  SignInRes.fromJson(dynamic json) {
    _token = json['token'];
    _type = json['type'];
    _id = json['_id'];
    _name = json['name'];
    _email = json['email'];
    _password = json['password'];
    _address = json['address'];
    _v = json['__v'];
  }
  String? _token;
  String? _type;
  String? _id;
  String? _name;
  String? _email;
  String? _password;
  String? _address;
  num? _v;
  SignInRes copyWith({
    String? token,
    String? type,
    String? id,
    String? name,
    String? email,
    String? password,
    String? address,
    num? v,
  }) =>
      SignInRes(
        token: token ?? _token,
        type: type ?? _type,
        id: id ?? _id,
        name: name ?? _name,
        email: email ?? _email,
        password: password ?? _password,
        address: address ?? _address,
        v: v ?? _v,
      );
  String? get token => _token;
  String? get type => _type;
  String? get id => _id;
  String? get name => _name;
  String? get email => _email;
  String? get password => _password;
  String? get address => _address;
  num? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = _token;
    map['type'] = _type;
    map['_id'] = _id;
    map['name'] = _name;
    map['email'] = _email;
    map['password'] = _password;
    map['address'] = _address;
    map['__v'] = _v;
    return map;
  }
}
