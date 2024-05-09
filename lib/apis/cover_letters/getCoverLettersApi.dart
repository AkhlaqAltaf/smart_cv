import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:smart_cv/apis/urls/urls.dart';
import 'package:smart_cv/widgets/error_displayer.dart';

Future<List<CoverLetterData>> fetchCoverLetters(
    BuildContext context, int id) async {
  try {
    final response = await http.get(Uri.parse('${get_cover_letters}/$id'));
    if (response.statusCode == 200) {
      Iterable jsonResponse = json.decode(response.body);
      List<CoverLetterData> coverLetters = [];
      print(jsonResponse.toString());
      jsonResponse.forEach((element) {
        CoverLetterData coverLetter = CoverLetterData.fromJson(element);
        coverLetters.add(coverLetter);
      });

      print("COVER LETTERS : ${coverLetters.toString()}");
      return coverLetters;
    } else {
      displayError(context, "error", "Failed to load cover letters");

      throw Exception('Failed to load cover letters');
    }
  } catch (e) {
    displayError(context, 'error', e.toString());
    return [];
  }
}

class CoverLetterData {
  final int pk;
  final Fields fields;

  CoverLetterData({required this.pk, required this.fields});

  factory CoverLetterData.fromJson(Map<String, dynamic> json) {
    return CoverLetterData(
      pk: json['pk'],
      fields: Fields.fromJson(json['fields']),
    );
  }
}

class Fields {
  final int user;
  final String job_title;
  final String company_name;
  final String job_description;
  final String name;
  final String phone_number;
  final String email;
  final String address;
  final String experience;

  Fields(
      {required this.user,
      required this.job_title,
      required this.company_name,
      required this.job_description,
      required this.name,
      required this.phone_number,
      required this.email,
      required this.address,
      required this.experience});

  factory Fields.fromJson(Map<String, dynamic> json) {
    return Fields(
        user: json['user'],
        job_title: json['job_title'],
        company_name: json['company_name'],
        job_description: json['job_description'],
        name: json['name'],
        phone_number: json['phone_number'],
        address: json['address'],
        experience: json['experience'],
        email: json['email']);
  }
}
