import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'entry_form.dart';
import 'hive_functions.dart';
import 'package:hive_flutter/adapters.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'dart:io';
import 'package:syncfusion_flutter_xlsio/xlsio.dart' as xcel;

class FormListTechwensPage extends StatefulWidget {
  const FormListTechwensPage({super.key});

  @override
  State<FormListTechwensPage> createState() => _FormListTechwensPageState();
}

class _FormListTechwensPageState extends State<FormListTechwensPage> {
  List myHiveData = [];

  getHiveData() {
    myHiveData = HiveFunctions.getAllUsers();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getHiveData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.download_for_offline),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Download Confirmation'),
                      content: Text(
                          'You are about to download the results as an Excel sheet. Proceed?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(); // Close the dialog
                          },
                          child: Text('No'),
                        ),
                        TextButton(
                          onPressed: () async {
                            Navigator.of(context).pop(); // Close the dialog
                            generateAndSaveExcel(); // Call the function to save the Excel file
                            //exportToPDF(); // Call the function to export to PDF
                          },
                          child: Text('Yes'),
                        ),
                      ],
                    );
                  },
                );
              },
            )
          ],
          title: const Text("Form View"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: myHiveData.isEmpty // To show when no data is stored
              ? const Center(
              child: Text(
                "No Data is Stored",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ))
          // To show when data is stored
              : ListView.builder(
            itemCount: myHiveData.length,
            itemBuilder: (context, index) {
              final userData = myHiveData[index];
              return Card(
                surfaceTintColor: Colors.white,
                color: Colors.white,
                margin: const EdgeInsets.symmetric(
                    vertical: 8.0, horizontal: 5.0),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Row(
                            children: [
                              Text("Name :  ",
                                  style: TextStyle(
                                      color:
                                      Colors.black.withOpacity(0.8))),
                              Text(
                                "${userData["contactPersonName"] ?? 'N/A'}",
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                                overflow: TextOverflow.ellipsis,
                                // Adds ellipsis when text overflows
                                maxLines: 1,
                              ),
                            ],
                          ),
                          Divider(color: Colors.grey),
                          Row(
                            children: [
                              Text("Email :  ",
                                  style: TextStyle(
                                      color:
                                      Colors.black.withOpacity(0.8))),
                              Expanded(
                                child: Text(
                                  "${userData["emailAddress"] ?? 'N/A'}",
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                  overflow: TextOverflow.ellipsis,
                                  // Adds ellipsis when text overflows
                                  maxLines: 1,
                                ),
                              ),
                            ],
                          ),
                          Divider(color: Colors.grey),
                          Row(
                            children: [
                              Text("Company Name :  ",
                                  style: TextStyle(
                                      color:
                                      Colors.black.withOpacity(0.8))),
                              Expanded(
                                child: Text(
                                  "${userData["companyName"] ?? 'N/A'}",
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                  overflow: TextOverflow.ellipsis,
                                  // Adds ellipsis when text overflows
                                  maxLines: 1,
                                ),
                              ),
                            ],
                          ),
                          Divider(color: Colors.grey),
                          Row(
                            children: [
                              Text("Phone :  ",
                                  style: TextStyle(
                                      color:
                                      Colors.black.withOpacity(0.8))),
                              Expanded(
                                child: Text(
                                  "${userData["phoneNumber"] ?? 'N/A'}",
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                  overflow: TextOverflow.ellipsis,
                                  // Adds ellipsis when text overflows
                                  maxLines: 1,
                                ),
                              ),
                            ],
                          ),
                          Divider(color: Colors.grey),
                          Row(
                            children: [
                              Text("Country Name :  ",
                                  style: TextStyle(
                                      color:
                                      Colors.black.withOpacity(0.8))),
                              Expanded(
                                child: Text(
                                  "${userData["countryName"] ?? 'N/A'}",
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                  overflow: TextOverflow.ellipsis,
                                  // Adds ellipsis when text overflows
                                  maxLines: 1,
                                ),
                              ),
                            ],
                          ),
                          Divider(color: Colors.grey),
                          Row(
                            children: [
                              Text("Looking For :  ",
                                  style: TextStyle(
                                      color:
                                      Colors.black.withOpacity(0.8))),
                              Expanded(
                                child: Text(
                                  "${userData["selectedSolution"] ?? 'N/A'}",
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ),
                            ],
                          ),
                          Divider(color: Colors.grey),
                          Row(
                            children: [
                              Text("Req. Details :  ",
                                  style: TextStyle(
                                      color:
                                      Colors.black.withOpacity(0.8))),
                              Expanded(
                                child: Text(
                                  "${userData["detailsReq"] ?? 'N/A'}",
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                  overflow: TextOverflow.ellipsis,
                                  // Adds ellipsis when text overflows
                                  maxLines: 1,
                                ),
                              ),
                            ],
                          ),

                        ],
                      ),
                    ),
                    Positioned(
                      top: -8,
                      right: -8,
                      child: IconButton(
                        icon:
                        const Icon(Icons.delete, color: Colors.black),
                        onPressed: () {
                          HiveFunctions.deleteUser(userData["key"]);
                          getHiveData();
                          print('Icon pressed');
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ));
  }

  /* void exportToExcel() async {
    List<Map<String, dynamic>> data = await fetchHiveData();
    await saveDataToExcel(data);
  }*/
  Future<List<Map<String, dynamic>>> fetchHiveData() async {
    var box = await Hive.openBox('formData');
    List<Map<String, dynamic>> data = [];
    for (var key in box.keys) {
      data.add(box.get(key));
    }
    return data;
  }

  Future<void> exportToPDF() async {
    List data = myHiveData;
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text('Form Data',
                  style: pw.TextStyle(
                      fontSize: 24, fontWeight: pw.FontWeight.bold)),
              pw.SizedBox(height: 20),
              ...data.map((item) => pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [

                  pw.Text('Name: ${item["contactPersonName"] ?? "N/A"}'),
                  pw.Text('Email: ${item["emailAddress"] ?? "N/A"}'),
                  pw.Text('Company Name: ${item["companyName"] ?? "N/A"}'),
                  pw.Text('Phone: ${item["phoneNumber"] ?? "N/A"}'),
                  pw.Text('Country Name: ${item["countryName"] ?? "N/A"}'),
                  pw.Text('Looking For: ${item["selectedSolution"] ?? "N/A"}'),
                  pw.Text('Req. Details: ${item["detailsReq"] ?? "N/A"}'),

                  pw.SizedBox(height: 20),
                ],
              ))
            ],
          );
        },
      ),
    );

    final directory = await getApplicationDocumentsDirectory();
    final path = '${directory.path}/hive_data.pdf';
    final file = File(path);
    await file.writeAsBytes(await pdf.save());

    print('PDF file saved at $path');
  }

  Future<void> generateAndSaveExcel() async {
    final List users = myHiveData; // Fetch the user data

    final xcel.Workbook workbook =
    xcel.Workbook(); // Create a new Excel workbook
    final xcel.Worksheet sheet =
    workbook.worksheets[0]; // Use the first worksheet
    String id = DateTime.now().millisecondsSinceEpoch.toString();
    String excelFile = 'user__new_28082024_data_${id.toString()}'; // Name of the Excel file

    // Set the header row
    sheet.getRangeByIndex(1, 1).setText('ID');
    sheet.getRangeByIndex(1, 2).setText('Name');
    sheet.getRangeByIndex(1, 3).setText('Email Address');
    sheet.getRangeByIndex(1, 4).setText('Company Name');
    sheet.getRangeByIndex(1, 5).setText('Phone Number');
    sheet.getRangeByIndex(1, 6).setText('Country Name');
    sheet.getRangeByIndex(1, 7).setText('Looking For');
    sheet.getRangeByIndex(1, 8).setText('Details Requirement');


    // Loop through the user data and add rows to the Excel sheet
    for (var i = 0; i < users.length; i++) {
      final user = users[i];
      sheet.getRangeByIndex(i + 2, 1).setText(user['key'].toString());
      sheet.getRangeByIndex(i + 2, 2).setText(user['contactPersonName']);
      sheet.getRangeByIndex(i + 2, 3).setText(user['emailAddress']);
      sheet.getRangeByIndex(i + 2, 4).setText(user['companyName']);
      sheet.getRangeByIndex(i + 2, 5).setText(user['phoneNumber']);
      sheet.getRangeByIndex(i + 2, 6).setText(user['countryName']);
      sheet.getRangeByIndex(i + 2, 7).setText(user['selectedSolution']);
      sheet.getRangeByIndex(i + 2, 8).setText(user['detailsReq']);
    }

    // Save the document in the downloads folder
    final List<int> bytes = workbook.saveAsStream();
    final directory = Directory('/storage/emulated/0/Download');
    final file = File('${directory.path}/$excelFile.xlsx');
    await file.writeAsBytes(bytes, flush: true);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Excel file saved at ${file.path}'),
        duration: Duration(seconds: 3),
        backgroundColor: Colors.blue,
      ),
    );
    // Dispose the workbook to free up memory
    workbook.dispose();

    print('Excel file saved at ${file.path}');
  }
/*void exportToExcel() async {
    List<Map<String, dynamic>> data = await fetchHiveData();
    await saveDataToExcel(data);
  }

  Future<void> saveDataToExcel(List<Map<String, dynamic>> data) async {
    var excel = Excel.createExcel(); // Create a new Excel file
    Sheet sheet = excel['Sheet1']; // Add a sheet

    // Add headers
    sheet.appendRow(['ID', 'Stall Number', 'Company Name', 'Contact Person Name', 'Phone Number', 'Email Address', 'Company Address', 'Topic Interested', 'Meeting Schedule', 'Meeting Location', 'Probability']);

    // Add data rows
    for (var item in data) {
      sheet.appendRow([
        item['id'],
        item['stallNumber'],
        item['companyName'],
        item['contactPersonName'],
        item['phoneNumber'],
        item['emailAddress'],
        item['companyAddress'],
        item['topicInterested'],
        item['meetingSchedule'],
        item['meetingLocation'],
        item['probability']
      ]);
    }

    // Save the file
    final directory = await getApplicationDocumentsDirectory();
    final path = '${directory.path}/hive_data.xlsx';
    var file = File(path);
    file.writeAsBytesSync(excel.save()!);

    print('Excel file saved at $path');
  }*/
}
