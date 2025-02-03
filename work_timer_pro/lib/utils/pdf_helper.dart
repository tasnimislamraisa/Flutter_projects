import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class PDFHelper {
  final pw.Document pdf = pw.Document();

  Future<void> createSummaryPDF(List<Map<String, dynamic>> sessions) async {
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Table.fromTextArray(
            headers: [
              'Date',
              'Name',
              'Position',
              'Start Time',
              'End Time',
              'Break Time',
              'Total Hours',
              'Restaurant Name'
            ],
            data: sessions.map((session) {
              return [
                session['date'],
                session['name'],
                session['position'],
                session['startTime'],
                session['endTime'],
                session['breakTime'],
                session['totalHours'],
                session['restaurantName'],
              ];
            }).toList(),
          );
        },
      ),
    );
  }

  Future<void> saveAndSharePDF(String fileName) async {
    final output = await getTemporaryDirectory();
    final file = File("${output.path}/$fileName.pdf");
    await file.writeAsBytes(await pdf.save());
    await Printing.sharePdf(bytes: file.readAsBytesSync(), filename: fileName);
  }
}
