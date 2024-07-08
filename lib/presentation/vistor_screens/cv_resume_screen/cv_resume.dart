import 'package:flutter/material.dart';
import 'package:smart_cv/apis/cv_resume_apis/delete_cv.dart';
import 'package:smart_cv/apis/cv_resume_apis/download_cv.dart';
import 'package:smart_cv/apis/cv_resume_apis/get_cv_resumes.dart';
import 'package:smart_cv/core/app_export.dart';
import 'package:smart_cv/data_layer/cv_resume.dart';
import 'package:smart_cv/theme/theme_helper.dart';
import 'package:smart_cv/widgets/appBar/custom_appbar.dart';
import 'package:smart_cv/widgets/custom_drawer/drawer.dart';

class CVResumePage extends StatefulWidget {
  const CVResumePage({Key? key}) : super(key: key);

  @override
  State<CVResumePage> createState() => _CVResume();
}

class _CVResume extends State<CVResumePage> {
  // OPTIONS
  String? _selectedOption;
  final List<String> _options = [
    'Basic',
    'Professional',
    'Modern',
    'Elegant',
    'Creative',
    'Minimalist',
    'Infographic',
    'Academic',
  ];

  List<CvResume>? _cvResumes;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchCVResumes();
  }

  Future<void> _fetchCVResumes() async {
    List<CvResume>? cvResumes = await fetchCVResumes(context);
    setState(() {
      _cvResumes = cvResumes;
      _isLoading = false;
    });
  }

  void _deleteCvResume(int id) async {
    await deleteCvResume(context, id);
    _fetchCVResumes(); // Refresh data after deletion
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, AppRoutes.cvResumeCreate);
          },
          tooltip: 'Select Image',
          child: Icon(Icons.add),
        ),
        appBar: customAppBar(
          context,
          "CV RESUMES",
        ),
        drawer: drawer(context),
        resizeToAvoidBottomInset: false,
        body: _isLoading
            ? Center(child: CircularProgressIndicator())
            : _cvResumes == null || _cvResumes!.isEmpty
                ? Center(child: Text('No cover letters available'))
                : ListView.builder(
                    itemCount: _cvResumes!.length,
                    itemBuilder: (context, index) =>
                        makeCard(_cvResumes![index], context),
                  ),
      ),
    );
  }

  Card makeCard(CvResume data, BuildContext context) {
    return Card(
      elevation: 8.0,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              theme.colorScheme.primary,
              appTheme.blueGray500C6,
            ],
          ),
        ),
        child: makeListTile(data, context),
      ),
    );
  }

  ListTile makeListTile(CvResume data, BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      leading: Container(
        padding: EdgeInsets.only(right: 12.0),
        decoration: new BoxDecoration(
            border: new Border(
                right: new BorderSide(width: 1.0, color: Colors.white24))),
        child: IconButton(
          icon: Icon(Icons.download_outlined, color: Colors.white),
          onPressed: () {
            if (_selectedOption != null) {
              downloadCvResume(context, data.id!, _selectedOption!);
            }
          },
        ),
      ),
      title: Column(
        children: [
          DropdownButton<String>(
            value: _selectedOption,
            hint: Text('Select A Type'),
            items: _options.map((String option) {
              return DropdownMenuItem<String>(
                value: option,
                child: Text(option),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                _selectedOption = newValue;
              });
            },
          ),
          Text(
            data.personalInformation!.fullName!,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      subtitle: Row(
        children: <Widget>[
          Expanded(
              flex: 1,
              child: Container(
                // tag: 'hero',
                child: LinearProgressIndicator(
                    backgroundColor: Color.fromRGBO(209, 224, 224, 0.2),
                    value: double.tryParse(data.id.toString()),
                    valueColor: AlwaysStoppedAnimation(Colors.green)),
              )),
          Expanded(
            flex: 4,
            child: Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text("ID : ${data.id}",
                    style: TextStyle(color: Colors.white))),
          ),
        ],
      ),
      trailing: IconButton(
        onPressed: () => _deleteCvResume(data.id!),
        icon: Icon(Icons.delete_forever_sharp, color: Colors.white, size: 30.0),
      ),
    );
  }
}
