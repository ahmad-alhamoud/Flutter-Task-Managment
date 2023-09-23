



import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:goapp/services/data_service.dart';
import 'package:goapp/utils/app_constants.dart';

import '../utils/app_constants.dart';

class DataController extends GetxController {

  bool _isLoading = false  ;
  get isLoading => _isLoading ;
  DataService service = DataService() ;

  List<dynamic> _myData = [] ;
  List<dynamic> get myData => _myData ;
 Map <String , dynamic > _singleData = {};
 Map <String , dynamic > get singleData => _singleData ;

  Future<void> getData() async {
   _isLoading = true ;
    Response response = await service.getData(AppConstants.GET_TASKS) ;
    if(response.statusCode == 200 ){
      _myData = jsonDecode(response.body) ;
      if (kDebugMode) {
        print('We Got The Data')  ;
      }

    }
    else {
      if (kDebugMode) {
        print('we did not get any data') ;
      }
    }
    _isLoading = false ;
   update() ;
  }
  Future<void> getSingleData( String id ) async {
    _isLoading = true ;
    Response response = await service.getData(
        AppConstants.GET_TASK+id,
    );
    if(response.statusCode == 200 ){
      if (kDebugMode) {
        print('We Got The Single Data')  ;
      }
      _singleData = jsonDecode(response.body);
      print(_singleData) ;

    }
    else {
      if (kDebugMode) {
        print('we could not get a single data') ;
      }
    }
    _isLoading = false ;
    update() ;
  }
  Future<void> postData(String task , String taskDetail) async {
    _isLoading = true ;
    Response response = await service.postData(
    AppConstants.POST_TASK, {
      'task_name' : task ,
      'task_detail' : taskDetail ,
    }) ;
    if(response.statusCode == 200 ){
      if (kDebugMode) {
        print('Post Data Done') ;
      }

    }
    else {
      if (kDebugMode) {
        print('we did not sent the data') ;
      }
    }
    _isLoading = false ;
    update() ;
  }
  Future<void> updateData(String task , String taskDetail , String id) async {
    _isLoading = true ;
    Response response = await service.updateData(
        AppConstants.UPDATE_TASK+id, {
      'task_name' : task ,
      'task_detail' : taskDetail ,
    }) ;
    if(response.statusCode == 200 ){
      if (kDebugMode) {
        print('Update Data Done') ;
      }

    }
    else {
      if (kDebugMode) {
        print('we could not update the data') ;
      }
    }
    _isLoading = false ;
    update() ;
  }
  Future<void> deleteData(String id) async {
   _isLoading = true ;
   update() ;
   Response response =  await service.deleteData(
      AppConstants.DELETE_TASK+id,
    );
    if (response.statusCode == 200 ) {
      if(kDebugMode){
        print('Delete the data success') ;
      }

    }
    else {
      if (kDebugMode) {
        print('we could not delete the data') ;
      }
    }
   await  Future.delayed(Duration(seconds: 1) , (){

      _isLoading = false ;
      update() ;
    }) ;

  }
}