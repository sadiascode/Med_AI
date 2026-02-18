import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:share_plus/share_plus.dart';
import '../models/prescription_model.dart';
import '../models/prescription_medicine_model.dart';

class PrescriptionPdfService {
  static Future<bool> generateAndSavePrescriptionPdf(PrescriptionModel prescription) async {
    try {
      // Create PDF document
      final pdf = pw.Document();

      // Get platform-specific directory
      Directory directory;
      String fileName = 'prescription_${DateTime.now().millisecondsSinceEpoch}.pdf';
      
      if (Platform.isAndroid) {
        // For Android, try to save to Downloads directory
        directory = await _getDownloadsDirectory() ?? await getApplicationDocumentsDirectory();
      } else if (Platform.isIOS) {
        // For iOS, use application documents directory
        directory = await getApplicationDocumentsDirectory();
      } else {
        // For other platforms, use application documents directory
        directory = await getApplicationDocumentsDirectory();
      }

      final String filePath = '${directory.path}/$fileName';

      // Build PDF content
      pdf.addPage(
        pw.Page(
          pageFormat: PdfPageFormat.a4,
          margin: const pw.EdgeInsets.all(32),
          build: (pw.Context context) {
            return pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                // Header
                pw.Text(
                  'PRESCRIPTION',
                  style: pw.TextStyle(
                    fontSize: 24,
                    fontWeight: pw.FontWeight.bold,
                    color: PdfColors.blue800,
                  ),
                ),
                pw.SizedBox(height: 20),
                
                // Prescription Name
                pw.Container(
                  padding: const pw.EdgeInsets.all(16),
                  decoration: pw.BoxDecoration(
                    border: pw.Border.all(color: PdfColors.grey300),
                    borderRadius: const pw.BorderRadius.all(pw.Radius.circular(8)),
                  ),
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text(
                        'Prescription Name:',
                        style: pw.TextStyle(
                          fontSize: 14,
                          fontWeight: pw.FontWeight.bold,
                          color: PdfColors.grey600,
                        ),
                      ),
                      pw.SizedBox(height: 4),
                      pw.Text(
                        prescription.prescriptionName ?? 'Not specified',
                        style: pw.TextStyle(
                          fontSize: 16,
                          fontWeight: pw.FontWeight.normal,
                          color: PdfColors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                pw.SizedBox(height: 16),
                
                // Next Appointment Date
                pw.Container(
                  padding: const pw.EdgeInsets.all(16),
                  decoration: pw.BoxDecoration(
                    border: pw.Border.all(color: PdfColors.grey300),
                    borderRadius: const pw.BorderRadius.all(pw.Radius.circular(8)),
                  ),
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text(
                        'Next Appointment Date:',
                        style: pw.TextStyle(
                          fontSize: 14,
                          fontWeight: pw.FontWeight.bold,
                          color: PdfColors.grey600,
                        ),
                      ),
                      pw.SizedBox(height: 4),
                      pw.Text(
                        _formatNextAppointment(prescription.nextAppointmentDate),
                        style: pw.TextStyle(
                          fontSize: 16,
                          fontWeight: pw.FontWeight.normal,
                          color: PdfColors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                pw.SizedBox(height: 16),
                
                // Additional Information Section
                if (prescription.medicines.isNotEmpty) ...[
                  pw.Text(
                    'Medicines:',
                    style: pw.TextStyle(
                      fontSize: 18,
                      fontWeight: pw.FontWeight.bold,
                      color: PdfColors.black,
                    ),
                  ),
                  pw.SizedBox(height: 8),
                  ...prescription.medicines.map((medicine) => pw.Container(
                    margin: const pw.EdgeInsets.only(bottom: 8),
                    padding: const pw.EdgeInsets.all(12),
                    decoration: pw.BoxDecoration(
                      color: PdfColors.grey100,
                      borderRadius: const pw.BorderRadius.all(pw.Radius.circular(4)),
                    ),
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text(
                          medicine.name,
                          style: pw.TextStyle(
                            fontSize: 14,
                            fontWeight: pw.FontWeight.bold,
                            color: PdfColors.black,
                          ),
                        ),
                        if (medicine.hasAnyTimeSlot) ...[
                          pw.SizedBox(height: 4),
                          pw.Text(
                            _formatMedicineTimes(medicine),
                            style: pw.TextStyle(
                              fontSize: 12,
                              color: PdfColors.grey600,
                            ),
                          ),
                        ],
                        pw.Text(
                          'Duration: ${medicine.howManyDay} days',
                          style: pw.TextStyle(
                            fontSize: 12,
                            color: PdfColors.grey600,
                          ),
                        ),
                      ],
                    ),
                  )).toList(),
                  pw.SizedBox(height: 16),
                ],
                
                // Patient Information
                pw.Container(
                  padding: const pw.EdgeInsets.all(16),
                  decoration: pw.BoxDecoration(
                    color: PdfColors.blue50,
                    borderRadius: const pw.BorderRadius.all(pw.Radius.circular(8)),
                  ),
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text(
                        'Patient Information:',
                        style: pw.TextStyle(
                          fontSize: 14,
                          fontWeight: pw.FontWeight.bold,
                          color: PdfColors.blue800,
                        ),
                      ),
                      pw.SizedBox(height: 4),
                      pw.Text(
                        prescription.patient.name,
                        style: pw.TextStyle(
                          fontSize: 16,
                          fontWeight: pw.FontWeight.normal,
                          color: PdfColors.blue800,
                        ),
                      ),
                    ],
                  ),
                ),
                
                pw.Spacer(),
                
                // Footer
                pw.Container(
                  padding: const pw.EdgeInsets.only(top: 20),
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Divider(color: PdfColors.grey300),
                      pw.SizedBox(height: 8),
                      pw.Text(
                        'Generated on: ${_formatDate(DateTime.now())}',
                        style: pw.TextStyle(
                          fontSize: 12,
                          color: PdfColors.grey600,
                        ),
                      ),
                      pw.Text(
                        'Care Agent App',
                        style: pw.TextStyle(
                          fontSize: 10,
                          color: PdfColors.grey500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      );

      // Save PDF to file
      final File file = File(filePath);
      await file.writeAsBytes(await pdf.save());

      print('✅ PDF generated successfully: $filePath');

      // Platform-specific handling
      if (Platform.isIOS) {
        // On iOS, share the PDF immediately
        await Share.shareXFiles([XFile(filePath)], text: 'Prescription PDF');
      } else if (Platform.isAndroid) {
        // On Android, the file is already in Downloads, just show success message
        print('✅ PDF saved to Downloads folder on Android');
      }

      return true;

    } catch (e) {
      print('❌ Error generating PDF: $e');
      throw Exception('Failed to generate prescription PDF: $e');
    }
  }

  // Get Downloads directory for Android
  static Future<Directory?> _getDownloadsDirectory() async {
    if (Platform.isAndroid) {
      try {
        // Try to get external storage directory
        final Directory? externalDir = await getExternalStorageDirectory();
        if (externalDir != null) {
          // Navigate to Downloads folder
          final String downloadsPath = '${externalDir.path.split('Android')[0]}Download';
          final Directory downloadsDir = Directory(downloadsPath);
          
          // Create Downloads directory if it doesn't exist
          if (!await downloadsDir.exists()) {
            await downloadsDir.create(recursive: true);
          }
          
          return downloadsDir;
        }
      } catch (e) {
        print('❌ Could not access Downloads directory: $e');
      }
    }
    return null;
  }

  static Future<String> generatePrescriptionPdf(PrescriptionModel prescription) async {
    try {
      // Create PDF document
      final pdf = pw.Document();

      // Get application documents directory
      final Directory appDocDir = await getApplicationDocumentsDirectory();
      final String fileName = 'prescription_${DateTime.now().millisecondsSinceEpoch}.pdf';
      final String filePath = '${appDocDir.path}/$fileName';

      // Build PDF content
      pdf.addPage(
        pw.Page(
          pageFormat: PdfPageFormat.a4,
          margin: const pw.EdgeInsets.all(32),
          build: (pw.Context context) {
            return pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                // Header
                pw.Text(
                  'PRESCRIPTION',
                  style: pw.TextStyle(
                    fontSize: 24,
                    fontWeight: pw.FontWeight.bold,
                    color: PdfColors.blue800,
                  ),
                ),
                pw.SizedBox(height: 20),
                
                // Prescription Name
                pw.Container(
                  padding: const pw.EdgeInsets.all(16),
                  decoration: pw.BoxDecoration(
                    border: pw.Border.all(color: PdfColors.grey300),
                    borderRadius: const pw.BorderRadius.all(pw.Radius.circular(8)),
                  ),
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text(
                        'Prescription Name:',
                        style: pw.TextStyle(
                          fontSize: 14,
                          fontWeight: pw.FontWeight.bold,
                          color: PdfColors.grey600,
                        ),
                      ),
                      pw.SizedBox(height: 4),
                      pw.Text(
                        prescription.prescriptionName ?? 'Not specified',
                        style: pw.TextStyle(
                          fontSize: 16,
                          fontWeight: pw.FontWeight.normal,
                          color: PdfColors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                pw.SizedBox(height: 16),
                
                // Next Appointment Date
                pw.Container(
                  padding: const pw.EdgeInsets.all(16),
                  decoration: pw.BoxDecoration(
                    border: pw.Border.all(color: PdfColors.grey300),
                    borderRadius: const pw.BorderRadius.all(pw.Radius.circular(8)),
                  ),
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text(
                        'Next Appointment Date:',
                        style: pw.TextStyle(
                          fontSize: 14,
                          fontWeight: pw.FontWeight.bold,
                          color: PdfColors.grey600,
                        ),
                      ),
                      pw.SizedBox(height: 4),
                      pw.Text(
                        _formatNextAppointment(prescription.nextAppointmentDate),
                        style: pw.TextStyle(
                          fontSize: 16,
                          fontWeight: pw.FontWeight.normal,
                          color: PdfColors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                pw.SizedBox(height: 16),
                
                // Additional Information Section
                if (prescription.medicines.isNotEmpty) ...[
                  pw.Text(
                    'Medicines:',
                    style: pw.TextStyle(
                      fontSize: 18,
                      fontWeight: pw.FontWeight.bold,
                      color: PdfColors.black,
                    ),
                  ),
                  pw.SizedBox(height: 8),
                  ...prescription.medicines.map((medicine) => pw.Container(
                    margin: const pw.EdgeInsets.only(bottom: 8),
                    padding: const pw.EdgeInsets.all(12),
                    decoration: pw.BoxDecoration(
                      color: PdfColors.grey100,
                      borderRadius: const pw.BorderRadius.all(pw.Radius.circular(4)),
                    ),
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text(
                          medicine.name,
                          style: pw.TextStyle(
                            fontSize: 14,
                            fontWeight: pw.FontWeight.bold,
                            color: PdfColors.black,
                          ),
                        ),
                        if (medicine.hasAnyTimeSlot) ...[
                          pw.SizedBox(height: 4),
                          pw.Text(
                            _formatMedicineTimes(medicine),
                            style: pw.TextStyle(
                              fontSize: 12,
                              color: PdfColors.grey600,
                            ),
                          ),
                        ],
                        pw.Text(
                          'Duration: ${medicine.howManyDay} days',
                          style: pw.TextStyle(
                            fontSize: 12,
                            color: PdfColors.grey600,
                          ),
                        ),
                      ],
                    ),
                  )).toList(),
                  pw.SizedBox(height: 16),
                ],
                
                // Patient Information
                pw.Container(
                  padding: const pw.EdgeInsets.all(16),
                  decoration: pw.BoxDecoration(
                    color: PdfColors.blue50,
                    borderRadius: const pw.BorderRadius.all(pw.Radius.circular(8)),
                  ),
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text(
                        'Patient Information:',
                        style: pw.TextStyle(
                          fontSize: 14,
                          fontWeight: pw.FontWeight.bold,
                          color: PdfColors.blue800,
                        ),
                      ),
                      pw.SizedBox(height: 4),
                      pw.Text(
                        prescription.patient.name,
                        style: pw.TextStyle(
                          fontSize: 16,
                          fontWeight: pw.FontWeight.normal,
                          color: PdfColors.blue800,
                        ),
                      ),
                    ],
                  ),
                ),
                
                pw.Spacer(),
                
                // Footer
                pw.Container(
                  padding: const pw.EdgeInsets.only(top: 20),
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Divider(color: PdfColors.grey300),
                      pw.SizedBox(height: 8),
                      pw.Text(
                        'Generated on: ${_formatDate(DateTime.now())}',
                        style: pw.TextStyle(
                          fontSize: 12,
                          color: PdfColors.grey600,
                        ),
                      ),
                      pw.Text(
                        'Care Agent App',
                        style: pw.TextStyle(
                          fontSize: 10,
                          color: PdfColors.grey500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      );

      // Save PDF to file
      final File file = File(filePath);
      await file.writeAsBytes(await pdf.save());

      print('✅ PDF generated successfully: $filePath');
      return filePath;

    } catch (e) {
      print('❌ Error generating PDF: $e');
      throw Exception('Failed to generate prescription PDF: $e');
    }
  }

  // Helper method to format next appointment date
  static String _formatNextAppointment(String? appointmentDate) {
    if (appointmentDate == null || appointmentDate.isEmpty) {
      return 'Not scheduled';
    }
    
    try {
      // Try to parse and format the date
      final DateTime? date = DateTime.tryParse(appointmentDate);
      if (date != null) {
        return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
      }
    } catch (e) {
      // If parsing fails, return as-is
    }
    
    return appointmentDate;
  }

  // Helper method to format current date
  static String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year} ${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';
  }

  // Helper method to format medicine times
  static String _formatMedicineTimes(PrescriptionMedicineModel medicine) {
    final List<String> times = [];
    
    if (medicine.hasMorning) {
      times.add('Morning: ${medicine.morningDisplay}');
    }
    if (medicine.hasAfternoon) {
      times.add('Afternoon: ${medicine.afternoonDisplay}');
    }
    if (medicine.hasEvening) {
      times.add('Evening: ${medicine.eveningDisplay}');
    }
    if (medicine.hasNight) {
      times.add('Night: ${medicine.nightDisplay}');
    }
    
    return times.isNotEmpty ? times.join('\n') : 'No specific times';
  }
}
