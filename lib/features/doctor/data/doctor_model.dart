class DoctorModel {
  final String name;
  final String sex;
  final String specialization;
  final String hospitalName;
  final String designation;
  final String doctorEmail;

  DoctorModel({
    required this.name,
    required this.sex,
    required this.specialization,
    required this.hospitalName,
    required this.designation,
    required this.doctorEmail,
  });

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "sex": sex,
      "specialization": specialization,
      "hospital_name": hospitalName,
      "designation": designation,
      "doctor_email": doctorEmail,
    };
  }

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
      name: json['name'] ?? '',
      sex: json['sex'] ?? '',
      specialization: json['specialization'] ?? '',
      hospitalName: json['hospital_name'] ?? '',
      designation: json['designation'] ?? '',
      doctorEmail: json['doctor_email'] ?? '',
    );
  }
}
