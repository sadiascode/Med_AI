class Urls {
  static const String baseUrl = "https://test15.fireai.agency";

  // Signup
  static const String Signup = "$baseUrl/users/signup/";

  // verify otp for signup and forgot
  static const String signup_verifyotp = "$baseUrl/users/otp/verify/";

  //forget pass
  static const String forget_password = "$baseUrl/users/otp/request/";

  //resend otp for Signup and Forget
  static const String resend_otp = "$baseUrl/users/otp/request/";

  //reset password
  static const String reset_password = "$baseUrl/users/password/reset/";

  //resend otp
  static const String forgot_pass = "$baseUrl/users/otp/resend/";

  // login
  static const String User_signin = "$baseUrl/users/login/";

  // profile
  static const String profile = "$baseUrl/users/profile/";
  static const String update_profile = "$baseUrl/users/profile/";
  static const String Delete_Account = "$baseUrl/users/account/deactivate/";
  static const String Change_Password = "$baseUrl/users/password/change/";

  // All Doctor list
  static const String Doctor_list = "$baseUrl/doctors/profile/";

  // Single Doctor
  static String singleDoctor(int id) {
    return "$baseUrl/doctors/profile/$id/";
  }

  // Add doctor
  static const String Add_doctor = "$baseUrl/doctors/profile/";


}
