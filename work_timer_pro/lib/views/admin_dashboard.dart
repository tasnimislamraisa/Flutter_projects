import '../my_imports.dart';

class AdminDashboard extends StatelessWidget {
  final PDFHelper pdfHelper = PDFHelper();

  Future<void> generatePDFReport() async {
    // Use the named constructor to access DBHelper instance
    final sessions = await DBHelper.instance.query('sessions');
    await pdfHelper.createSummaryPDF(sessions);
    await pdfHelper.saveAndSharePDF('Admin_Report');
  }

  Future<List<Map<String, dynamic>>> getUsersWithSessions() async {
    // Replace with actual logic to retrieve users and their sessions
    final result = await DBHelper.instance.query('sessions');
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Dashboard'),
        actions: [
          IconButton(
            icon: Icon(Icons.picture_as_pdf),
            onPressed: generatePDFReport,
          ),
        ],
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: getUsersWithSessions(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          final usersWithSessions = snapshot.data ?? [];
          if (usersWithSessions.isEmpty) {
            return Center(child: Text('No data available'));
          }
          return ListView.builder(
            itemCount: usersWithSessions.length,
            itemBuilder: (context, index) {
              final session = usersWithSessions[index];
              return ListTile(
                title: Text(session['userName'] ?? ''),
                subtitle: Text('Email: ${session['userEmail']}\n'
                    'Restaurant: ${session['restaurantName']}\n'
                    'Date: ${session['date']}\n'
                    'Total Hours: ${session['totalHours']}'),
              );
            },
          );
        },
      ),
    );
  }
}
