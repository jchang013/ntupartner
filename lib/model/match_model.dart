
class MatchModel {

  String matchID;

  MatchModel(String matchID){
    this.matchID = matchID;
  }

  MatchModel.fromJson(Map<String, dynamic> json)
    : matchID = json['matchID'];

  Map<String, dynamic> toJson() =>
      {
        'matchID' : matchID,
      };
}

