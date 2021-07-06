
import 'package:flutter/material.dart';
import 'package:healthensuite/api/networkmodels/sleepDiaryPODO.dart';
import 'package:healthensuite/api/networkmodels/patientProfilePodo.dart';
import 'package:healthensuite/screens/sleepDiary/sleep_diary.dart';
import 'package:intl/intl.dart';

class Workflow{


  SleepDiariesPODO getSleepDiary(List<SleepDiariesPODO>? sleepdiaries, [bool todaySleepDiary = false, bool yesterdaySleepDiary = false]){
    final now = DateTime.now();
    final dummy = DateTime(now.year, now.month, now.day - 10);
    SleepDiariesPODO sleepDiariesPODO = SleepDiariesPODO();

    sleepdiaries!.forEach((sleepdiary) {
      String datecreated = sleepdiary.dateCreated ?? dummy.toString();
      if(todaySleepDiary){
        if(isToday(datecreated)){
          sleepDiariesPODO = sleepdiary;
        }
      } else if(yesterdaySleepDiary){
        if(isYesterday(datecreated)){
          sleepDiariesPODO = sleepdiary;
        }
      }
    });
    return sleepDiariesPODO;
  }

  bool isSleepDiaryavailable(SleepDiariesPODO sleepDiariesPODO){
    if(sleepDiariesPODO.dateCreated != null){
      return true;
    }else{
      return false;
    }
  }

  bool isToday(String dateTime){
    var date = DateTime.parse(dateTime);
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final aDate = DateTime(date.year, date.month, date.day);
    if(aDate == today){
      return true;
    }else return false;
  }

  bool isYesterday(String dateTime){
    final date = DateTime.parse(dateTime);
    final now = DateTime.now();
    final yesterday = DateTime(now.year, now.month, now.day - 1);
    final aDate = DateTime(date.year, date.month, date.day);
    if(aDate == yesterday){
      return true;
    }else return false;
  }

  String convertDatetime2date(String datetime){
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final DateTime date = DateTime.parse(datetime);
    final String formatted_date = formatter.format(date);
    return formatted_date;
  }

  TimeOfDay? convertStringtoTimeofDay(String?  time){
    if(time != null) {
      var tt = time.split(":");
      int hour = int.parse(tt[0]);
      int minute = int.parse(tt[1]);
      TimeOfDay tod = TimeOfDay(hour: hour, minute: minute);
      return tod;
    }
  }

}