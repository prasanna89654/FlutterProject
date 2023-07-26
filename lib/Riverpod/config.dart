class MyConfig {
  static const String appUrl = "http://103.90.86.54:8082";
  // static const String appUrl = "http://192.168.1.65:44311";

  static const String nodeUrl = "http://192.168.1.84:3000";

  // static const String newsUrl =
  //     "https://simplescraper.io/api/nQstlLpbMklhICOgTYCP?apikey=9Ma7nbqTSAvrSTs7k9pC0Y0W1D7Wc83m&limit=100";
  static const String loginURL = "/api/TokenAuth/Authenticate";
  static const String signupURL =
      "/api/services/app/PublicUserComplaint/CreatePublicUser";
  static const String getcomplaintsURL =
      "/api/services/app/Complaint/GetAllComplaint?MaxResultCount=50";
  static const String getowncomplaintsURL =
      "/api/services/app/PublicUserComplaint/GetAllUserOwnComplaint?MaxResultCount=50";
  static const String geteventsURL =
      "/api/services/app/Event/GetAllEvents?MaxResultCount=50";
  static const String complaintupload =
      "/api/services/app/PublicUserComplaint/CreateOrEditComplaint";
  static const String eventupload = "/api/services/app/Event/CreateOrEdit";
  static const String changePasswordURL =
      "/api/services/app/Account/ResetPassword";
  static const String getuserdetailsURL =
      "/api/services/app/Complaint/UpdateUserType";
  static const String getstatusURL = "//api/services/app/Complaint/Update";

  static const String getcreateRequestURL = "/maintainer/createRequest";

  /// Dont change the code below
  MyConfig._();

  //api methods
}
