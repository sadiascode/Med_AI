class Urls {
  static const String baseUrl = "https://medicalai.pythonanywhere.com";


  // Signup
  static const String Signup = "$baseUrl/users/signup/";
  
  // verify otp for signup and forgot
  static const String signup_verifyotp = "$baseUrl/users/otp/verify/";

  //forget pass
  static const String forget_password = "$baseUrl/users/otp/request/";

  //reset password
  static const String reset_password = "$baseUrl/users/password/reset/";

  //resend otp
  static const String forgot_pass = "$baseUrl/users/otp/resend/";

  // login
  static const String User_signin = "$baseUrl/users/login/";



// profile
  static const String profile = "$baseUrl/users/profile/";
  static const String update_profile = "$baseUrl/users/profile/";

}