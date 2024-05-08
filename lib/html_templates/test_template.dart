import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class HtmlScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String name = "AKhlaq";
    String htmlContent =
        '<h1>Hello, World!</h1><p>This is ${name} <strong>HTML</strong> content.</p>';

    return Scaffold(
      appBar: AppBar(
        title: Text('HTML Example'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: HtmlWidget(htmlContent),
        ),
      ),
    );
  }
}
