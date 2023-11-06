class VehicleModel {
  List<VehicleTypes>? vehicleTypes;
  String? statusCode;
  bool? status;

  VehicleModel({this.vehicleTypes, this.statusCode, this.status});

  VehicleModel.fromJson(Map<String, dynamic> json) {
    if (json['vehicle_types'] != null) {
      vehicleTypes = <VehicleTypes>[];
      json['vehicle_types'].forEach((v) {
        vehicleTypes!.add(new VehicleTypes.fromJson(v));
      });
    }
    statusCode = json['status_code'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.vehicleTypes != null) {
      data['vehicle_types'] =
          this.vehicleTypes!.map((v) => v.toJson()).toList();
    }
    data['status_code'] = this.statusCode;
    data['status'] = this.status;
    return data;
  }
}

class VehicleTypes {
  dynamic id;
  dynamic vehicleType;
  dynamic allDetails;

  VehicleTypes({this.id, this.vehicleType, this.allDetails});

  VehicleTypes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    vehicleType = json['vehicle_type'];
    allDetails = json['all_details'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['vehicle_type'] = this.vehicleType;
    data['all_details'] = this.allDetails;
    return data;
  }
}
