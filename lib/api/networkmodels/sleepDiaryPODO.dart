import 'package:healthensuite/api/networkmodels/medicationsPODO.dart';

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
  List<Medications>? othermedications;
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
      othermedications = <Medications>[];
      //  othermedications;
      json['othermedications'].forEach((v) {
        othermedications!.add(new Medications.fromJson(v));
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
  void updateVariable(String bedTime, String tryTosleepTime, double durationBeforesleepoff, int wakeUptimeCount,
      double totalWakeUpduration, String finalWakeupTime, String timeLeftbed, String sleepQuality, otherThings
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
  }
}