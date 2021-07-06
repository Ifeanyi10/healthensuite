class Regimen {
  int? id;
  String? sleepMedication;
  double? currentDose;
  int? medicationDuration;
  int? taperLength;
  String? taperStartDate;
  int? conceptID;
  String? dateCreated;

  Regimen(
      {this.id,
        this.sleepMedication,
        this.currentDose,
        this.medicationDuration,
        this.taperLength,
        this.taperStartDate,
        this.conceptID,
        this.dateCreated});

  Regimen.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sleepMedication = json['sleepMedication'];
    currentDose = json['currentDose'];
    medicationDuration = json['medicationDuration'];
    taperLength = json['taperLength'];
    taperStartDate = json['taperStartDate'];
    conceptID = json['conceptID'];
    dateCreated = json['date_Created'];
    // dateCreated = json['date_Created'] != null
    //     ? new DateCreated.fromJson(json['date_Created'])
    //     : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['sleepMedication'] = this.sleepMedication;
    data['currentDose'] = this.currentDose;
    data['medicationDuration'] = this.medicationDuration;
    data['taperLength'] = this.taperLength;
    data['taperStartDate'] = this.taperStartDate;
    data['conceptID'] = this.conceptID;
    data['date_Created'] = this.dateCreated;
    // if (this.dateCreated != null) {
    //   data['date_Created'] = this.dateCreated!.toJson();
    // }
    return data;
  }
}