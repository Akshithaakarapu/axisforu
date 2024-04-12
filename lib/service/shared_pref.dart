import 'package:shared_preferences/shared_preferences.dart';

class SharedpreferenceHelper{
  static String userIdkey = "USERKEY";
  static String userNameKey = "USERNAMEKEY";
  static String userEmailKey = "USEREMAILKEY";
  static String userPicKey = "USERPICKEY";
  static String userDisplayName = "USERDISPLAYNAME";
  static String userPhoneNumber = "USERPHONENUMBER";

  // save the information 
  Future<bool> saveUserId (String getUserID) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.setString(userIdkey, getUserID);
  }
  Future<bool> saveUserEmail (String getUserEmail) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.setString(userEmailKey, getUserEmail);
  }
  Future<bool> saveUserName (String getUserName) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.setString(userNameKey, getUserName);
  }
  // Future<bool> saveUserPic (String getUserPic) async{
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   return preferences.setString(userPicKey, getUserPic);
  // }
  Future<bool> saveUserDisplayName (String getUserDisplayName) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.setString(userDisplayName, getUserDisplayName);
  }
  Future<bool> saveUserPhoneNumber (String getUserPhoneNumber) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.setString(userPhoneNumber, getUserPhoneNumber);
  }
  // this functions get the information 
  Future<String?> getUserId () async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userIdkey);
  }
  Future<String?> getUserEmail () async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userEmailKey);
  }
  Future<String?> getUserName () async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userNameKey);
  }
  // Future<String?> getUserPic() async{
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   return prefs.getString(userPicKey);
  // }
  Future<String?> getUserDisplayName() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userDisplayName);
  }
  Future<String?> getUserPhoneNumber() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userPhoneNumber);
  }
}