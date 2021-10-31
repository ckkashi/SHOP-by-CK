class User {
  String? sId;
  String? email;
  String? pass;
  String? username;
  String? userContact;
  String? userAddress;
  String? userProfileUrl;
  UserPaymentDetail? userPaymentDetail;

  User(
      {this.sId,
      this.email,
      this.pass,
      this.username,
      this.userContact,
      this.userAddress,
      this.userProfileUrl,
      this.userPaymentDetail});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    email = json['email'];
    pass = json['pass'];
    username = json['username'];
    userContact = json['userContact'];
    userAddress = json['userAddress'];
    userProfileUrl = json['userProfileUrl'];
    userPaymentDetail = json['userPaymentDetail'] != null
        ? new UserPaymentDetail.fromJson(json['userPaymentDetail'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['email'] = this.email;
    data['pass'] = this.pass;
    data['username'] = this.username;
    data['userContact'] = this.userContact;
    data['userAddress'] = this.userAddress;
    data['userProfileUrl'] = this.userProfileUrl;
    if (this.userPaymentDetail != null) {
      data['userPaymentDetail'] = this.userPaymentDetail!.toJson();
    }
    return data;
  }
}

class UserPaymentDetail {
  String? bank;
  String? cardNo;

  UserPaymentDetail({this.bank, this.cardNo});

  UserPaymentDetail.fromJson(Map<String, dynamic> json) {
    bank = json['bank'];
    cardNo = json['card no'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bank'] = this.bank;
    data['card no'] = this.cardNo;
    return data;
  }
}
