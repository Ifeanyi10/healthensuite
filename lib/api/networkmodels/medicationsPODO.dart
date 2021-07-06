class Medications {
  int? id;
  String? medicationName;
  double? amount;
  String? dateCreated;

  Medications({this.id, this.medicationName, this.amount, this.dateCreated});

  Medications.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    medicationName = json['medicationName'];
    amount = json['amount'];
    dateCreated = json['date_Created'];
    // dateCreated = json['date_Created'] != null
    //     ? new DateCreated.fromJson(json['date_Created'])
    //     : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['medicationName'] = this.medicationName;
    data['amount'] = this.amount;
    data['date_Created'] = this.dateCreated;
    // if (this.dateCreated != null) {
    //   data['date_Created'] = this.dateCreated!.toJson();
    // }
    return data;
  }
}
