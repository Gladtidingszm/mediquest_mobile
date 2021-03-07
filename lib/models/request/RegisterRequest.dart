class RegisterRequest {
  String computerNumber;
  String password;

  RegisterRequest({this.computerNumber, this.password});

  RegisterRequest.fromJson(Map<String, dynamic> json) {
    computerNumber = json['computer_number'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['computer_number'] = this.computerNumber;
    data['password'] = this.password;
    return data;
  }
}
