import 'package:dio/dio.dart';

abstract class Failure {
  final String errMassage;

  const Failure(this.errMassage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMassage);

  factory ServerFailure.fromDioError(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with ApiService');

      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with ApiService');

      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout with ApiService');

      case DioExceptionType.badCertificate:
        return ServerFailure('BadCertificate timeout with ApiService');

      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioException.response!.statusCode, dioException.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure('Request was canceld with ApiService');
      case DioExceptionType.connectionError:
        return ServerFailure('ConnectionError with ApiService');
      case DioExceptionType.unknown:
        if (dioException.message!.contains('SocketExcaption')) {
          return ServerFailure('No internet Connection');
        }
        return ServerFailure('Unexpected errror,please try again!');
      default:
        return ServerFailure('Opps there was an Error , please try later oky');
    }
  }

  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure('Your request not found , please try later');
    } else if (statusCode == 500) {
      return ServerFailure('Internal server errror , please try later');
    } else {
      return ServerFailure('Opps there was an Error , please try again ');
    }
  }
}
