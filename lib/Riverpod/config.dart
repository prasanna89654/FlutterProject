class MyConfig {
  static const String appUrl = "http://103.90.86.54:8082";
  // static const String appUrl = "https://localhost:44311";

  // static const String newsUrl =
  //     "https://simplescraper.io/api/nQstlLpbMklhICOgTYCP?apikey=9Ma7nbqTSAvrSTs7k9pC0Y0W1D7Wc83m&limit=100";
  static const String loginURL = "/api/TokenAuth/Authenticate";
  static const String signupURL = "/api/TokenAuth/CreateUser/Register";
  static const String getcomplaintsURL =
      "/api/services/app/Complaint/GetAllComplaint";
  static const String geteventsURL = "/api/services/app/Event/GetAllEvents";
  static const String complaintupload =
      "/api/services/app/Complaint/CreateOrEdit";
  static const String eventupload = "/api/services/app/Event/CreateOrEdit";
  static const String changePasswordURL =
      "/api/services/app/Account/ResetPassword";

  /// Dont change the code below
  MyConfig._();

  //api methods
}
