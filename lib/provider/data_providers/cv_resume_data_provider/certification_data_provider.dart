import 'package:flutter/material.dart';
import 'package:smart_cv/data_layer/cv_resume.dart';

class CertificationDataProvider extends ChangeNotifier {
  String? title;
  String? issuer;
  DateTime? date;

  void submit_data() {
    CertificationAward certificationAward =
        CertificationAward(title, issuer, date.toString());
    CvResume.getInstance().certificationAward = certificationAward;
  }
}
