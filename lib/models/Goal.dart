import 'package:flutter/material.dart';

class Goal {
  String? title;
  String? description;
  String? pathToImage;
  String urgency;
  bool? done;
  Color? color;

  Goal(
    this.title,
    this.description,
    this.pathToImage,
    this.urgency,
    this.done,
  );

  void setColor() {
    if (urgency == '1') {
      color = Colors.blue;
    } else if (urgency == '2') {
      color == Colors.yellow;
    } else if (urgency == '3') {
      color = Colors.red;
    } else {
      color = Colors.blue;
    }
  }
}
