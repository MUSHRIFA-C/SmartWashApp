import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:smartwash/models/vehicleModel.dart';
import 'package:smartwash/widgets/sharedData.dart';

class VehicleController extends GetxController {
  var url = "https://smartwashvklm.com/api/list_api/all_vehicle_types";
  VehicleModel? vehicleModel;
  PostService() async {
    try {
      var did = await getSavedObject("did");
      print("device id ${did}");
      Dio dio = Dio();
      FormData formData = FormData.fromMap({"device_id": did.toString()});
      Response response = await dio.post(url, data: formData);
      if (response.statusCode == 200) {
        vehicleModel = VehicleModel.fromJson(jsonDecode(response.data));
        print(vehicleModel!.vehicleTypes![0].vehicleType);

        return vehicleModel;
      } else {
        print("Error Response");
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
