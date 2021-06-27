import 'dart:convert';

import 'package:healthensuite/statemanagement/diskstorage.dart';
import 'package:http/http.dart' as http;
import 'networkUtilities.dart';
import 'networkmodels/loginPodo.dart';
import 'networkmodels/patientProfilePodo.dart';

class ApiAccess {
  Future<LoginPodo> login({String? username, String? password}) async {
    final response = await http.post(
      Uri.parse(loginURL),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
          <String, String?>{"username": username, "password": password}),
    );

    if (response.statusCode == 200) {
      LoginPodo cc = LoginPodo.fromJson(jsonDecode(response.body));
      print("Person ID : ${cc.personID}");
      print("Token : ${cc.token} ");
      String? token = cc.token ?? "";
      print("Token 2 :  $token");
      Localstorage().saveString(key_login_token, token);
      return cc;
    } else {
      throw Exception("Couldn't login, possible wrong passoword");
    }
  }

  String? getLoginToken() {
    String? token;
    Future<String?> tk = Localstorage().getString(key_login_token);
    tk.then((value) => {token = value!});
    return token;
  }

  Future<PatientProfilePodo>? getPatientProfile() async {
    String? token;
    Future<String?> tk = Localstorage().getString(key_login_token);
    await tk.then((value) => {token = value!});
    final response =
        await http.get(Uri.parse(patientprofile_url), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });

    if (response.statusCode == 200) {
      PatientProfilePodo profile =
          PatientProfilePodo.fromJson(jsonDecode(response.body));
      return profile;
    } else {
      throw Exception("Couldn't pull patient profile");
    }
  }

  Future<SleepDiariesPODO> saveSleepDiaries(
      {required SleepDiariesPODO sleepDiary}) async {
    print(" ID :  ${sleepDiary.id}");
    print("Date Created : ${sleepDiary.dateCreated}");
    print("Other Things : ${sleepDiary.otherThings}");
    String? token;
    Future<String?> tk = Localstorage().getString(key_login_token);
    await tk.then((value) => {token = value!});
    final response = await http.post(Uri.parse(loginURL),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token'
        },
        body: sleepDiary.toJson()
        // body: jsonEncode(<String, String?>{
        // }),
        );

    if (response.statusCode == 200) {
      SleepDiariesPODO sleepDiary = SleepDiariesPODO.fromJson(jsonDecode(response.body));
      return sleepDiary;
    } else {
      throw Exception("Couldn't pull patient profile");
    }
  }
}
