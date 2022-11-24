import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        onPressed: () {
          showModalBottomSheet(
              backgroundColor: Colors.black,
              isScrollControlled: true,
              context: context,
              builder: (context) => Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: Container(
                      decoration: BoxDecoration(
                          color: myMainBlue,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: Colors.blue,
                            width: 2,
                          )),
                      height: 450,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            height: 80,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: myMainBlue,
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15))),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20, top: 35),
                              child: Text(
                                'Adicione nova meta para amanhã',
                                style: GoogleFonts.lato(
                                    fontSize: 25, color: Colors.white),
                              ),
                            ),
                          ),
                          Container(
                              height: 290,
                              width: double.infinity,
                              color: Colors.blue,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 290,
                                      width: MediaQuery.of(context).size.width *
                                          (3 / 5),
                                      decoration: BoxDecoration(
                                          color: myMainBlue,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: const [
                                          TextField(
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  gapPadding: 10),
                                              labelText: 'Título',
                                            ),
                                          ),
                                          TextField(
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                              labelText: 'Descrição',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Container(
                                        height: 290,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                    (2 / 5) -
                                                28,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: myMainBlue),
                                        child: Center(
                                          child: IconButton(
                                              onPressed: () {},
                                              icon: const Icon(Icons
                                                  .add_photo_alternate_rounded)),
                                        ))
                                  ],
                                ),
                              )),
                          SizedBox(
                            height: 75,
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  height: 40,
                                  width: 180,
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Stack(
                                    children: [
                                      Center(
                                        child: Text(
                                          'Salvar aqui',
                                          style: GoogleFonts.lato(
                                              fontSize: 15,
                                              color: Colors.white),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {},
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 40,
                                  width: 180,
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Stack(
                                    children: [
                                      Center(
                                        child: Text(
                                          'Salvar em metas gerais',
                                          style: GoogleFonts.lato(
                                              fontSize: 15,
                                              color: Colors.white),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {},
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ))));
        },
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
