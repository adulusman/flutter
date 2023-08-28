class DoctorModel {
  String? id;
  List<String>? documents;
  String? profile;
  String? name;
  String? userName;
  String? phone;
  String? countryCode;
  String? email;
  List<String>? department;
  String? experience;
  String? currentStatus;
  List? search;
  bool? block;
  bool? delete;
  bool? verified;
  String? description;

  DoctorModel({
    this.id,
    this.documents,
    this.profile,
    this.name,
    this.userName,
    this.phone,
    this.countryCode,
    this.email,
    this.department,
    this.experience,
    this.currentStatus,
    this.block,
    this.delete,
    this.search,
    this.verified,
    this.description,
  });

  DoctorModel copyWith({
    String? id,
    List<String>? documents,
    String? profile,
    String? name,
    String? userName,
    String? phone,
    String? countryCode,
    String? email,
    List<String>? department,
    String? experience,
    String? currentStatus,
    List? search,
    bool? block,
    bool? delete,
    bool? verified,
    String? description,
  }) =>
      DoctorModel(
        id: id ?? this.id,
        documents: documents ?? this.documents,
        profile: profile ?? this.profile,
        name: name ?? this.name,
        userName: userName ?? this.userName,
        phone: phone ?? this.phone,
        countryCode: countryCode ?? this.countryCode,
        email: email ?? this.email,
        department: department ?? this.department,
        experience: experience ?? this.experience,
        currentStatus: currentStatus ?? this.currentStatus,
        block: block ?? this.block,
        delete: delete ?? this.delete,
        verified: verified ?? this.verified,
        search: search ?? this.search,
        description: description??this.description
      );

  factory DoctorModel.fromJson(Map<String, dynamic> json) => DoctorModel(
        id: json["id"],
        documents: json["documents"] == null
            ? []
            : List<String>.from(json["documents"]!.map((x) => x)),
        profile: json["profile"],
        name: json["name"],
        userName: json["userName"],
        phone: json["phone"],
        countryCode: json["countryCode"],
        email: json["email"],
        department: json["department"] == null
            ? []
            : List<String>.from(json["department"]!.map((x) => x)),
        experience: json["experience"],
        currentStatus: json["currentStatus"],
        block: json["block"],
        delete: json["delete"],
        verified: json["verified"],
        search: json["search"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "documents": documents == null
            ? []
            : List<dynamic>.from(documents!.map((x) => x)),
        "profile": profile,
        "name": name,
        "userName": userName,
        "phone": phone,
        "countryCode": countryCode,
        "email": email,
        "department": department == null
            ? []
            : List<dynamic>.from(department!.map((x) => x)),
        "experience": experience,
        "currentStatus": currentStatus,
        "block": block,
        "delete": delete,
        "verified": verified,
        "search":
            search == null ? [] : List<dynamic>.from(search!.map((x) => x)),
            "description":description
      };

  Map<String, dynamic> updateJson() {
    Map<String, dynamic> data = {};
    if (id != null) data["id"] = id;
    if (documents != null)
      data["documents"] = List<dynamic>.from(documents!.map((x) => x));
    if (profile != null) data["profile"] = profile;
    if (name != null) data["name"] = name;
    if (userName != null) data["userName"] = userName;
    if (phone != null) data["phone"] = phone;
    if (countryCode != null) data["countryCode"] = countryCode;
    if (email != null) data["email"] = email;
    if (department != null)
      data["department"] = List<dynamic>.from(department!.map((x) => x));
    if (experience != null) data["experience"] = experience;
    if (currentStatus != null) data["currentStatus"] = currentStatus;
    if (block != null) data["block"] = block;
    if (delete != null) data["delete"] = delete;
    if (verified != null) data["verified"] = verified;
    return data;
  }
}
