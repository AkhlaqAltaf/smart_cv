import 'package:flutter/material.dart';

class HomeScreensProvider extends ChangeNotifier{
Widget home_body  = Text("");

Widget get get_home_body=>home_body;

set set_home_body(Widget body){
 home_body = body;
 notifyListeners();


}
 
 Widget default_home_body(){

  return Text("");
 }

}