import 'package:care_agent/common/custom_medium.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../common/app_shell.dart';
import '../../profile/screen/prescription_screen.dart';
import '../../profile/widget/custom_prescriptions.dart';
import '../widget/custom_doctext.dart';
import '../models/doctor_model.dart';
import '../services/doctor_api_service.dart';

class ViewScreen extends StatefulWidget {
  final int doctorId;

  const ViewScreen({super.key, required this.doctorId});

  @override
  State<ViewScreen> createState() => _ViewScreenState();
}

class _ViewScreenState extends State<ViewScreen> {
  DoctorModel? doctor;
  bool isLoading = true;
  String? error;

  @override
  void initState() {
    super.initState();
    _fetchDoctor();
  }

  Future<void> _fetchDoctor() async {
    try {
      final doctorData = await DoctorApiService.getSingleDoctor(
        widget.doctorId,
      );
      setState(() {
        doctor = doctorData;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        error = e.toString();
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return SubPageScaffold(
      parentTabIndex: 2,
      backgroundColor: const Color(0xFFFFFAF7),
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color(0xffE0712D),
            size: 18,
          ),
        ),
        title: const Text(
          "Doctor",
          style: TextStyle(
            color: Color(0xffE0712D),
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : error != null
          ? Center(
        child: Text(
          'Error: $error',
          style: const TextStyle(color: Colors.red),
        ),
      )
          : doctor == null
          ? const Center(
        child: Text(
          'Doctor not found',
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      )
          : SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Column(
                children: [
                  Icon(Icons.person, size: 150, color: Colors.grey[600]),
                ],
              ),
              Text(
                doctor!.name,
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color(0xffE0712D),
                ),
              ),
              Text(
                doctor!.specialization,
                style: const TextStyle(
                  fontSize: 16,
                  color: Color(0xff646464),
                ),
              ),
              Text(
                doctor!.hospitalName,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Divider(
                  color: Color(0xffFFF0E6),
                  thickness: 1.5,
                  height: 1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/arrow.svg',
                      width: 50,
                      height: 50,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Your next follow-up",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          doctor!.nextAppointmentDate ?? 'Date not available',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[700],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Divider(
                  color: Color(0xffFFF0E6),
                  thickness: 1.5,
                  height: 1,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  const SizedBox(width: 5),
                  SvgPicture.asset(
                    'assets/su.svg',
                    height: 20,
                    width: 20,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'Suggestions from your doctor',
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              CustomDoctext(doctor: doctor),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Icon(
                    Icons.add,
                    color: Color(0xFFE0712D),
                    size: 20,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    'Add Notes',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFFE0712D),
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.underline,
                      decorationColor: Color(0xFFE0712D),
                      decorationThickness: 1.5,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Container(
                height: 147,
                width: 372,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: const Color(0xffE0712D),
                    width: 1,
                  ),
                ),
                child: TextField(
                  maxLines: null,
                  expands: true,
                  keyboardType: TextInputType.multiline,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                  decoration: const InputDecoration(
                    hintText: 'Type your notes here...',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 12,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              CustomMedium(
                text: "Prescriptions from this doctor",
                onTap: () {},
              ),
              const SizedBox(height: 15),
              if (doctor!.prescriptions.isNotEmpty)
                ...doctor!.prescriptions.map((prescriptionId) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: CustomPrescriptions(
                      prescriptionName: 'Prescription-$prescriptionId',
                      date: doctor!.nextAppointmentDate ?? 'Date not available',
                      onDownload: () {},
                      onShow: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                PrescriptionScreen(prescriptionId: prescriptionId),
                          ),
                        );
                      },
                      onDelete: () {},
                    ),
                  );
                }).toList()
              else
                const Text(
                  'No prescriptions available',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
            ],
          ),
        ),
      ),
    );
  }
}