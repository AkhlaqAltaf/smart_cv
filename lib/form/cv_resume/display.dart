import 'package:flutter/material.dart';
import 'package:smart_cv/apis/cv_resume_apis/create_cv_resume.dart';
import 'package:smart_cv/apis/cv_resume_apis/download_cv.dart';
import 'package:smart_cv/core/app_export.dart';
import 'package:smart_cv/data_layer/cv_resume.dart';
import 'package:smart_cv/theme/custom_button_style.dart';
import 'package:smart_cv/widgets/custom_elevated_button.dart';

class CvResumePage extends StatefulWidget {
  const CvResumePage({Key? key}) : super(key: key);

  @override
  _CvResumePageState createState() => _CvResumePageState();
}

class _CvResumePageState extends State<CvResumePage> {
  final CvResume cvResume = CvResume.getInstance();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        ),
        body: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Personal Information:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('Full Name: ${cvResume.personalInformation?.fullName ?? ''}'),
            Text(
                'Email Address: ${cvResume.personalInformation?.emailAddress ?? ''}'),
            Text(
                'Phone Number: ${cvResume.personalInformation?.phoneNumber ?? ''}'),
            Text('Address: ${cvResume.personalInformation?.address ?? ''}'),
            Text(
                'Date of Birth: ${cvResume.personalInformation?.dateOfBirth ?? ''}'),
            Text(
                'Nationality: ${cvResume.personalInformation?.nationality ?? ''}'),
            Text(
                'Selected Languages: ${cvResume.personalInformation?.selectedLanguages?.join(', ') ?? ''}'),
            SizedBox(height: 20),
            Text(
              'Work Experience:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('Company: ${cvResume.workExperience?.company ?? ''}'),
            Text('Position: ${cvResume.workExperience?.position ?? ''}'),
            Text('Start Date: ${cvResume.workExperience?.startDate ?? ''}'),
            Text('End Date: ${cvResume.workExperience?.endDate ?? ''}'),
            Text(
                'Responsibilities: ${cvResume.workExperience?.responsibilities ?? ''}'),
            SizedBox(height: 20),
            Text(
              'Skills:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            // Display skills
            ...cvResume.skills!.map((skill) => Text(skill.name ?? '')),
            SizedBox(height: 20),
            Text(
              'Education:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            // Display education
            Text('Degree: ${cvResume.education?.degree ?? ''}'),
            Text('Field of Study: ${cvResume.education?.fieldOfStudy ?? ''}'),
            Text('Institution: ${cvResume.education?.institution ?? ''}'),
            Text('Location: ${cvResume.education?.location ?? ''}'),
            Text(
                'Graduation Year: ${cvResume.education?.graduationYear ?? ''}'),
            SizedBox(height: 20),
            Text(
              'Certification/Award:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            // Display certification/award
            Text('Title: ${cvResume.certificationAward?.title ?? ''}'),
            Text('Issuer: ${cvResume.certificationAward?.issuer ?? ''}'),
            Text(
                'Date: ${cvResume.certificationAward?.date?.toString() ?? ''}'),
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.cvResumeCreate);
                },
                child: Text("Edit Data")),
            // Submit button            Spacer(),
            Center(
              child: CustomElevatedButton(
                onPressed: () async {
                  // Handle submit button press
                  // String? response = await postDataToServer();

                  bool isSuccess = await postDataToServer(context);

                  if (isSuccess) {
                    Navigator.of(context).pushNamed(AppRoutes.cvResume);
                  }
                },
                text: 'Submit Data',
                margin: EdgeInsets.only(left: 19.h, right: 22.h),
                buttonStyle: CustomButtonStyles.none,
                decoration: CustomButtonStyles.gradientPrimaryToTealDecoration,
              ),
            ),
          ],
        )));
  }
}
