import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_cv/apis/cover_letters/delete_cover_letter.dart';
import 'package:smart_cv/apis/cover_letters/download_cover_letter.dart';
import 'package:smart_cv/apis/cover_letters/getCoverLettersApi.dart';
import 'package:smart_cv/core/app_export.dart';
import 'package:smart_cv/data_layer/cover_letter.dart';
import 'package:smart_cv/provider/data_providers/loder_provider.dart';
import 'package:smart_cv/theme/theme_helper.dart';
import 'package:smart_cv/widgets/appBar/custom_appbar.dart';
import 'package:smart_cv/widgets/custom_drawer/drawer.dart';

class CoverLetter extends StatefulWidget {
  const CoverLetter({Key? key}) : super(key: key);

  @override
  State<CoverLetter> createState() => _CoverLetterState();
}

class _CoverLetterState extends State<CoverLetter> {
//OPTIONS

  String? _selectedOption = "Traditional";
  final List<String> _options = [
    'Traditional',
    'Modern',
    'Creative',
    'Professional',
    'Minimalist',
    'Elegant',
    'Detailed',
    'Personalized',
  ];

  List<CoverLetterData> coverLetters = [];
  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
  }

  void fetchData(BuildContext context) async {
    coverLetters = await fetchCoverLetters(context, 1);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed(AppRoutes.coverLetterForm);
          },
          tooltip: 'Select Image',
          child: Icon(Icons.add),
        ),
        appBar: customAppBar(
          context,
          "COVER LETTER",
        ),
        drawer: drawer(context),
        resizeToAvoidBottomInset: false,
        body: FutureBuilder<List<CoverLetterData>>(
          future: fetchCoverLetters(context, 1),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              List<CoverLetterData>? coverLetters = snapshot.data;
              if (coverLetters != null) {
                return ListView.builder(
                  itemCount: coverLetters.length,
                  itemBuilder: (context, index) =>
                      makeCard(coverLetters[index], context),
                );
              } else {
                return Center(child: Text('No cover letters available'));
              }
            }
          },
        ),
      ),
    );
  }

  Card makeCard(CoverLetterData data, BuildContext context) => Card(
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

  ListTile makeListTile(CoverLetterData data, BuildContext context) => ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        leading: Container(
          padding: EdgeInsets.only(right: 12.0),
          decoration: new BoxDecoration(
              border: new Border(
                  right: new BorderSide(width: 1.0, color: Colors.white24))),
          child: IconButton(
            icon: Icon(Icons.download_outlined, color: Colors.white),
            onPressed: () {
              downloadCoverLetter(context, data.pk, _selectedOption);
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
              data.fields.job_title,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        subtitle: Row(
          children: <Widget>[
            Expanded(
                flex: 1,
                child: Container(
                  child: LinearProgressIndicator(
                      backgroundColor: Color.fromRGBO(209, 224, 224, 0.2),
                      value: double.tryParse(data.pk.toString()),
                      valueColor: AlwaysStoppedAnimation(Colors.green)),
                )),
            Expanded(
              flex: 4,
              child: Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Text("ID : ${data.pk.toString()}",
                      style: TextStyle(color: Colors.white))),
            )
          ],
        ),
        trailing: IconButton(
          onPressed: () {
            setState(() {
              deleteCoverLetter(context, data.pk);
            });
          },
          icon:
              Icon(Icons.delete_forever_sharp, color: Colors.white, size: 30.0),
        ),
      );
}
