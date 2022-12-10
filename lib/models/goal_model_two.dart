import 'package:flutter/material.dart';

// ignore: must_be_immutable
class GoalModelTwo extends StatefulWidget {
  String title;
  String description;
  String pathToImage;
  String urgency;
  bool done;

  GoalModelTwo({
    super.key,
    required this.title,
    required this.description,
    required this.pathToImage,
    required this.urgency,
    required this.done,
  });

  @override
  State<GoalModelTwo> createState() => _GoalModelTwoState();
}

class TodayGoal {}

class _GoalModelTwoState extends State<GoalModelTwo> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 200,
        width: double.infinity,
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.blue,
              width: 2,
            ),
            color: Colors.black38,
            borderRadius: BorderRadius.circular(12)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 50,
              width: double.infinity,
              child: Row(
                children: [
                  SizedBox(
                      height: double.infinity,
                      width: 90,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                              color: Colors.blue,
                              widget.done
                                  ? Icons.check_circle
                                  : Icons.circle_outlined),
                          Icon(
                            Icons.circle_rounded,
                          )
                        ],
                      )),
                  SizedBox(
                    height: 50,
                    width: 250,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 16, bottom: 10),
                      child: Text(
                        widget.title,
                        style: const TextStyle(color: Colors.blue),
                      ),
                    ),
                  ),
                  SizedBox(
                      height: 50,
                      width: 50,
                      child: Center(
                        child: Stack(
                          children: [
                            const Center(
                              child: Icon(
                                Icons.done,
                                size: 25,
                                color: Colors.blue,
                              ),
                            ),
                            GestureDetector(onTap: () {
                              setState(() {
                                widget.done = !widget.done;
                              });
                            }),
                          ],
                        ),
                      ))
                ],
              ),
            ),
            Container(
              height: 110,
              width: double.infinity,
              color: Colors.black38,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  widget.description,
                  style: const TextStyle(color: Colors.blue),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
