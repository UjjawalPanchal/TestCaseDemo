/*
* @author Ujjawal Panchal
* @Date 17/04/23
*
* class contains Cricket object value
*/

class TeamItemPojo {
  String? nameFull;
  String? nameShort;
  List<Players>? players;

  TeamItemPojo({this.nameFull, this.nameShort, this.players});

  TeamItemPojo.fromJson(Map<String, dynamic> json) {
    nameFull = json['Name_Full'];
    nameShort = json['Name_Short'];
    if (json['Players'] != null) {
      players = <Players>[];
      json['Players'].forEach((v) {
        players!.add(Players.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Name_Full'] = nameFull;
    data['Name_Short'] = nameShort;
    if (players != null) {
      data['Players'] = players!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Players {
  String? position;
  String? nameFull;
  bool? iscaptain;
  bool? iskeeper;
  Batting? batting;
  Bowling? bowling;

  Players({this.position, this.nameFull, this.iscaptain, this.iskeeper, this.batting, this.bowling});

  Players.fromJson(Map<String, dynamic> json) {
    position = json['Position'];
    nameFull = json['Name_Full'];
    iscaptain = json['Iscaptain'];
    iskeeper = json['Iskeeper'];
    batting = json['Batting'] != null ? Batting.fromJson(json['Batting']) : null;
    bowling = json['Bowling'] != null ? Bowling.fromJson(json['Bowling']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Position'] = position;
    data['Name_Full'] = nameFull;
    data['Iscaptain'] = iscaptain;
    data['Iskeeper'] = iskeeper;
    if (batting != null) {
      data['Batting'] = batting!.toJson();
    }
    if (bowling != null) {
      data['Bowling'] = bowling!.toJson();
    }
    return data;
  }

  bool isHighLite() {
    return (iscaptain != null && iscaptain!) || (iskeeper != null && iskeeper!);
  }

  String highLiteLabel() {
    if (iscaptain != null && iscaptain!) {
      return '(Captain)';
    }
    if (iskeeper != null && iskeeper!) {
      return '(Keeper)';
    }
    return '';
  }
}

class Batting {
  String? style;
  String? average;
  String? strikerate;
  String? runs;

  Batting({this.style, this.average, this.strikerate, this.runs});

  Batting.fromJson(Map<String, dynamic> json) {
    style = json['Style'];
    average = json['Average'];
    strikerate = json['Strikerate'];
    runs = json['Runs'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Style'] = style;
    data['Average'] = average;
    data['Strikerate'] = strikerate;
    data['Runs'] = runs;
    return data;
  }
}

class Bowling {
  String? style;
  String? average;
  String? economyrate;
  String? wickets;

  Bowling({this.style, this.average, this.economyrate, this.wickets});

  Bowling.fromJson(Map<String, dynamic> json) {
    style = json['Style'];
    average = json['Average'];
    economyrate = json['Economyrate'];
    wickets = json['Wickets'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Style'] = style;
    data['Average'] = average;
    data['Economyrate'] = economyrate;
    data['Wickets'] = wickets;
    return data;
  }
}
