// To parse this JSON data, do
//
//     final successModel = successModelFromJson(jsonString);

// ignore_for_file: depend_on_referenced_packages, unused_import

import 'package:meta/meta.dart';
import 'dart:convert';

SuccessModel successModelFromJson(String str) =>
    SuccessModel.fromJson(json.decode(str));

String successModelToJson(SuccessModel data) => json.encode(data.toJson());

class SuccessModel {
  final bool status;
  final String message;

  SuccessModel({
    required this.status,
    required this.message,
  });

  factory SuccessModel.fromJson(Map<String, dynamic> json) => SuccessModel(
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
      };
}
