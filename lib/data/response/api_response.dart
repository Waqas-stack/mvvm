import 'package:mvvm_arch/data/response/status.dart';

class ApiResponses<T>{
  Status? status;
  T? data;
  String? message;
  ApiResponses(this.status,this.message,this.data);

  ApiResponses.loading(): status=Status.loading;

  ApiResponses.completed(): status=Status.completed;

  ApiResponses.error(): status=Status.Error;
@override
  String toString(){
  return "status::$status /n Message:$message /n Data:$data";
}

}