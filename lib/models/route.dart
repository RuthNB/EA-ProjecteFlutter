
import 'dart:convert';

import 'package:flutter_front/models/user.dart';

List<Route> routeFromJson(String str) =>
    List<Route>.from(json.decode(str).map((x) => Route.fromJson(x)));

String routeToJson(List<Route> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Route {
  Route(
      {
      //this.id = "", // non nullable but optional with a default value
      required this.name,
      required this.id,
      required this.creator,
      required this.participants,
      required this.startPoint,
      required this.endPoint,
      required this.stopPoint,
      required this.dateOfBeggining
      });

  String id;
  String name;
  User creator;
  List<User>? participants;
  String startPoint;
  String endPoint;
  List<String>? stopPoint;
  DateTime dateOfBeggining;

  factory Route.fromJson(Map<String, dynamic> responseData) {

  List<User>? tmp1 = responseData["participants"] != null
          ? List<User>.from(
              responseData["participants"].map((x) => User.fromJson(x)))
          : null;
  List<String>? tmp2 = responseData["stopPoint"] != null
          ? List<String>.from(
              json.decode(responseData["stopPoint"]))
          : null;

return new Route(id: responseData["_id"],
        name: responseData["name"],
        creator: User.fromJson(responseData['creator']), //mirar si esta bé
        participants: tmp1,
        startPoint: responseData["startPoint"],
        endPoint: responseData["endPoint"],
        stopPoint: tmp2,
        dateOfBeggining: responseData["dateOfBeggining"]
      );
  }
        

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "creator": creator,
        "participants": participants,
        "startPoint": startPoint,
        "endPoint": endPoint,
        "stopPoint": stopPoint,
        "dateOfBeggining": dateOfBeggining
      };
}
