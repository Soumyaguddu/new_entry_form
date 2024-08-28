import 'dart:convert';
import 'dart:math';

import 'package:entry_form/view_entry.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hive_flutter/adapters.dart';
import 'hive_functions.dart';

class EntryFormPage extends StatefulWidget {
  const EntryFormPage({super.key});

  @override
  State<EntryFormPage> createState() => _EntryFormPageState();
}

class _EntryFormPageState extends State<EntryFormPage> {
  TextEditingController stallController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController companyNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController contactPersonNameController = TextEditingController();
  TextEditingController companyAddressController = TextEditingController();
  TextEditingController topicInterestedController = TextEditingController();
  TextEditingController meetingScheduleController = TextEditingController();
  TextEditingController meetingTaskController = TextEditingController();
  TextEditingController probrabilityController = TextEditingController();
  String selectedProbability = '0-10'; // Default value
  final List<String> probabilityOptions = [
    '0-10',
    '10-30',
    '30- 70',
    '70-100'
  ];
  List myHiveData = []; // Example options
  getHiveData() {
    myHiveData = HiveFunctions.getAllUsers();

/*if(myHiveData.isNotEmpty)
  {
    setState(() {
      final existingItem =
      myHiveData.firstWhere((element) => element['key']);
      nameController.text = existingItem['companyName'];
      companyNameController.text = existingItem['contactPersonName'];


    });
  }*/

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
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .inversePrimary,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.list_alt),
            onPressed: () {
              // Handle the press
             Navigator.push(context, MaterialPageRoute(builder: (context)=>FormListPage()));
            },
          ),

        ],
        title: const Text("Entry Form"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15.0, bottom: 10.0),
              child: Center(
                child: Text(
                  "Your Personal Details",
                  style: TextStyle(
                      color: Colors.blue.withOpacity(0.7), fontSize: 22),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Padding(
              padding:
              EdgeInsets.only(left: 16.0, right: 16.0, top: 2.0, bottom: 4.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Text(
                      'Stall Number',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: const Color(0xFF000000).withOpacity(0.6),
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            cursorColor: Colors.black,
                            controller: stallController,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            style: TextStyle(
                                color:
                                const Color(0xFF000000).withOpacity(0.8)),
                            decoration: InputDecoration(
                              hintText: '',
                              prefixIcon:
                              Icon(Icons.supervisor_account, size: 20),
                              // Reduce icon size
                              hintStyle: TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10.0,
                                  horizontal: 10.0), // Reduce vertical padding
                            ),
                          ),
                        ),

                        // SVG image or other elements can go here
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Text(
                      'Company Name',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: const Color(0xFF000000).withOpacity(0.6),
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            cursorColor: Colors.black,
                            controller: companyNameController,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            style: TextStyle(
                                color:
                                const Color(0xFF000000).withOpacity(0.8)),
                            decoration: InputDecoration(
                              hintText: '',
                              prefixIcon: Icon(Icons.business, size: 20),
                              // Reduce icon size
                              hintStyle: TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10.0,
                                  horizontal: 10.0), // Reduce vertical padding
                            ),
                          ),
                        ),

                        // SVG image or other elements can go here
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Text(
                      'Contact Person Name',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: const Color(0xFF000000).withOpacity(0.6),
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            cursorColor: Colors.black,
                            controller: contactPersonNameController,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            style: TextStyle(
                                color:
                                const Color(0xFF000000).withOpacity(0.8)),
                            decoration: InputDecoration(
                              hintText: '',
                              prefixIcon: Icon(Icons.person, size: 20),
                              // Reduce icon size
                              hintStyle: TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10.0,
                                  horizontal: 10.0), // Reduce vertical padding
                            ),
                          ),
                        ),

                        // SVG image or other elements can go here
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Text(
                      'Phone Number',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: const Color(0xFF000000).withOpacity(0.6),
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            cursorColor: Colors.black,
                            controller: phoneController,
                            keyboardType: TextInputType.phone,
                            textInputAction: TextInputAction.next,
                            style: TextStyle(
                                color:
                                const Color(0xFF000000).withOpacity(0.8)),
                            decoration: InputDecoration(
                              hintText: '',
                              prefixIcon: Icon(Icons.phone_android, size: 20),
                              // Reduce icon size
                              hintStyle: TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10.0,
                                  horizontal: 10.0), // Reduce vertical padding
                            ),
                          ),
                        ),

                        // SVG image or other elements can go here
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Text(
                      'Email Address',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: const Color(0xFF000000).withOpacity(0.6),
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            cursorColor: Colors.black,
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            style: TextStyle(
                                color:
                                const Color(0xFF000000).withOpacity(0.8)),
                            decoration: InputDecoration(
                              hintText: '',
                              prefixIcon: Icon(Icons.email, size: 20),
                              // Reduce icon size
                              hintStyle: TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10.0,
                                  horizontal: 10.0), // Reduce vertical padding
                            ),
                          ),
                        ),

                        // SVG image or other elements can go here
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Text(
                      'Company Address',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: const Color(0xFF000000).withOpacity(0.6),
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            cursorColor: Colors.black,
                            controller: companyAddressController,
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            textInputAction: TextInputAction.next,
                            style: TextStyle(
                                color:
                                const Color(0xFF000000).withOpacity(0.8)),
                            decoration: InputDecoration(
                              hintText: '',
                              prefixIcon: Icon(Icons.location_history_rounded,
                                  size: 20),
                              // Reduce icon size
                              hintStyle: TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10.0,
                                  horizontal: 10.0), // Reduce vertical padding
                            ),
                          ),
                        ),

                        // SVG image or other elements can go here
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
              child: Row(children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Text(
                          'Topic Interested',
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: const Color(0xFF000000).withOpacity(0.6),
                            fontSize: 18,
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                cursorColor: Colors.black,
                                controller: topicInterestedController,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                style: TextStyle(
                                    color: const Color(0xFF000000)
                                        .withOpacity(0.8)),
                                decoration: InputDecoration(
                                  hintText: '',
                                  prefixIcon: Icon(Icons.topic, size: 20),
                                  // Reduce icon size
                                  hintStyle: TextStyle(color: Colors.grey),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          10.0)),
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 10.0,
                                      horizontal:
                                      10.0), // Reduce vertical padding
                                ),
                              ),
                            ),

                            // SVG image or other elements can go here
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ]),
            ),
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
              child: Row(children: [

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Text(
                          'Meeting Schedule',
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: const Color(0xFF000000).withOpacity(0.6),
                            fontSize: 18,
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () async {
                                  final DateTime? pickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2100),
                                    builder: (BuildContext context, Widget? child) {
                                      return Theme(
                                        data: ThemeData.light().copyWith(
                                          primaryColor: Colors.white,
                                          hintColor: Colors.white,
                                          colorScheme: const ColorScheme.light(primary: Color(0xFF256FB4)),
                                          buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
                                        ),
                                        child: child!,
                                      );
                                    },
                                  );
                                  if (pickedDate != null) {
                                    setState(() {
                                      meetingScheduleController.text = "${pickedDate.toLocal()}".split(' ')[0]; // Format date as needed
                                    });
                                  }
                                },
                                child: AbsorbPointer(
                                  child: TextFormField(
                                    cursorColor: Colors.black,
                                    readOnly: true,
                                    controller: meetingScheduleController,
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.next,
                                    style: TextStyle(color: const Color(0xFF000000).withOpacity(0.8)),
                                    decoration: InputDecoration(
                                      hintText: '',
                                      suffixIcon: Icon(Icons.date_range, size: 20),
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10.0)),
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 10.0, horizontal: 10.0), // Reduce vertical padding
                                    ),
                                  ),
                                ),
                              ),
                            )


                            // SVG image or other elements can go here
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ]),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 16.0, vertical: 4.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Text(
                            'Meeting Location',
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: const Color(0xFF000000).withOpacity(0.6),
                              fontSize: 18,
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: TextFormField(
                            cursorColor: Colors.black,
                            controller: meetingTaskController,
                            // Your TextEditingController for meeting location
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            textInputAction: TextInputAction.next,
                            style: TextStyle(
                                color: const Color(0xFF000000).withOpacity(
                                    0.8)),
                            decoration: InputDecoration(
                              hintText: '',
                              prefixIcon: Icon(Icons.meeting_room, size: 20),
                              // Icon size
                              hintStyle: TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 10.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Add some spacing between fields

                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 16.0, vertical: 4.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Text(
                            'Probability',
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: const Color(0xFF000000).withOpacity(0.6),
                              fontSize: 18,
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child:
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              // Border color
                              borderRadius: BorderRadius.circular(
                                  10.0), // Rounded corners
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: selectedProbability,
                                items: probabilityOptions.map((String option) {
                                  return DropdownMenuItem<String>(
                                    value: option,
                                    child: Text(option),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedProbability = newValue!;
                                  });
                                },
                                isExpanded: true,
                                // Make dropdown take the full width
                                icon: Icon(Icons.arrow_drop_down,
                                    size: 20), // Dropdown icon size
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Add some spacing between fields

                ],
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 25.0, vertical: 20.0),
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: SizedBox(
                  height: 55,
                  width: 160,
                  child:
                  ElevatedButton(
                    onPressed: () => {
                      saveData()
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: const Color(0xFF6869EF),
                        side: BorderSide.none),
                    child: const Text("Submit",
                        style: TextStyle(color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20)),
                  ), // ElevatedButton
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void saveData() async {



    // Generate a unique ID, you can use a UUID package for more complex IDs
    String id = DateTime.now().millisecondsSinceEpoch.toString();


    HiveFunctions.createUser({
      'id': id,
      'stallNumber': stallController.text,
      'companyName': companyNameController.text,
      'contactPersonName': contactPersonNameController.text,
      'phoneNumber': phoneController.text,
      'emailAddress': emailController.text,
      'companyAddress': companyAddressController.text,
      'topicInterested': topicInterestedController.text,
      'meetingSchedule': meetingScheduleController.text,
      'meetingLocation': meetingTaskController.text, // Replace with actual field
      'probability': selectedProbability,
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Data saved successfully!'),
        duration: Duration(seconds: 3),
        backgroundColor: Colors.blue,
      ),
    );

    stallController.clear();
    companyNameController.clear();
    contactPersonNameController.clear();
    phoneController.clear();
    emailController.clear();
    companyAddressController.clear();
    topicInterestedController.clear();
    meetingScheduleController.clear();
    meetingTaskController.clear();

    // Reset the selected probability to default value (optional)
    setState(() {
      selectedProbability = '0-10'; // Or any other default value you prefer
    });

  }



}
