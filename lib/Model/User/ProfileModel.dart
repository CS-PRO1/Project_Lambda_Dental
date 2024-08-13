// class ProfileModel{
//   bool? status;
//   String? message;
//   Data? data;
//     ProfileModel.fromJson(Map<String, dynamic> response) {
//     status = response['status'];
//     message = response['message'];
//     data = response[''];
//   }
// }

// class Data {
//   int? id;
//   String? name;
//   String? email;
//   String? phone;
//   String? image;
//   int? points;
//   int? credit;
//   String? token;

//   Data.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     email = json['email'];
//     phone = json['phone'];
//     image = json['image'];
//     points = json['points'];
//     credit = json['credit'];
//     token = json['token'];
//   }
// }

class ProfileModel {
  String firstName;
  String lastName;
  String phoneNumber;
  int wallet;

  ProfileModel({
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.wallet,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      firstName: json['first_name'],
      lastName: json['last_name'],
      phoneNumber: json['phone_number'],
      wallet: json['wallet'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'first_name': firstName,
      'last_name': lastName,
      'phone_number': phoneNumber,
      'wallet': wallet,
    };
  }
}
