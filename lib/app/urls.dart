class Urls {
  static const String baseUrl = "https://medicalai.pythonanywhere.com";


  // Signup
  static const String Signup = "$baseUrl/users/signup/";
  
  // verify otp for signup and forgot
  static const String signup_verifyotp = "$baseUrl/users/otp/verify/";

  //resend otp
  static const String forgot_pass = "$baseUrl/users/otp/resend/";

  // login
  static const String User_signin = "$baseUrl/users/login/";



// profile
  static const String profile = "$baseUrl/users/profile/";
  static const String update_profile = "$baseUrl/users/profile/";

}