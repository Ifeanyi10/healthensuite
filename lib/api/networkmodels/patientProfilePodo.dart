import 'package:healthensuite/api/networkmodels/interventionLevelsEntityPODO.dart';
import 'package:healthensuite/api/networkmodels/regimenPODO.dart';
import 'package:healthensuite/api/networkmodels/sharedreportsPODO.dart';
import 'package:healthensuite/api/networkmodels/sleepwindowsPODO.dart';
import 'package:healthensuite/api/networkmodels/statusEntityPODO.dart';

import 'sleepDiaryPODO.dart';

class PatientProfilePodo {
  int? id;
  String? firstName;
  String? lastName;
  int? age;
  String? phoneNumber;
  String? email;
  bool? participatingInThestudy;
  String? gender;
  int? trialType;
  int? groupID;
  String? tapperStartDate;
  List<Regimen>? regimen;
  StatusEntity? statusEntity;
  List<SleepDiariesPODO>? sleepDiaries;
  List<Sleepwindows>? sleepwindows;
  InterventionLevelsEntity? interventionLevelsEntity;
  List<Sharedreports>? sharedreports;
  bool? voided;
  bool? verify;
  String? dateCreated;

  PatientProfilePodo(
      {this.id,
        this.firstName,
        this.lastName,
        this.age,
        this.phoneNumber,
        this.email,
        this.participatingInThestudy,
        this.gender,
        this.trialType,
        this.groupID,
        this.tapperStartDate,
        this.regimen,
        this.statusEntity,
        this.sleepDiaries,
        this.sleepwindows,
        this.interventionLevelsEntity,
        this.sharedreports,
        this.voided,
        this.verify,
        this.dateCreated});

  PatientProfilePodo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    age = json['age'];
    phoneNumber = json['phoneNumber'];
    email = json['email'];
    participatingInThestudy = json['participatingInThestudy'];
    gender = json['gender'];
    trialType = json['trialType'];
    groupID = json['groupID'];
    tapperStartDate = json['tapperStartDate'];
    // tapperStartDate = json['tapperStartDate'] != null
    //     ? new TapperStartDate.fromJson(json['tapperStartDate'])
    //     : null;
    if (json['regimen'] != null) {
        regimen = <Regimen>[];
     // regimen;
      json['regimen'].forEach((v) {
        regimen!.add(new Regimen.fromJson(v));
      });
    }
    statusEntity = json['statusEntity'] != null
        ? new StatusEntity.fromJson(json['statusEntity'])
        : null;
    if (json['sleepDiaries'] != null) {
       sleepDiaries = <SleepDiariesPODO>[];
     //  sleepDiaries;
      json['sleepDiaries'].forEach((v) {
        sleepDiaries!.add(new SleepDiariesPODO.fromJson(v));
      });
    }
    if (json['sleepwindows'] != null) {
      sleepwindows = <Sleepwindows>[];
    //  sleepwindows;
      json['sleepwindows'].forEach((v) {
        sleepwindows!.add(new Sleepwindows.fromJson(v));
      });
    }
    interventionLevelsEntity = json['interventionLevelsEntity'] != null
        ? new InterventionLevelsEntity.fromJson(
        json['interventionLevelsEntity'])
        : null;
    if (json['sharedreports'] != null) {
      // sharedreports;
      sharedreports = <Sharedreports>[];
      json['sharedreports'].forEach((v) {
        sharedreports!.add(new Sharedreports.fromJson(v));
      });
    }
    voided = json['voided'];
    verify = json['verify'];
    dateCreated = json['date_Created'];
    // dateCreated = json['date_Created'] != null
    //     ? new DateCreated.fromJson(json['date_Created'])
    //     : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['age'] = this.age;
    data['phoneNumber'] = this.phoneNumber;
    data['email'] = this.email;
    data['participatingInThestudy'] = this.participatingInThestudy;
    data['gender'] = this.gender;
    data['trialType'] = this.trialType;
    data['groupID'] = this.groupID;
    data['tapperStartDate'] = this.tapperStartDate;
    // if (this.tapperStartDate != null) {
    //   data['tapperStartDate'] = this.tapperStartDate!.toJson();
    // }
    if (this.regimen != null) {
      data['regimen'] = this.regimen!.map((v) => v.toJson()).toList();
    }
    if (this.statusEntity != null) {
      data['statusEntity'] = this.statusEntity!.toJson();
    }
    if (this.sleepDiaries != null) {
      data['sleepDiaries'] = this.sleepDiaries!.map((v) => v.toJson()).toList();
    }
    if (this.sleepwindows != null) {
      data['sleepwindows'] = this.sleepwindows!.map((v) => v.toJson()).toList();
    }
    if (this.interventionLevelsEntity != null) {
      data['interventionLevelsEntity'] = this.interventionLevelsEntity!.toJson();
    }
    if (this.sharedreports != null) {
      data['sharedreports'] =
          this.sharedreports!.map((v) => v.toJson()).toList();
    }
    // data['timeZoneID'] = this.timeZoneID;
    data['voided'] = this.voided;
    data['verify'] = this.verify;
    data['date_Created'] = this.dateCreated;
    // if (this.dateCreated != null) {
    //   data['date_Created'] = this.dateCreated!.toJson();
    // }
    return data;
  }
}

// class TapperStartDate {
//   int? year;
//   String? month;
//   int? dayOfMonth;
//   int? monthValue;
//   int? dayOfYear;
//   bool? leapYear;
//   String? dayOfWeek;
//   String? era;
//   Chronology? chronology;
//
//   TapperStartDate(
//       {this.year,
//         this.month,
//         this.dayOfMonth,
//         this.monthValue,
//         this.dayOfYear,
//         this.leapYear,
//         this.dayOfWeek,
//         this.era,
//         this.chronology});
//
//   TapperStartDate.fromJson(Map<String, dynamic> json) {
//     year = json['year'];
//     month = json['month'];
//     dayOfMonth = json['dayOfMonth'];
//     monthValue = json['monthValue'];
//     dayOfYear = json['dayOfYear'];
//     leapYear = json['leapYear'];
//     dayOfWeek = json['dayOfWeek'];
//     era = json['era'];
//     chronology = json['chronology'] != null
//         ? new Chronology.fromJson(json['chronology'])
//         : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['year'] = this.year;
//     data['month'] = this.month;
//     data['dayOfMonth'] = this.dayOfMonth;
//     data['monthValue'] = this.monthValue;
//     data['dayOfYear'] = this.dayOfYear;
//     data['leapYear'] = this.leapYear;
//     data['dayOfWeek'] = this.dayOfWeek;
//     data['era'] = this.era;
//     if (this.chronology != null) {
//       data['chronology'] = this.chronology!.toJson();
//     }
//     return data;
//   }
// }

class Chronology {
  String? id;
  String? calendarType;

  Chronology({required this.id, required this.calendarType});

  Chronology.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    calendarType = json['calendarType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['calendarType'] = this.calendarType;
    return data;
  }
}

// class Regimen {
//   int? id;
//   String? sleepMedication;
//   double? currentDose;
//   int? medicationDuration;
//   int? taperLength;
//   String? taperStartDate;
//   int? conceptID;
//   String? dateCreated;
//
//   Regimen(
//       {this.id,
//         this.sleepMedication,
//         this.currentDose,
//         this.medicationDuration,
//         this.taperLength,
//         this.taperStartDate,
//         this.conceptID,
//         this.dateCreated});
//
//   Regimen.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     sleepMedication = json['sleepMedication'];
//     currentDose = json['currentDose'];
//     medicationDuration = json['medicationDuration'];
//     taperLength = json['taperLength'];
//     taperStartDate = json['taperStartDate'];
//     conceptID = json['conceptID'];
//     dateCreated = json['date_Created'];
//     // dateCreated = json['date_Created'] != null
//     //     ? new DateCreated.fromJson(json['date_Created'])
//     //     : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['sleepMedication'] = this.sleepMedication;
//     data['currentDose'] = this.currentDose;
//     data['medicationDuration'] = this.medicationDuration;
//     data['taperLength'] = this.taperLength;
//     data['taperStartDate'] = this.taperStartDate;
//     data['conceptID'] = this.conceptID;
//     data['date_Created'] = this.dateCreated;
//     // if (this.dateCreated != null) {
//     //   data['date_Created'] = this.dateCreated!.toJson();
//     // }
//     return data;
//   }
// }

// class DateCreated {
//   String? month;
//   int? year;
//   int? dayOfMonth;
//   int? hour;
//   int? minute;
//   int? monthValue;
//   int? nano;
//   int? second;
//   int? dayOfYear;
//   String? dayOfWeek;
//   Chronology? chronology;

//   DateCreated(
//       {this.month,
//         this.year,
//         this.dayOfMonth,
//         this.hour,
//         this.minute,
//         this.monthValue,
//         this.nano,
//         this.second,
//         this.dayOfYear,
//         this.dayOfWeek,
//         this.chronology});
//
//   DateCreated.fromJson(Map<String, dynamic> json) {
//     month = json['month'];
//     year = json['year'];
//     dayOfMonth = json['dayOfMonth'];
//     hour = json['hour'];
//     minute = json['minute'];
//     monthValue = json['monthValue'];
//     nano = json['nano'];
//     second = json['second'];
//     dayOfYear = json['dayOfYear'];
//     dayOfWeek = json['dayOfWeek'];
//     chronology = json['chronology'] != null
//         ? new Chronology.fromJson(json['chronology'])
//         : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['month'] = this.month;
//     data['year'] = this.year;
//     data['dayOfMonth'] = this.dayOfMonth;
//     data['hour'] = this.hour;
//     data['minute'] = this.minute;
//     data['monthValue'] = this.monthValue;
//     data['nano'] = this.nano;
//     data['second'] = this.second;
//     data['dayOfYear'] = this.dayOfYear;
//     data['dayOfWeek'] = this.dayOfWeek;
//     if (this.chronology != null) {
//       data['chronology'] = this.chronology!.toJson();
//     }
//     return data;
//   }
// }

// class StatusEntity {
//   int? id;
//   bool? consent;
//   String? consentEmail;
//   bool? eligible;
//   bool? sleepDiariesCompleted;
//   bool? baselineAssessmenPassed;
//   bool? readInterventionGroupleveloneArticle;
//   bool? readInterventionGroupleveltwoArticle;
//   bool? readInterventionGrouplevelthreeArticle;
//   bool? readInterventionGrouplevelfourArticle;
//   bool? readInterventionGrouplevelfiveArticle;
//   bool? readInterventionGrouplevelsixArticle;
//   int? interventionLevel;
//   bool? enableSleepClockbutton;
//   bool? levelonesubmiteligible;
//   String? lastPsychoeducation;
//  // DateCreated? dateCreated;
//   String? dateCreated;

//   StatusEntity(
//       {this.id,
//         this.consent,
//         this.consentEmail,
//         this.eligible,
//         this.sleepDiariesCompleted,
//         this.baselineAssessmenPassed,
//         this.readInterventionGroupleveloneArticle,
//         this.readInterventionGroupleveltwoArticle,
//         this.readInterventionGrouplevelthreeArticle,
//         this.readInterventionGrouplevelfourArticle,
//         this.readInterventionGrouplevelfiveArticle,
//         this.readInterventionGrouplevelsixArticle,
//         this.interventionLevel,
//         this.enableSleepClockbutton,
//         this.levelonesubmiteligible,
//         this.lastPsychoeducation,
//         this.dateCreated});
//
//   StatusEntity.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     consent = json['consent'];
//     consentEmail = json['consentEmail'];
//     eligible = json['eligible'];
//     sleepDiariesCompleted = json['sleepDiariesCompleted'];
//     baselineAssessmenPassed = json['baselineAssessmenPassed'];
//     readInterventionGroupleveloneArticle =
//     json['readInterventionGroupleveloneArticle'];
//     readInterventionGroupleveltwoArticle =
//     json['readInterventionGroupleveltwoArticle'];
//     readInterventionGrouplevelthreeArticle =
//     json['readInterventionGrouplevelthreeArticle'];
//     readInterventionGrouplevelfourArticle =
//     json['readInterventionGrouplevelfourArticle'];
//     readInterventionGrouplevelfiveArticle =
//     json['readInterventionGrouplevelfiveArticle'];
//     readInterventionGrouplevelsixArticle =
//     json['readInterventionGrouplevelsixArticle'];
//     interventionLevel = json['interventionLevel'];
//     enableSleepClockbutton = json['enableSleepClockbutton'];
//     levelonesubmiteligible = json['levelonesubmiteligible'];
//     lastPsychoeducation = json['lastPsychoeducation'];
//     // lastPsychoeducation = json['lastPsychoeducation'] != null
//     //     ? new TapperStartDate.fromJson(json['lastPsychoeducation'])
//     //     : null;
//     dateCreated = json['date_Created'];
//     // dateCreated = json['date_Created'] != null
//     //     ? new DateCreated.fromJson(json['date_Created'])
//     //     : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['consent'] = this.consent;
//     data['consentEmail'] = this.consentEmail;
//     data['eligible'] = this.eligible;
//     data['sleepDiariesCompleted'] = this.sleepDiariesCompleted;
//     data['baselineAssessmenPassed'] = this.baselineAssessmenPassed;
//     data['readInterventionGroupleveloneArticle'] =
//         this.readInterventionGroupleveloneArticle;
//     data['readInterventionGroupleveltwoArticle'] =
//         this.readInterventionGroupleveltwoArticle;
//     data['readInterventionGrouplevelthreeArticle'] =
//         this.readInterventionGrouplevelthreeArticle;
//     data['readInterventionGrouplevelfourArticle'] =
//         this.readInterventionGrouplevelfourArticle;
//     data['readInterventionGrouplevelfiveArticle'] =
//         this.readInterventionGrouplevelfiveArticle;
//     data['readInterventionGrouplevelsixArticle'] =
//         this.readInterventionGrouplevelsixArticle;
//     data['interventionLevel'] = this.interventionLevel;
//     data['enableSleepClockbutton'] = this.enableSleepClockbutton;
//     data['levelonesubmiteligible'] = this.levelonesubmiteligible;
//     data['lastPsychoeducation'] = this.lastPsychoeducation;
//     // if (this.lastPsychoeducation != null) {
//     //   data['lastPsychoeducation'] = this.lastPsychoeducation!.toJson();
//     // }
//     data['date_Created'] = this.dateCreated;
//     return data;
//   }
 //}

// class SleepDiariesPODO {
//   int? id;
//   String? bedTime;
//   String? tryTosleepTime;
//   double? durationBeforesleepoff;
//   int? wakeUptimeCount;
//   double? totalWakeUpduration;
//   String? finalWakeupTime;
//   String? timeLeftbed;
//   String? sleepQuality;
//   String? otherThings;
//   List<Medications>? medications;
//   List<Othermedications>? othermedications;
//   String? dateCreated;
//
//   SleepDiariesPODO(
//       {
//         this.id,
//         this.bedTime,
//         this.tryTosleepTime,
//         this.durationBeforesleepoff,
//         this.wakeUptimeCount,
//         this.totalWakeUpduration,
//         this.finalWakeupTime,
//         this.timeLeftbed,
//         this.sleepQuality,
//         this.otherThings,
//         this.medications,
//         this.othermedications,
//         this.dateCreated});
//
//   SleepDiariesPODO.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     bedTime = json['bedTime'];
//     // bedTime =
//     // json['bedTime'] != null ? new BedTime.fromJson(json['bedTime']) : null;
//     // tryTosleepTime = json['tryTosleepTime'] != null
//     //     ? new BedTime.fromJson(json['tryTosleepTime'])
//     //     : null;
//     durationBeforesleepoff = json['durationBeforesleepoff'];
//     wakeUptimeCount = json['wakeUptimeCount'];
//     totalWakeUpduration = json['totalWakeUpduration'];
//     finalWakeupTime = json['finalWakeupTime'];
//     // finalWakeupTime = json['finalWakeupTime'] != null
//     //     ? new BedTime.fromJson(json['finalWakeupTime'])
//     //     : null;
//     timeLeftbed = json['timeLeftbed'];
//     // timeLeftbed = json['timeLeftbed'] != null
//     //     ? new BedTime.fromJson(json['timeLeftbed'])
//     //     : null;
//     sleepQuality = json['sleepQuality'];
//     otherThings = json['otherThings'];
//     if (json['medications'] != null) {
//        medications = <Medications>[];
//     //  medications;
//       json['medications'].forEach((v) {
//         medications!.add(new Medications.fromJson(v));
//       });
//     }
//     if (json['othermedications'] != null) {
//      othermedications = <Othermedications>[];
//     //  othermedications;
//       json['othermedications'].forEach((v) {
//         othermedications!.add(new Othermedications.fromJson(v));
//       });
//     }
//     dateCreated = json['date_Created'];
//     // dateCreated = json['date_Created'] != null
//     //     ? new DateCreated.fromJson(json['date_Created'])
//     //     : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['bedTime'] = this.bedTime;
//     data['tryTosleepTime'] = this.tryTosleepTime;
//     data['durationBeforesleepoff'] = this.durationBeforesleepoff;
//     data['wakeUptimeCount'] = this.wakeUptimeCount;
//     data['totalWakeUpduration'] = this.totalWakeUpduration;
//     data['finalWakeupTime'] = this.finalWakeupTime;
//     data['timeLeftbed'] = this.timeLeftbed;
//     data['sleepQuality'] = this.sleepQuality;
//     data['otherThings'] = this.otherThings;
//     if (this.medications != null) {
//       data['medications'] = this.medications!.map((v) => v.toJson()).toList();
//     }
//     if (this.othermedications != null) {
//       data['othermedications'] =
//           this.othermedications!.map((v) => v.toJson()).toList();
//     }
//     data['date_Created'] = this.dateCreated;
//     return data;
//   }
//   void updateVariable(String bedTime, String tryTosleepTime, double durationBeforesleepoff, int wakeUptimeCount,
//       double totalWakeUpduration, String finalWakeupTime, String timeLeftbed, String sleepQuality, otherThings
//       ) {
//     this.bedTime = bedTime;
//     this.tryTosleepTime = tryTosleepTime;
//     this.durationBeforesleepoff = durationBeforesleepoff;
//     this.wakeUptimeCount = wakeUptimeCount;
//     this.totalWakeUpduration = totalWakeUpduration;
//     this.finalWakeupTime = finalWakeupTime;
//     this.timeLeftbed = timeLeftbed;
//     this.sleepQuality = sleepQuality;
//     this.otherThings = otherThings;
//   }
// }

class BedTime {
  int? hour;
  int? minute;
  int? second;
  int? nano;

  BedTime({this.hour, this.minute, this.second, this.nano});

  BedTime.fromJson(Map<String, dynamic> json) {
    hour = json['hour'];
    minute = json['minute'];
    second = json['second'];
    nano = json['nano'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hour'] = this.hour;
    data['minute'] = this.minute;
    data['second'] = this.second;
    data['nano'] = this.nano;
    return data;
  }
}

// class Medications {
//   int? id;
//   String? medicationName;
//   double? amount;
//   String? dateCreated;
//
//   Medications({this.id, this.medicationName, this.amount, this.dateCreated});
//
//   Medications.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     medicationName = json['medicationName'];
//     amount = json['amount'];
//     dateCreated = json['date_Created'];
//     // dateCreated = json['date_Created'] != null
//     //     ? new DateCreated.fromJson(json['date_Created'])
//     //     : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['medicationName'] = this.medicationName;
//     data['amount'] = this.amount;
//     data['date_Created'] = this.dateCreated;
//     // if (this.dateCreated != null) {
//     //   data['date_Created'] = this.dateCreated!.toJson();
//     // }
//     return data;
//   }
// }

// class Sleepwindows {
//   int? id;
//   BedTime? bedtime;
//   BedTime? risetime;
//   BedTime? revisedbedtime;
//   BedTime? revisedrisetime;
//   String? dateCreated;
//
//   Sleepwindows(
//       {this.id,
//         this.bedtime,
//         this.risetime,
//         this.revisedbedtime,
//         this.revisedrisetime,
//         this.dateCreated});
//
//   Sleepwindows.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     bedtime =
//     json['bedtime'] != null ? new BedTime.fromJson(json['bedtime']) : null;
//     risetime = json['risetime'] != null
//         ? new BedTime.fromJson(json['risetime'])
//         : null;
//     revisedbedtime = json['revisedbedtime'] != null
//         ? new BedTime.fromJson(json['revisedbedtime'])
//         : null;
//     revisedrisetime = json['revisedrisetime'] != null
//         ? new BedTime.fromJson(json['revisedrisetime'])
//         : null;
//     dateCreated = json['date_Created'];
//     // dateCreated = json['date_Created'] != null
//     //     ? new DateCreated.fromJson(json['date_Created'])
//     //     : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     if (this.bedtime != null) {
//       data['bedtime'] = this.bedtime!.toJson();
//     }
//     if (this.risetime != null) {
//       data['risetime'] = this.risetime!.toJson();
//     }
//     if (this.revisedbedtime != null) {
//       data['revisedbedtime'] = this.revisedbedtime!.toJson();
//     }
//     if (this.revisedrisetime != null) {
//       data['revisedrisetime'] = this.revisedrisetime!.toJson();
//     }
//     data['date_Created'] = this.dateCreated;
//     return data;
//   }
// }

// class InterventionLevelsEntity {
//   int? id;
//   int? interventionLevel;
//   Null levelOneEntity;
//   Null levelTwoEntity;
//   Null levelThreeEntity;
//   Null levelFiveEntity;
//   Null levelSixEntity;
//   Null psychoEducationreports;
//   String? dateCreated;
//
//   InterventionLevelsEntity(
//       {this.id,
//         this.interventionLevel,
//         this.levelOneEntity,
//         this.levelTwoEntity,
//         this.levelThreeEntity,
//         this.levelFiveEntity,
//         this.levelSixEntity,
//         this.psychoEducationreports,
//         this.dateCreated});
//
//   InterventionLevelsEntity.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     interventionLevel = json['interventionLevel'];
//     levelOneEntity = json['levelOneEntity'];
//     levelTwoEntity = json['levelTwoEntity'];
//     levelThreeEntity = json['levelThreeEntity'];
//     levelFiveEntity = json['levelFiveEntity'];
//     levelSixEntity = json['levelSixEntity'];
//     psychoEducationreports = json['psychoEducationreports'];
//     dateCreated = json['date_Created'];
//     // dateCreated = json['date_Created'] != null
//     //     ? new DateCreated.fromJson(json['date_Created'])
//     //     : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['interventionLevel'] = this.interventionLevel;
//     data['levelOneEntity'] = this.levelOneEntity;
//     data['levelTwoEntity'] = this.levelTwoEntity;
//     data['levelThreeEntity'] = this.levelThreeEntity;
//     data['levelFiveEntity'] = this.levelFiveEntity;
//     data['levelSixEntity'] = this.levelSixEntity;
//     data['psychoEducationreports'] = this.psychoEducationreports;
//     data['date_Created'] = this.dateCreated;
//     // if (this.dateCreated != null) {
//     //   data['date_Created'] = this.dateCreated!.toJson();
//     // }
//     return data;
//   }
// }

// class Sharedreports {
//   int? id;
//   String? firstName;
//   String? lastName;
//   int? age;
//   String? gender;
//   BedTime? averageBedtime;
//   double? sleeplatency;
//   double? averagenumberofawakenings;
//   double? waso;
//   double? tib;
//   double? tst;
//   double? se;
//   double? averageSleepHours;
//   String? startDate;
//   String? endDate;
//   String? dateCreated;
//
//   Sharedreports(
//       {this.id,
//         this.firstName,
//         this.lastName,
//         this.age,
//         this.gender,
//         this.averageBedtime,
//         this.sleeplatency,
//         this.averagenumberofawakenings,
//         this.waso,
//         this.tib,
//         this.tst,
//         this.se,
//         this.averageSleepHours,
//         this.startDate,
//         this.endDate,
//         this.dateCreated});
//
//   Sharedreports.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     firstName = json['firstName'];
//     lastName = json['lastName'];
//     age = json['age'];
//     gender = json['gender'];
//     averageBedtime = json['averageBedtime'] != null
//         ? new BedTime.fromJson(json['averageBedtime'])
//         : null;
//     sleeplatency = json['sleeplatency'];
//     averagenumberofawakenings = json['averagenumberofawakenings'];
//     waso = json['waso'];
//     tib = json['tib'];
//     tst = json['tst'];
//     se = json['se'];
//     averageSleepHours = json['averageSleepHours'];
//     startDate = json['startDate'];
//     endDate = json['endDate'];
//     dateCreated = json['date_Created'];
//
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['firstName'] = this.firstName;
//     data['lastName'] = this.lastName;
//     data['age'] = this.age;
//     data['gender'] = this.gender;
//     if (this.averageBedtime != null) {
//       data['averageBedtime'] = this.averageBedtime!.toJson();
//     }
//     data['sleeplatency'] = this.sleeplatency;
//     data['averagenumberofawakenings'] = this.averagenumberofawakenings;
//     data['waso'] = this.waso;
//     data['tib'] = this.tib;
//     data['tst'] = this.tst;
//     data['se'] = this.se;
//     data['averageSleepHours'] = this.averageSleepHours;
//     data['startDate'] = this.startDate;
//     data['endDate'] = this.endDate;
//     data['date_Created'] = this.dateCreated;
//     return data;
//   }
// }

// class Othermedications {
//   int? id;
//   String? medicationName;
//   double? amount;
//   String? dateCreated;
//
//   Othermedications(
//       {this.id, this.medicationName, this.amount, this.dateCreated});
//
//   Othermedications.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     medicationName = json['medicationName'];
//     amount = json['amount'];
//     dateCreated = json['date_Created'];
//     // dateCreated = json['date_Created'] != null
//     //     ? new DateCreated.fromJson(json['date_Created'])
//     //     : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['medicationName'] = this.medicationName;
//     data['amount'] = this.amount;
//     data['date_Created'] = this.dateCreated;
//     return data;
//   }
// }
//
// class DateCreated {
//   String month;
//   int year;
//   int dayOfMonth;
//   int hour;
//   int minute;
//   int monthValue;
//   int nano;
//   int second;
//   int dayOfYear;
//   String dayOfWeek;
//   Chronology chronology;
//
//   DateCreated(
//       {this.month,
//         this.year,
//         this.dayOfMonth,
//         this.hour,
//         this.minute,
//         this.monthValue,
//         this.nano,
//         this.second,
//         this.dayOfYear,
//         this.dayOfWeek,
//         this.chronology});
//
//   DateCreated.fromJson(Map<String, dynamic> json) {
//     month = json['month'];
//     year = json['year'];
//     dayOfMonth = json['dayOfMonth'];
//     hour = json['hour'];
//     minute = json['minute'];
//     monthValue = json['monthValue'];
//     nano = json['nano'];
//     second = json['second'];
//     dayOfYear = json['dayOfYear'];
//     dayOfWeek = json['dayOfWeek'];
//     chronology = json['chronology'] != null
//         ? new Chronology.fromJson(json['chronology'])
//         : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['month'] = this.month;
//     data['year'] = this.year;
//     data['dayOfMonth'] = this.dayOfMonth;
//     data['hour'] = this.hour;
//     data['minute'] = this.minute;
//     data['monthValue'] = this.monthValue;
//     data['nano'] = this.nano;
//     data['second'] = this.second;
//     data['dayOfYear'] = this.dayOfYear;
//     data['dayOfWeek'] = this.dayOfWeek;
//     if (this.chronology != null) {
//       data['chronology'] = this.chronology.toJson();
//     }
//     return data;
//   }
// }
//
// class Chronology {
//   String id;
//   String calendarType;
//
//   Chronology({this.id, this.calendarType});
//
//   Chronology.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     calendarType = json['calendarType'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['calendarType'] = this.calendarType;
//     return data;
//   }
//}