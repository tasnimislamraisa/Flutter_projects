import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;
import '../viewmodels/session_viewmodel.dart';

class WorkTimerScreen extends StatelessWidget {
  final SessionViewModel sessionVM = Get.put(SessionViewModel());

  // Generate PDF report
  Future<void> generatePDF(String date, String workDuration) async {
    final pdf = pw.Document();

    // Create the content for the PDF
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text('Work Timer Report', style: pw.TextStyle(fontSize: 24)),
              pw.SizedBox(height: 20),
              pw.Text('Date: $date', style: pw.TextStyle(fontSize: 18)),
              pw.SizedBox(height: 10),
              pw.Text('Work Duration: $workDuration', style: pw.TextStyle(fontSize: 18)),
              pw.SizedBox(height: 20),
              pw.Text('This is a summary of your work session.', style: pw.TextStyle(fontSize: 16)),
            ],
          );
        },
      ),
    );

    // Get the directory to save the PDF
    final output = await getApplicationDocumentsDirectory();
    final file = File("${output.path}/work_timer_report.pdf");

    // Write the PDF file
    await file.writeAsBytes(await pdf.save());

    // Show a snackbar or dialog confirming the PDF was saved
    print('PDF saved to: ${file.path}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Work Timer')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Access the date and timer text using .value
            Obx(() => Text('Date: ${sessionVM.date.value}', style: TextStyle(fontSize: 16))),
            SizedBox(height: 20),
            Obx(() => Text('Timer: ${sessionVM.timerText.value}', style: TextStyle(fontSize: 24))),
            SizedBox(height: 20),

            // Timer control buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => sessionVM.startWork(),
                  child: Text('Start'),
                ),
                ElevatedButton(
                  onPressed: () => sessionVM.takeBreak(),
                  child: Text('Break'),
                ),
                ElevatedButton(
                  onPressed: () => sessionVM.endWork(),
                  child: Text('End'),
                ),
              ],
            ),

            SizedBox(height: 20),

            // Generate PDF button
            ElevatedButton(
              onPressed: () {
                // Generate the PDF using the session data from sessionVM
                generatePDF(sessionVM.date.value, sessionVM.timerText.value);
              },
              child: Text('Generate PDF'),
            ),
          ],
        ),
      ),
    );
  }
}
