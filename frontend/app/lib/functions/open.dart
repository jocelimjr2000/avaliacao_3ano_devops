import 'package:flutter/material.dart';

void open(BuildContext context, Widget screen) async {
  await Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => screen));
}
