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
    required this.complaintTitle,
    required this.complaintDescription,
    required this.complaintStatus,
    required this.location,
    required this.wardNo,
    required this.complaintMiti,
    required this.priority,
    required this.category,
    this.imageBytes,
    required this.username,
    required this.email,
    this.phoneNo,
    required this.userWardNo,
    this.userImage,
    required this.id,
  });

  String complaintTitle;
  String complaintDescription;
  int complaintStatus;
  String location;
  int wardNo;
  String complaintMiti;
  int priority;
  int category;
  String? imageBytes;
  String? username;
  dynamic email;
  dynamic phoneNo;
  dynamic userWardNo;
  dynamic userImage;
  int id;

  factory ComplaintGetAllModel.fromJson(Map<String, dynamic> json) =>
      ComplaintGetAllModel(
        complaintTitle: json["complaintTitle"],
        complaintDescription: json["complaintDescription"],
        complaintStatus: json["complaintStatus"],
        location: json["location"],
        wardNo: json["wardNo"],
        complaintMiti: json["complaintMiti"],
        priority: json["priority"],
        category: json["category"],
        imageBytes: json["imageBytes"],
        username: json["username"],
        email: json["email"],
        phoneNo: json["phoneNo"],
        userWardNo: json["userWardNo"],
        userImage: json["userImage"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "complaintTitle": complaintTitle,
        "complaintDescription": complaintDescription,
        "complaintStatus": complaintStatus,
        "location": location,
        "wardNo": wardNo,
        "complaintMiti": complaintMiti,
        "priority": priority,
        "category": category,
        "imageBytes": imageBytes,
        "username": username,
        "email": email,
        "phoneNo": phoneNo,
        "userWardNo": userWardNo,
        "userImage": userImage,
        "id": id,
      };
}

class EventModel {
  EventModel({
    required this.title,
    required this.shortDescription,
    required this.eventMiti,
    this.imageBytes,
    required this.location,
    required this.id,
  });

  String title;
  String shortDescription;
  String eventMiti;
  dynamic imageBytes;
  String location;
  int id;

  factory EventModel.fromJson(Map<String, dynamic> json) => EventModel(
        title: json["title"],
        shortDescription: json["shortDescription"],
        eventMiti: json["eventMiti"],
        imageBytes: json["imageBytes"],
        location: json["location"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "shortDescription": shortDescription,
        "eventMiti": eventMiti,
        "imageBytes": imageBytes,
        "location": location,
        "id": id,
      };
}

class UserModel {
  UserModel({
    required this.name,
    required this.surname,
    required this.userName,
    required this.address,
    required this.dboMiti,
    required this.wardNo,
    required this.emailAddress,
    required this.id,
  });

  String name;
  String surname;
  String userName;
  String emailAddress;
  int id;
  String address;
  String dboMiti;
  int wardNo;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        name: json["name"],
        surname: json["surname"],
        userName: json["userName"],
        emailAddress: json["emailAddress"],
        id: json["id"],
        address: json["address"],
        dboMiti: json["dboMiti"],
        wardNo: json["wardNo"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "surname": surname,
        "userName": userName,
        "emailAddress": emailAddress,
        "id": id,
        "address": address,
        "dboMiti": dboMiti,
        "wardNo": wardNo,
      };
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

  int pendingComplaint;
  int solvedComplaint;
  int holdComplaint;

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
