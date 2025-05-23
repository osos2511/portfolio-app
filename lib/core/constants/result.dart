import 'package:info_tech/data/model/contacts/Errors.dart';

sealed class Result<T>{

}
class Success<T> extends Result<T>{
  T data;
  Success({required this.data});
}
class ServerError<T> extends Result<T>{
  String code;
  String message;
  Errors? errors;
  ServerError({required this.message,required this.code,this.errors});
}
class Error<T> extends Result<T>{
  Exception exception;
  Error({required this.exception});
}