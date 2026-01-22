class Urls {
  //static const String baseUrl = "http://127.0.0.1:8000";
  static const String baseUrl = "http://10.0.2.2:8000";

  static String login = "$baseUrl/users/login/";
  static String signup() => "$baseUrl/users/signup/";
  static String forgotPassword() => "$baseUrl/users/forgot-password-otp/";
  static String verifyOTP() => "$baseUrl/users/verify-otp/";
  static String resetPassword() => "$baseUrl/users/reset-password/";
}
