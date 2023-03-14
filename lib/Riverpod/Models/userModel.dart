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
  String username;
  String email;
  dynamic phoneNo;
  int userWardNo;
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
    required this.emailAddress,
    required this.id,
  });

  String name;
  String surname;
  String userName;
  String emailAddress;
  int id;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        name: json["name"],
        surname: json["surname"],
        userName: json["userName"],
        emailAddress: json["emailAddress"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "surname": surname,
        "userName": userName,
        "emailAddress": emailAddress,
        "id": id,
      };
}
