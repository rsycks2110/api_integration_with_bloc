
import 'dart:convert';
import 'dart:io';

import 'package:api_integration_with_bloc/exception_handling/app_exceptions.dart';
import 'package:http/http.dart' as httpClient;

class ApiHelper{
  Future<dynamic> getApi({required String Url}) async {
    var uri = Uri.parse(Url);
try{
    var res= await httpClient.get(uri);
    return JsonResponseReturn(res);
}  on SocketException catch(e){
     throw(FetchDataException(errorMsg: " Network Error"));
    }

  }

  Future<dynamic> postApi({required String Url, required bodyParams}) async{
    var uri= Uri.parse(Url);
    var response= await  httpClient.post(uri,body: bodyParams?? {});
    if(response.statusCode==200) {
      var mData = response.body;
      return mData;
    } else{
      return null;
    }
  }

  dynamic JsonResponseReturn(httpClient.Response response){
    // if (response.statusCode == 200) {
    //   var mData = jsonDecode(response.body);
    //   return mData;
    // } else {
    //   return null;
    // }
    switch(response.statusCode){
      case 200: {
        var mData= jsonDecode(response.body);
        return mData;
      }
      case 400:
     throw BadRequestException(errorMsg: response.body.toString());
     break;

      case 401:
      case 403: throw UnauthorisedException(errorMsg: response.body.toString());
      break;
      case 500:
      default:
        throw FetchDataException(errorMsg: "Error Occured While Communication With Server with Status Code:${response.statusCode}");


    }


  }


}