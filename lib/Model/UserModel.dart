class UserModel {
  DateTime? createdDate;
  bool? delete;
  String? id;
  String? uid;
  String? userName;
  String? nickName;
  String? email;
  String? password;
  String? phoneNumber;
  List? search;
  String? countryCode;
  UserModel(
      {this.createdDate,
      this.delete,
      this.id,
      this.uid,
      this.userName,
      this.nickName,
      this.email,
      this.password,
      this.phoneNumber,
      this.search,
      this.countryCode});
  UserModel.fromJson(Map<String, dynamic> json) {
    createdDate = DateTime.tryParse(json["createdDate"].toString());
    delete = json["delete"];
    id = json["id"];
    uid = json["uid"];
    userName = json["userName"];
    nickName = json["nickName"];
    email = json["email"];
    password = json["password"];
    phoneNumber = json["phoneNumber"];
    search = json["search"];
    countryCode = json["countryCode"];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};
    data["createdDate"] == null ? DateTime.now() : data["createdDate"].toDate();
    data["delete"] = delete ?? false;
    data["id"] = id ?? "";
    data["uid"] = uid ?? "";
    data["userName"] = userName ?? "";
    data["nickName"] = nickName ?? "";
    data["email"] = email ?? "";
    data["password"] = password ?? "";
    data["phoneNumber"] = phoneNumber ?? "";
    data["search"] = search ?? [];
    data["countryCode"] = countryCode ?? "";
    return data;
  }

  Map<String, dynamic> updateJson() {
    Map<String, dynamic> data = {};
    if (createdDate != null) data["createdDate"] = data["createdDate"].toDate();
    if (delete != null) data["delete"] = delete ?? false;
    if (id != null) data["id"] = id ?? "";
    if (uid != null) data["uid"] = uid ?? "";
    if (userName != null) data["userName"] = userName ?? "";
    if (nickName != null) data["nickName"] = nickName ?? "";
    if (email != null) data["email"] = email ?? "";
    if (password != null) data["password"] = password ?? "";
    if (phoneNumber != null) data["phoneNumber"] = phoneNumber ?? "";
    if (search != null) data["search"] = search ?? [];
    if (countryCode != null) data["countryCode"] = countryCode ?? "";
    return data;
  }

  UserModel copyWith({
    DateTime? createdDate,
    bool? delete,
    String? id,
    String? uid,
    String? userName,
    String? nickName,
    String? email,
    String? password,
    String? phoneNumber,
    List? seach,
    String? countryCode,
  }) {
    return UserModel(
      createdDate: createdDate ?? this.createdDate,
      delete: delete ?? this.delete,
      id: id ?? this.id,
      uid: uid ?? this.uid,
      userName: userName ?? this.userName,
      nickName: nickName ?? this.nickName,
      email: email ?? this.email,
      password: password ?? this.password,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      search: search ?? search,
      countryCode: countryCode ?? this.countryCode,
    );
  }
}
