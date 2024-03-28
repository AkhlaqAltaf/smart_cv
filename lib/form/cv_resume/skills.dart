import 'package:flutter/material.dart';
import 'package:smart_cv/core/app_export.dart';

class SkillForm extends StatefulWidget {
  @override
  _SkillFormState createState() => _SkillFormState();
}

class _SkillFormState extends State<SkillForm> {
  List<TextEditingController> controllers = [TextEditingController()];

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'Skills',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 10),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: controllers.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: controllers[index],
                              decoration: InputDecoration(
                                labelText: 'Skill ${index + 1}',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.remove),
                            onPressed: () {
                              setState(() {
                                controllers.removeAt(index);
                              });
                            },
                          ),
                        ],
                      );
                    },
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        controllers.add(TextEditingController());
                      });
                    },
                    child: Text('Add Skill'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                          onPressed: () {
                            // Handle previous button pressed
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.skip_previous,
                                color: Colors.black,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Previous',
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          )),
                      TextButton(
                          onPressed: () {
                            // Handle previous button pressed
                          },
                          child: Row(
                            children: [
                              Text(
                                'Save & Next',
                                style: TextStyle(color: Colors.black),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(
                                Icons.queue_play_next,
                                color: Colors.black,
                              )
                            ],
                          )),
                    ],
                  ),
                ],
              ))
        ]));
  }

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    super.dispose();
  }
}
