class SignupReotpModel {
  final String email;
  final String purpose;

  SignupReotpModel({
    required this.email,
    this.purpose = 'signup',
  });

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "purpose": purpose,
    };
  }

  factory SignupReotpModel.fromJson(Map<String, dynamic> json) {
    return SignupReotpModel(
      email: json['email'],
      purpose: json['purpose'] ?? 'signup',
    );
  }
}
