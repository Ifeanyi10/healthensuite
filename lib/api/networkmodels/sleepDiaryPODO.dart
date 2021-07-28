import 'dart:ffi';

import 'package:healthensuite/api/networkmodels/medicationsPODO.dart';

import 'otherMedicationsPODO.dart';
import 'patientProfilePodo.dart';

class SleepDiariesPODO {
  int? id;
  String? bedTime;
  String? tryTosleepTime;
  double? durationBeforesleepoff;
  int? wakeUptimeCount;
  double? totalWakeUpduration;
  String? finalWakeupTime;
  String? timeLeftbed;
  String? sleepQuality;
  String? otherThings;
  List<Medications>? medications;
  List<OtherMedicationsEntity>? othermedications;
  String? dateCreated;

  SleepDiariesPODO(
      {
        this.id,
        this.bedTime,
        this.tryTosleepTime,
        this.durationBeforesleepoff,
        this.wakeUptimeCount,
        this.totalWakeUpduration,
        this.finalWakeupTime,
        this.timeLeftbed,
        this.sleepQuality,
        this.otherThings,
        this.medications,
        this.othermedications,
        this.dateCreated});

  SleepDiariesPODO.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bedTime = json['bedTime'];
    // bedTime =
    // json['bedTime'] != null ? new BedTime.fromJson(json['bedTime']) : null;
    tryTosleepTime = json['tryTosleepTime'];
    // tryTosleepTime = json['tryTosleepTime'] != null
    //     ? new BedTime.fromJson(json['tryTosleepTime'])
    //     : null;
    durationBeforesleepoff = json['durationBeforesleepoff'];
    wakeUptimeCount = json['wakeUptimeCount'];
    totalWakeUpduration = json['totalWakeUpduration'];
    finalWakeupTime = json['finalWakeupTime'];
    // finalWakeupTime = json['finalWakeupTime'] != null
    //     ? new BedTime.fromJson(json['finalWakeupTime'])
    //     : null;
    timeLeftbed = json['timeLeftbed'];
    // timeLeftbed = json['timeLeftbed'] != null
    //     ? new BedTime.fromJson(json['timeLeftbed'])
    //     : null;
    sleepQuality = json['sleepQuality'];
    otherThings = json['otherThings'];
    if (json['medications'] != null) {
      medications = <Medications>[];
      //  medications;
      json['medications'].forEach((v) {
        medications!.add(new Medications.fromJson(v));
      });
    }
    if (json['othermedications'] != null) {
      othermedications = <OtherMedicationsEntity>[];
      //  othermedications;
      json['othermedications'].forEach((v) {
        othermedications!.add(new OtherMedicationsEntity.fromJson(v));
      });
    }
    dateCreated = json['date_Created'];
    // dateCreated = json['date_Created'] != null
    //     ? new DateCreated.fromJson(json['date_Created'])
    //     : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['bedTime'] = this.bedTime;
    data['tryTosleepTime'] = this.tryTosleepTime;
    data['durationBeforesleepoff'] = this.durationBeforesleepoff;
    data['wakeUptimeCount'] = this.wakeUptimeCount;
    data['totalWakeUpduration'] = this.totalWakeUpduration;
    data['finalWakeupTime'] = this.finalWakeupTime;
    data['timeLeftbed'] = this.timeLeftbed;
    data['sleepQuality'] = this.sleepQuality;
    data['otherThings'] = this.otherThings;
    if (this.medications != null) {
      data['medications'] = this.medications!.map((v) => v.toJson()).toList();
    }
    if (this.othermedications != null) {
      data['othermedications'] =
          this.othermedications!.map((v) => v.toJson()).toList();
    }
    data['date_Created'] = this.dateCreated;
    return data;
  }
  void updateVariable(String? bedTime ,
      String? tryTosleepTime,
      double? durationBeforesleepoff,
      int? wakeUptimeCount,
      double? totalWakeUpduration,
      String? finalWakeupTime,
      String? timeLeftbed,
      String? sleepQuality,
      String? otherThings,
      List<Medications> currentMeds,
      OtherMedicationsEntity? otherMeds
      ) {
    this.bedTime = bedTime;
    this.tryTosleepTime = tryTosleepTime;
    this.durationBeforesleepoff = durationBeforesleepoff;
    this.wakeUptimeCount = wakeUptimeCount;
    this.totalWakeUpduration = totalWakeUpduration;
    this.finalWakeupTime = finalWakeupTime;
    this.timeLeftbed = timeLeftbed;
    this.sleepQuality = sleepQuality;
    this.otherThings = otherThings;

    if(currentMeds.length > 0 ){
      this.medications = currentMeds;
    }

    if(otherMeds != null){
      if(othermedications != null){
        this.othermedications!.add(otherMeds);
      }else{
        List<OtherMedicationsEntity> others = [];
        others.add(otherMeds);
        this.othermedications = others;
        print("Other medication got here 01");
      }
    }
  }
  List<OtherMedicationsEntity>? getOthermeds(){
    return this.othermedications;
  }
}