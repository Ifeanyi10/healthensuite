class InterventionLevelsEntity {
  int? id;
  int? interventionLevel;
  Null levelOneEntity;
  Null levelTwoEntity;
  Null levelThreeEntity;
  Null levelFiveEntity;
  Null levelSixEntity;
  Null psychoEducationreports;
  String? dateCreated;

  InterventionLevelsEntity(
      {this.id,
        this.interventionLevel,
        this.levelOneEntity,
        this.levelTwoEntity,
        this.levelThreeEntity,
        this.levelFiveEntity,
        this.levelSixEntity,
        this.psychoEducationreports,
        this.dateCreated});

  InterventionLevelsEntity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    interventionLevel = json['interventionLevel'];
    levelOneEntity = json['levelOneEntity'];
    levelTwoEntity = json['levelTwoEntity'];
    levelThreeEntity = json['levelThreeEntity'];
    levelFiveEntity = json['levelFiveEntity'];
    levelSixEntity = json['levelSixEntity'];
    psychoEducationreports = json['psychoEducationreports'];
    dateCreated = json['date_Created'];
    // dateCreated = json['date_Created'] != null
    //     ? new DateCreated.fromJson(json['date_Created'])
    //     : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['interventionLevel'] = this.interventionLevel;
    data['levelOneEntity'] = this.levelOneEntity;
    data['levelTwoEntity'] = this.levelTwoEntity;
    data['levelThreeEntity'] = this.levelThreeEntity;
    data['levelFiveEntity'] = this.levelFiveEntity;
    data['levelSixEntity'] = this.levelSixEntity;
    data['psychoEducationreports'] = this.psychoEducationreports;
    data['date_Created'] = this.dateCreated;
    // if (this.dateCreated != null) {
    //   data['date_Created'] = this.dateCreated!.toJson();
    // }
    return data;
  }
}
