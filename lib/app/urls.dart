class Urls {
  static const String baseUrl = "https://medicalai.pythonanywhere.com";

  // full auth

  // Signup
  static const String Signup = "$baseUrl/users/signup/";

  //Email to set password
  static const String reset_password = "$baseUrl/users/reset-password/";

  // verify otp
  static const String verify_otp = "$baseUrl/users/otp/verify/";

  //resend otp
  static const String resend_otp = "$baseUrl/users/resend-otp/";

  //login
  static const String login = "$baseUrl/users/login/";
}