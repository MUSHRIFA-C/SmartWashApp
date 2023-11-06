class AllServiceModel {
  List<ServicesTypes>? servicesTypes;
  String? statusCode;
  bool? status;

  AllServiceModel({this.servicesTypes, this.statusCode, this.status});

  AllServiceModel.fromJson(Map<String, dynamic> json) {
    if (json['services_types'] != null) {
      servicesTypes = <ServicesTypes>[];
      json['services_types'].forEach((v) {
        servicesTypes!.add(new ServicesTypes.fromJson(v));
      });
    }
    statusCode = json['status_code'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.servicesTypes != null) {
      data['services_types'] =
          this.servicesTypes!.map((v) => v.toJson()).toList();
    }
    data['status_code'] = this.statusCode;
    data['status'] = this.status;
    return data;
  }
}

class ServicesTypes {
  dynamic id;
  dynamic serviceType;

  ServicesTypes({this.id, this.serviceType});

  ServicesTypes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    serviceType = json['service_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['service_type'] = this.serviceType;
    return data;
  }
}
