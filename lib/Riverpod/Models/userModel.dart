// ignore_for_file: file_names

class LoginModel {
  LoginModel({
    required this.accessToken,
    required this.encryptedAccessToken,
    required this.expireInSeconds,
    required this.userId,
  });

  String accessToken;
  String encryptedAccessToken;
  int expireInSeconds;
  int userId;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        accessToken: json["accessToken"],
        encryptedAccessToken: json["encryptedAccessToken"],
        expireInSeconds: json["expireInSeconds"],
        userId: json["userId"],
      );

  Map<String, dynamic> toJson() => {
        "accessToken": accessToken,
        "encryptedAccessToken": encryptedAccessToken,
        "expireInSeconds": expireInSeconds,
        "userId": userId,
      };
}

class ComplaintGetAllModel {
  ComplaintGetAllModel({
    required this.title,
    required this.description,
    required this.status,
    required this.address,
    required this.ward,
    required this.created_at,
    required this.priority,
    required this.category,
    this.image,
    required this.username,
  });

  dynamic title;
  dynamic description;
  dynamic status;
  dynamic address;
  dynamic ward;
  dynamic created_at;
  dynamic priority;
  dynamic category;
  String? image;
  String? username;

  factory ComplaintGetAllModel.fromJson(Map<String, dynamic> json) =>
      ComplaintGetAllModel(
        title: json["title"],
        description: json["description"],
        status: json["status"],
        address: json["address"],
        ward: json["ward"],
        created_at: json["created_at"],
        priority: json["priority"],
        category: json["category"],
        image: json["image"],
        username: json["username"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "status": status,
        "address": address,
        "ward": ward,
        "created_at": created_at,
        "priority": priority,
        "category": category,
        "image": image,
        "username": username,
      };
}

class EventModel {
  EventModel({
    required this.title,
    required this.shortDescription,
    required this.eventMiti,
    this.image,
    required this.address,
    required this.id,
  });

  String title;
  String shortDescription;
  String eventMiti;
  dynamic image;
  String address;
  int id;

  factory EventModel.fromJson(Map<String, dynamic> json) => EventModel(
        title: json["title"],
        shortDescription: json["shortDescription"],
        eventMiti: json["eventMiti"],
        image: json["image"],
        address: json["address"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "shortDescription": shortDescription,
        "eventMiti": eventMiti,
        "image": image,
        "address": address,
        "id": id,
      };
}

class UserModel {
  UserModel({
    required this.username,
    required this.address,
    required this.dob,
    required this.ward,
    required this.email,
    required this.id,
    required this.phone,
  });

  String username;
  String email;
  String phone;
  String id;
  String address;
  String dob;
  int ward;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        username: json["username"],
        email: json["email"],
        id: json["id"],
        address: json["address"],
        dob: json["dob"],
        ward: json["ward"],
        phone: json["phone"],
      );
}

class RequestModel {
  RequestModel({
    required this.id,
    required this.name,
    required this.position,
    required this.description,
    required this.role,
    required this.userid,
    required this.file,
  });

  String id;
  String name;
  String position;
  String description;
  String role;
  String userid;
  String file;

  factory RequestModel.fromJson(Map<String, dynamic> json) => RequestModel(
        id: json["id"],
        name: json["name"],
        position: json["position"],
        description: json["description"],
        role: json["role"],
        userid: json["userid"],
        file: json["file"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "position": position,
        "description": description,
        "role": role,
        "userid": userid,
        "file": file,
      };
}

class TryModel {
  TryModel({
    required this.id,
    required this.name,
    this.data,
  });

  String id;
  String name;
  dynamic data;

  factory TryModel.fromJson(Map<String, dynamic> json) => TryModel(
        id: json["id"],
        name: json["name"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "data": data,
      };
}

class OwnReportModel {
  OwnReportModel({
    required this.pendingComplaint,
    required this.solvedComplaint,
    required this.holdComplaint,
  });

  String pendingComplaint;
  String solvedComplaint;
  String holdComplaint;

  factory OwnReportModel.fromJson(Map<String, dynamic> json) => OwnReportModel(
        pendingComplaint: json["pendingComplaint"],
        solvedComplaint: json["solvedComplaint"],
        holdComplaint: json["holdComplaint"],
      );

  Map<String, dynamic> toJson() => {
        "pendingComplaint": pendingComplaint,
        "solvedComplaint": solvedComplaint,
        "holdComplaint": holdComplaint,
      };
}

class UserDetailsModel {
  UserDetailsModel({
    required this.name,
    required this.lastName,
    required this.usersType,
    required this.id,
  });

  String name;
  String lastName;
  int usersType;
  int id;

  factory UserDetailsModel.fromJson(Map<String, dynamic> json) =>
      UserDetailsModel(
        name: json["name"],
        lastName: json["lastName"],
        usersType: json["usersType"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "lastName": lastName,
        "usersType": usersType,
        "id": id,
      };
}
