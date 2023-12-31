


import 'package:get/get.dart';
import 'package:goapp/utils/app_constants.dart';

class DataService extends GetConnect implements GetxService {

  Future<Response> getData(String uri) async {
    Response response = await get(AppConstants.BASE_URL+uri,
    headers: {
      'Content-Type' : 'application/json'
    }
    );
    return response ;
  }

  Future<Response> postData(String uri,dynamic body) async {
    Response response = await post(AppConstants.BASE_URL+uri ,
        body ,
        headers: {
          'Content-Type' : 'application/json'
        }
    )  ;
    return response ;
  }

  Future<Response> updateData(String uri,dynamic body) async {
    Response response = await put(AppConstants.BASE_URL+uri ,
        body ,
        headers: {
          'Content-Type' : 'application/json'
        }
    )  ;
    return response ;
  }
  Future<Response> deleteData(String uri) async {
  Response response =   await delete(
      AppConstants.BASE_URL+uri,
    headers: {
      "Content-Type" : "application/json"
    });
    return response ;
  }
}