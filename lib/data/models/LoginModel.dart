import 'package:tasksystem/data/models/UserModel.dart';

class LoginModel {
  String? status;
  String? token;
  UserModel? userModel;

  LoginModel({this.status, this.token, this.userModel});

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    token = json['token'];
    userModel = json['data'] != null ? new UserModel.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['token'] = this.token;
    if (userModel != null) {
      data['data'] = this.userModel!.toJson();
    }
    return data;
  }
}