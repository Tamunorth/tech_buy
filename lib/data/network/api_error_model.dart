class ApiErrorModel {
  int? code;
  String? message;
  bool? success;
  String? error;

  ApiErrorModel({this.code, this.message, this.success, this.error});

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) => ApiErrorModel(
      code: json["code"],
      message: json["message"],
      success: json["success"],
      error: json['error']);
}
