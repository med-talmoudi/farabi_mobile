// To parse this JSON data, do
//
//     final jackpotHistoryModel = jackpotHistoryModelFromJson(jsonString);

import 'dart:convert';

HistoryModel jackpotHistoryModelFromJson(String str) =>
    HistoryModel.fromJson(json.decode(str));

String jackpotHistoryModelToJson(HistoryModel data) =>
    json.encode(data.toJson());

class HistoryModel {
  final int? limit;
  final int? offset;
  final List<History> history;

  HistoryModel({
    this.limit,
    this.offset,
    required this.history,
  });

  factory HistoryModel.fromJson(Map<String, dynamic> json) => HistoryModel(
        limit: json["limit"],
        offset: json["offset"],
        history: json["history"] == null
            ? []
            : List<History>.from(
                json["history"]!.map((x) => History.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "limit": limit,
        "offset": offset,
        "history": List<dynamic>.from(history.map((x) => x.toJson())),
      };
}

class History {
  final String? id;
  final DateTime? dateAchat;
  final String? montantAchat;
  final String? points;
  final String? ticketId;
  final String? pointDeVente;
  final String? pointsPaye;
  final String? resteApaye;
  final String? user;
  final int? v;

  History({
    this.id,
    this.dateAchat,
    this.montantAchat,
    this.points,
    this.ticketId,
    this.pointDeVente,
    this.pointsPaye,
    this.resteApaye,
    this.user,
    this.v,
  });

  factory History.fromJson(Map<String, dynamic> json) => History(
        id: json["_id"],
        dateAchat: json["dateAchat"] == null
            ? null
            : DateTime.parse(json["dateAchat"]),
        montantAchat: json["montantAchat"],
        points: json["points"],
        ticketId: json["ticketId"],
        pointDeVente: json["pointDeVente"],
        pointsPaye: json["PointsPaye"],
        resteApaye: json["ResteApaye"],
        user: json["user"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "dateAchat": dateAchat?.toIso8601String(),
        "montantAchat": montantAchat,
        "points": points,
        "ticketId": ticketId,
        "pointDeVente": pointDeVente,
        "PointsPaye": pointsPaye,
        "ResteApaye": resteApaye,
        "user": user,
        "__v": v,
      };
}
