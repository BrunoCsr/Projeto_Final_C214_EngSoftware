import 'package:flutter/material.dart';

class TomorrowPage extends StatefulWidget {
  const TomorrowPage({super.key});

  @override
  State<TomorrowPage> createState() => _TomorrowPageState();
}

class _TomorrowPageState extends State<TomorrowPage> {
  Color myMainBlue = const Color(0xff343a6b);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.small(
        backgroundColor: myMainBlue,
        child: const Icon(
          Icons.add,
        ),
        onPressed: () {},
      ),
      appBar: AppBar(
        backgroundColor: myMainBlue,
        title: const Text('Metas para amanhã'),
        centerTitle: true,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: myMainBlue,
        child: Stack(children: const [
          Center(
            child: SizedBox(
              height: 300,
              width: 350,
              child: Image(image: AssetImage('lib/assets/MyLogoDog.png')),
            ),
          ),
        ]),
      ),
    );
    ;
  }
}
