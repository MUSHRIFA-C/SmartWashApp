import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:smartwash/models/allservicesModel.dart';
import 'package:smartwash/widgets/sharedData.dart';

class ServiceController extends GetxController {
  var url = "https://smartwashvklm.com/api/list_api/allservices_types";
  AllServiceModel? allServiceModel;
  PostService() async {
    try {
      var did = await getSavedObject("did");
      print("device id ${did}");
      Dio dio = Dio();
      FormData formData = FormData.fromMap({"device_id": did.toString()});
      Response response = await dio.post(url, data: formData);
      if (response.statusCode == 200) {
        allServiceModel = AllServiceModel.fromJson(jsonDecode(response.data));
        print(allServiceModel!.servicesTypes![0].serviceType);

        return allServiceModel;
      } else {
        print("Error Response");
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
