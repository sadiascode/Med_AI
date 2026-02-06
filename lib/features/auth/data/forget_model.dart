class ForgetModel {
  final String email;
  final String? otp;
  final String purpose;

  ForgetModel({
    required this.email,
    this.otp,
    this.purpose = 'password_reset',
  });

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "otp": otp,
      "purpose": purpose,
    };
  }
}