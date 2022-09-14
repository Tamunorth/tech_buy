class LaravelError {
  String? msg;
  String? message;
  int? code;
  bool? success;
  Errors? errors;

  LaravelError({this.msg, this.code, this.success, this.errors, this.message});

  LaravelError.fromJson(Map<String, dynamic> json) {
    if (json["msg"] is String) {
      msg = json["msg"];
    }
    if (json["message"] is String) {
      message = json["message"];
    }
    if (json["code"] is int) {
      code = json["code"];
    }
    if (json["success"] is bool) {
      success = json["success"];
    }
    if (json["errors"] is Map) {
      errors = json["errors"] == null ? null : Errors.fromJson(json["errors"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["msg"] = msg;
    data["code"] = code;
    data["success"] = success;
    if (errors != null) {
      data["errors"] = errors?.toJson();
    }
    return data;
  }
}

class Errors {
  List<String>? email = [];
  List<String>? username = [];
  List<String>? picture = [];
  List<String>? password = [];
  List<String>? amount = [];
  List<String>? code = [];
  List<String>? errorList = [];
  List<String>? ref_code = [];

  Errors({this.email, this.username, this.picture});

  Errors.fromJson(Map<String, dynamic> json) {
    if (json["email"] is List) {
      email = json["email"] == null ? [] : List<String>.from(json["email"]);
    }
    if (json["username"] is List) {
      username =
          json["username"] == null ? [] : List<String>.from(json["username"]);
    }
    if (json["picture"] is List) {
      picture =
          json["picture"] == null ? [] : List<String>.from(json["picture"]);
    }
    if (json["amount"] is List) {
      amount = json["amount"] == null ? [] : List<String>.from(json["amount"]);
    }
    if (json["code"] is List) {
      code = json["code"] == null ? [] : List<String>.from(json["code"]);
    }
    if (json["ref_code"] is List) {
      ref_code =
          json["ref_code"] == null ? [] : List<String>.from(json["ref_code"]);
    }
    if (json["error_list"] is List) {
      errorList = json["error_list"] == null
          ? []
          : List<String>.from(json["error_list"]);
    }
    if (json["password"] is List) {
      password =
          json["password"] == null ? [] : List<String>.from(json["password"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (email != null) {
      data["email"] = email;
    }
    return data;
  }
}
