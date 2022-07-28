class LoginModel {
  int? status;
  Account? account;
  String? message;

  LoginModel({this.status, this.account, this.message});

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    account =
        json['account'] != null ? Account.fromJson(json['account']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (account != null) {
      data['account'] = account!.toJson();
    }
    data['message'] = message;
    return data;
  }
}

class Account {
  int? id;
  String? name;
  Null? email;
  String? phone;
  int? code;
  String? apiToken;

  Account(
      {this.id, this.name, this.email, this.phone, this.code, this.apiToken});

  Account.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    code = json['code'];
    apiToken = json['apiToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['code'] = code;
    data['apiToken'] = apiToken;
    return data;
  }
}
