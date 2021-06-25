
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:healthensuite/statemanagement/diskstorage.dart';
import 'package:http/http.dart' as http;
import 'networkUtilities.dart';
import 'networkmodels/loginPodo.dart';
import 'networkmodels/patientProfilePodo.dart';

class ApiAccess{
  Future<LoginPodo> login({String? username, String? password}) async{
    final  response = await http.post(
      Uri.parse(loginURL),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String?>{
        "username":username,
        "password":password
      }),
    );

    if(response.statusCode == 200){
      LoginPodo cc =  LoginPodo.fromJson(jsonDecode(response.body));
      print("Person ID : ${cc.personID}");
      print("Token : ${cc.token} ");
       String? token = cc.token?? "";
       print("Token 2 :  $token");
       Localstorage().saveString(KEY_LOGIN_TOKEN, token);
       // Future<String?> tk = Localstorage().getString(KEY_LOGIN_TOKEN);
       // tk.then((value) => {
       //   print("Disk token is : " + value!)
       // });
      getPatientProfile();
      return cc;
    }else{
      throw Exception("Couldn't login, possible wrong passoword");
    }

  }

  Future<PatientProfilePodo>? getPatientProfile() async{
    String? token;
    Future<String?> tk = Localstorage().getString(KEY_LOGIN_TOKEN);
    await tk.then((value) => {token = value!});

    final  response = await http.get(
      Uri.parse(patientProfile_URL),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      }
    );

    print("Response Code is :  ${response.statusCode}");
    print("Response Body is :  ${response.body}");

    if(response.statusCode == 200) {
      PatientProfilePodo profile = PatientProfilePodo.fromJson(
          jsonDecode(response.body));
      print("ID : ${profile.age}");
      print("First Name : ${profile.firstName}");
      return profile;
    }else{
      throw Exception("Couldn't pull patient profile");
    }
  }

}