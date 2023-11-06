class Login {
  String? message;
  UserDetails? userDetails;
  String? statusCode;
  bool? status;

  Login({this.message, this.userDetails, this.statusCode, this.status});

  Login.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    userDetails = json['user_details'] != null
        ? new UserDetails.fromJson(json['user_details'])
        : null;
    statusCode = json['status_code'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.userDetails != null) {
      data['user_details'] = this.userDetails!.toJson();
    }
    data['status_code'] = this.statusCode;
    data['status'] = this.status;
    return data;
  }
}

class UserDetails {
  String? id;
  String? image;
  String? fullname;
  String? email;
  String? phoneNumber;
  String? randomPassword;
  String? staffStatus;
  int? profileComplete;

  UserDetails(
      {this.id,
        this.image,
        this.fullname,
        this.email,
        this.phoneNumber,
        this.randomPassword,
        this.staffStatus,
        this.profileComplete});

  UserDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    fullname = json['fullname'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    randomPassword = json['random_password'];
    staffStatus = json['staff_status'];
    profileComplete = json['profile_complete'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['fullname'] = this.fullname;
    data['email'] = this.email;
    data['phone_number'] = this.phoneNumber;
    data['random_password'] = this.randomPassword;
    data['staff_status'] = this.staffStatus;
    data['profile_complete'] = this.profileComplete;
    return data;
  }
}