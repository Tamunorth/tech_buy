import 'package:dio/dio.dart';

import '../../utils/di.dart';
import 'api_error_model.dart';

/// Helper class for converting [DioError] into readable formats
class ApiError {
  int? errorType = 0;
  ApiErrorModel? apiErrorModel;

  /// description of error generated this is similar to convention [Error.message]
  String? errorDescription;

  ApiError({this.errorDescription});

  ApiError.fromDio(Object dioError) {
    _handleError(dioError);
  }

  /// sets value of class properties from [error]
  void _handleError(Object error) {
    if (error is DioError) {
      DioError dioError = error; // as DioError;

      logger.e(dioError.response?.data);
      switch (dioError.type) {
        case DioErrorType.cancel:
          errorDescription = "Request to API server was cancelled";
          break;
        case DioErrorType.connectTimeout:
          errorDescription = "Connection timeout, please try again later";
          break;
        case DioErrorType.other:
          errorDescription = "Connection failed..";
          break;
        case DioErrorType.receiveTimeout:
          errorDescription =
              "Received timeout in connection, please try again later.";
          break;
        case DioErrorType.response:
          if (dioError.response?.statusCode == 401) {
            errorDescription =
                "Your session has timed out, please login again to proceed";
          }
          errorDescription = extractDescriptionFromResponse(dioError.response);
          break;
        case DioErrorType.sendTimeout:
          errorDescription =
              "Connection to failed due to internet connection, please check and try again";
          break;
      }
    } else {
      errorDescription = "Oops an error occurred, we are fixing it";
    }
  }

  /// Handle error responses from statusCode
  String extractDescriptionFromResponse(Response<dynamic>? response) {
    String message = "";
    errorType = response?.statusCode;
    switch (errorType) {
      case 400:
        message = ApiErrorModel.fromJson(response?.data).message!;
        break;
      case 404:
        message = ApiErrorModel.fromJson(response?.data).message!;
        break;
      case 500:
        message = ApiErrorModel.fromJson(response?.data).error!;
        break;
      case 401:
        logger.d('Error Logout: ${response?.data}');
        message = ApiErrorModel.fromJson(response?.data).message!;
        break;
      default:
        message = 'Something went wrong while processing your request.';
    }
    return message;
  }

  @override
  String toString() => '$errorDescription';
}
