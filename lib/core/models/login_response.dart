class LoginResponse {
  String? message;
  String? acessKey;

  LoginResponse({this.message, this.acessKey});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    acessKey = json['acessKey'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['acessKey'] = this.acessKey;
    data['message'] = this.message;
    return data;
  }
}