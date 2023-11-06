class Register {
  String? message;
  int? userId;
  UserDetails? userDetails;
  String? statusCode;
  bool? status;

  Register(
      {this.message,
        this.userId,
        this.userDetails,
        this.statusCode,
        this.status});

  Register.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    userId = json['user_id'];
    userDetails = json['user_details'] != null
        ? new UserDetails.fromJson(json['user_details'])
        : null;
    statusCode = json['status_code'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['user_id'] = this.userId;
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
  String? userName;
  String? email;
  String? phoneNumber;
  String? address;
  String? randomPassword;
  int? profileComplete;

  UserDetails(
      {this.id,
        this.userName,
        this.email,
        this.phoneNumber,
        this.address,
        this.randomPassword,
        this.profileComplete});

  UserDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['user_name'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    address = json['address'];
    randomPassword = json['random_password'];
    profileComplete = json['profile_complete'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_name'] = this.userName;
    data['email'] = this.email;
    data['phone_number'] = this.phoneNumber;
    data['address'] = this.address;
    data['random_password'] = this.randomPassword;
    data['profile_complete'] = this.profileComplete;
    return data;
  }
}
