class User {
  // String userId;
  String? accessToken;
  String? refreshToken;
  int? refreshTokenExpirationTime;
  bool? existAccount;
  String? nickname;
  String? profileImg;

  User(
      {this.refreshTokenExpirationTime,
      this.accessToken,
      this.nickname,
      this.profileImg,
      this.refreshToken,
      this.existAccount});

  factory User.fromJson(Map<String, dynamic> responseData) {
    return User(
        accessToken: responseData['accessToken'],
        existAccount: responseData['existAccount'],
        refreshToken: responseData['refreshToken'],
        profileImg: responseData['profileImg'],
        nickname: responseData['nickname'],
        refreshTokenExpirationTime: responseData['refreshTokenExpirationTime']);
  }
}

class Shipment {
  String recipient = "";
  String zipcode = "";
  String address = "";
  String addressDetail = "";
  String phoneNumber = "";
  String memo = "";

  Shipment();

  Shipment.fromJson(Map<String, dynamic> json) {
    recipient = json['recipient'];
    // zipcode = json['zipcode'].toString();
    zipcode = json['zipcode'] == 0 ? "" : json['zipcode'].toString();
    address = json['address'];
    addressDetail = json['addressDetail'];
    phoneNumber = json['phoneNumber'];
    memo = json['memo'];
  }

  Map<String, dynamic> toJson() {
    return {
      'recipient': recipient,
      'zipcode': int.parse(zipcode),
      'address': address,
      'addressDetail': addressDetail,
      'phoneNumber': phoneNumber,
      'memo': memo,
    };
  }
}
