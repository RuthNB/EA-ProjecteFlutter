import 'dart:convert';
import 'dart:html';

import 'package:flutter_front/models/route.dart';
import 'package:flutter_front/models/user.dart';

List<Booking> bookingFromJson(String str) =>
    List<Booking>.from(json.decode(str).map((x) => Booking.fromJson(x)));

String bookingToJson(List<Booking> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Booking {
  Booking(
      {
      //this.id = "", // non nullable but optional with a default value
      required this.route,
      required this.user,
      required this.dayOfCreation,
      //required this.cancelPolicy,
      required this.selectedStopPoint});

  Routes route;
  User user;
  DateTime dayOfCreation;
  //Falta el cancelPolicy
  String selectedStopPoint;

  factory Booking.fromJson(Map<String, dynamic> responseData) {
    return new Booking(
        route: responseData["route"],
        user: responseData["user"],
        dayOfCreation: responseData["dayOfCreation"],
        //cancelPolicy: responseData["cancelPolicy"],
        selectedStopPoint: responseData["selectedStopPoint"]);
  }

  Map<String, dynamic> toJson() => {
        "route": route,
        "user": user,
        //"cancelPolicy": cancelPolicy,
        "selectedStopPoint": selectedStopPoint
      };
}
