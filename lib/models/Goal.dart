import 'dart:ui';

class Goal {
  String? title;
  String? description;
  String? pathToImage;
  int? urgency;
  bool? done;
  Color? color;

  Goal(this.title, this.description, this.pathToImage, this.urgency, this.done);
}
