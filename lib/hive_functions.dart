import 'package:hive_flutter/hive_flutter.dart';

class HiveFunctions {
  static const String userHiveBox = "formData";

// Box which will use to store the things
  static final userBox = Hive.box(userHiveBox);

// Create or add single data in hive
  static createUser(Map data) {
    userBox.add(data);
  }

// Create or add multiple data in hive
  static addAllUser(List data) {
    userBox.addAll(data);
  }

// Get All data stored in hive
  static List getAllUsers() {
    final data = userBox.keys.map((key) {
      final value = userBox.get(key);
      return {
        "key": key,
        "companyName": value["companyName"],
        "contactPersonName": value['contactPersonName'],
        "stallNumber": value['stallNumber'],
        "phoneNumber": value['phoneNumber'],
        "emailAddress": value['emailAddress'],
        "companyAddress": value['companyAddress'],
        "topicInterested": value['topicInterested'],
        "meetingSchedule": value['meetingSchedule'],
        "meetingLocation": value['meetingLocation'],
        "probability": value['probability'],
      };
    }).toList();

    return data.reversed.toList();
  }

// Get data for particular user in hive
  static Map getUser(int key) {
    return userBox.get(key);
  }

// update data for particular user in hive
  static updateUser(int key, Map data) {
    userBox.put(key, data);
  }

// delete data for particular user in hive
  static deleteUser(int key) {
    return userBox.delete(key);
  }
  static void createOrUpdateUser(Map<String, dynamic> userData) {
    final box = Hive.box('formData');
    box.put(userData['id'], userData); // This will create or update the user
  }
// delete data for particular user in hive
  static deleteAllUser(int key) {
    return userBox.deleteAll(userBox.keys);
  }


}
