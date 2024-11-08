import 'package:country_picker/country_picker.dart';
import 'package:entry_form/view_entry.dart';
import 'package:entry_form/view_entry_form.dart';
import 'package:flutter/material.dart';

import 'hive_functions.dart';

class EntryFormTechwens extends StatefulWidget {
  const EntryFormTechwens({super.key});

  @override
  State<EntryFormTechwens> createState() => _EntryFormTechwensState();
}

class _EntryFormTechwensState extends State<EntryFormTechwens> {
  TextEditingController contactPersonNameController = TextEditingController();
  TextEditingController companyNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController detailsReqController = TextEditingController();
  final List<String> probabilityOptions = [
    'Fintech Solution',
    'Proptech Solution',
    'Travel Tech Solution',
    'Paas Solution',
    'Carbon Credit Market',
    'Gen AI',
  ];
  String selectedSolution = 'Fintech Solution';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    countryController.text='India';
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
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => FormListTechwensPage()));
            },
          ),

        ],
        title: const Text("Entry Form"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Text(
                      'Name',
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
                          child:
                          TextFormField(
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
                      'Country Name',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: const Color(0xFF000000).withOpacity(0.6),
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
      InkWell(
        onTap: () {

        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  cursorColor: Colors.black,
                  controller: countryController,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  style: TextStyle(color: const Color(0xFF000000).withOpacity(0.8)),
                  decoration: InputDecoration(
                    hintText: '',
                    prefixIcon: Icon(Icons.flag, size: 20),
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    contentPadding: EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 10.0),
                  ),
                  readOnly: true, // Makes the text field non-editable
                  onTap: () {
                    // Show the country picker dialog when the text field is tapped
                    showCountryPicker(
                      context: context,
                      showPhoneCode: true,
                      onSelect: (Country country) {
                        countryController.text = country.name; // Update the controller with the selected country
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      )

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
                            'Looking For',
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
                                value: selectedSolution,
                                items: probabilityOptions.map((String option) {
                                  return DropdownMenuItem<String>(
                                    value: option,
                                    child: Text(option),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedSolution = newValue!;
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
                            'Details Requirement',
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
                            controller: detailsReqController,
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
                    onPressed: () =>
                    {
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
      'companyName': companyNameController.text,
      'contactPersonName': contactPersonNameController.text,
      'phoneNumber': phoneController.text,
      'emailAddress': emailController.text,
      'countryName': countryController.text,
      'selectedSolution': selectedSolution.toString(),
      'detailsReq': detailsReqController.text.toString(),

    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Data saved successfully!'),
        duration: Duration(seconds: 3),
        backgroundColor: Colors.blue,
      ),
    );

    companyNameController.clear();
    contactPersonNameController.clear();
    phoneController.clear();
    emailController.clear();
    countryController.clear();
    detailsReqController.clear();
    selectedSolution=='';

    // Reset the selected probability to default value (optional)
    setState(() {
      selectedSolution = 'Fintech Solution'; // Or any other default value you prefer
    });

  }
}
