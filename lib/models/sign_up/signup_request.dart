/// name : "Tams e"
/// email : "Tams3@email.comm"
/// password : "testing123"

class SignUpRequest {
  SignUpRequest({
    final String? name,
    final String? email,
    final String? password,
  }) {
    _name = name;
    _email = email;
    _password = password;
  }

  SignUpRequest.fromJson(dynamic json) {
    _name = json['name'];
    _email = json['email'];
    _password = json['password'];
  }
  String? _name;
  String? _email;
  String? _password;
  SignUpRequest copyWith({
    String? name,
    String? email,
    String? password,
  }) =>
      SignUpRequest(
        name: name ?? _name,
        email: email ?? _email,
        password: password ?? _password,
      );
  String? get name => _name;
  String? get email => _email;
  String? get password => _password;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['email'] = _email;
    map['password'] = _password;
    return map;
  }
}
