// ignore_for_file: deprecated_member_use

import 'dart:html';

import 'package:flutter/material.dart';
import 'package:main/pages/Score.dart';
import 'package:main/pages/Scroll.dart';

import 'BuildCard.dart';
import 'package:provider/provider.dart';

class QuestionPage extends StatefulWidget {
  List<List<dynamic>> qdata = [];
  QuestionPage({Key? key, required this.qdata}) : super(key: key);

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  final ScrollController controller = ScrollController();
  int currentanswer = 0;
  int score = 0;
  int sum = 0;

  bool btnpressed1 = false;
  bool btnpressed2 = false;
  bool btnpressed3 = false;
  bool btnpressed4 = false;
  bool completed = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0),
        child: AppBar(
          title: const Padding(
            padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
            child: Text(
              'Sample-Questions',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
          ),
          backgroundColor: Colors.black,
          centerTitle: true,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Color.fromARGB(255, 192, 226, 231),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 50, 0, 50),
                child: Text(
                  "For each question choose from the following alternatives: ",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 25, 86, 94)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 0, 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    Text("Option A - Score 1",
                        style: TextStyle(
                            fontSize: 25,
                            color: Color.fromARGB(255, 25, 86, 94),
                            fontWeight: FontWeight.bold)),
                    Text("Option B - Score 2",
                        style: TextStyle(
                            fontSize: 25,
                            color: Color.fromARGB(255, 25, 86, 94),
                            fontWeight: FontWeight.bold)),
                    Text("Option C - Score 3",
                        style: TextStyle(
                            fontSize: 25,
                            color: Color.fromARGB(255, 25, 86, 94),
                            fontWeight: FontWeight.bold)),
                    Text("Option D - Score 4",
                        style: TextStyle(
                            fontSize: 25,
                            color: Color.fromARGB(255, 25, 86, 94),
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                    "Question ${currentanswer + 1}/${widget.qdata.length}",
                    style: const TextStyle(
                        fontSize: 25,
                        color: Color.fromARGB(255, 25, 86, 94),
                        fontWeight: FontWeight.bold)),
              ),
              // ScrollConfiguration(
              //   behavior: MyCustomScrollBehavior(),
              //   child: Center(
              //     child: Container(
              //       height: 290,
              //       child: widget.qdata.isNotEmpty
              //           ? ListView.separated(
              //               padding: EdgeInsets.all(35),
              //               controller: controller,
              //               scrollDirection: Axis.horizontal,
              //               itemCount: widget.qdata.length,
              //               separatorBuilder: (context, index) =>
              //                   const SizedBox(
              //                     width: 50,
              //                     child: Icon(
              //                       Icons.arrow_forward_ios_sharp,
              //                       size: 45,
              //                     ),
              //                   ),
              //               itemBuilder: (BuildContext context, int index) {
              //                 return BuildCard(questions: widget.qdata[index]);
              //               })
              //           : const CircularProgressIndicator(),
              //     ),
              //   ),
              // ),
              Column(
                children: [
                  if (completed)
                    Container(
                      width: 750,
                      height: 280,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: const Color.fromARGB(
                          255,
                          25,
                          86,
                          94,
                        ).withOpacity(0.6),
                      ),
                      child: Column(
                        children: [
                          Container(
                              height: 150,
                              child: Padding(
                                padding: const EdgeInsets.all(40),
                                child: Text(
                                    widget.qdata[currentanswer][0].toString(),
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        color: Color.fromARGB(255, 32, 32, 32),
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold)),
                              )),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              RawMaterialButton(
                                padding: EdgeInsets.all(10),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                fillColor: btnpressed1
                                    ? Colors.black
                                    : Color.fromARGB(255, 25, 86, 94),
                                onPressed: () {
                                  setState(() {
                                    btnpressed1 = true;
                                    btnpressed2 = false;
                                    btnpressed3 = false;
                                    btnpressed4 = false;

                                    score = 1;
                                  });
                                },
                                child: Text(widget.qdata[currentanswer][1],
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.0,
                                    )),
                              ),
                              RawMaterialButton(
                                padding: EdgeInsets.all(10),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                fillColor: btnpressed2
                                    ? Colors.black
                                    : Color.fromARGB(255, 25, 86, 94),
                                onPressed: () {
                                  setState(() {
                                    btnpressed2 = true;
                                    btnpressed1 = false;
                                    btnpressed3 = false;
                                    btnpressed4 = false;

                                    score = 2;
                                  });
                                },
                                child: Text(widget.qdata[currentanswer][2],
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.0,
                                    )),
                              ),
                              RawMaterialButton(
                                padding: EdgeInsets.all(10),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                fillColor: btnpressed3
                                    ? Colors.black
                                    : Color.fromARGB(255, 25, 86, 94),
                                onPressed: () {
                                  setState(() {
                                    btnpressed3 = true;
                                    btnpressed1 = false;
                                    btnpressed2 = false;
                                    btnpressed4 = false;

                                    score = 3;
                                  });
                                },
                                child: Text(widget.qdata[currentanswer][3],
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.0,
                                    )),
                              ),
                              RawMaterialButton(
                                padding: EdgeInsets.all(10),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                fillColor: btnpressed4
                                    ? Colors.black
                                    : Color.fromARGB(255, 25, 86, 94),
                                onPressed: () {
                                  setState(() {
                                    btnpressed4 = true;
                                    btnpressed1 = false;
                                    btnpressed2 = false;
                                    btnpressed3 = false;

                                    score = 4;
                                  });
                                },
                                child: Text(widget.qdata[currentanswer][4],
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.0,
                                    )),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              if (currentanswer != 0)
                                RawMaterialButton(
                                  padding: EdgeInsets.all(10),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  fillColor: Color.fromARGB(255, 25, 86, 94),
                                  onPressed: () {
                                    setState(() {
                                      if (currentanswer >= 0 && sum >= 0) {
                                        currentanswer = currentanswer - 1;
                                        sum = sum - score;
                                      }
                                      btnpressed1 = false;
                                      btnpressed2 = false;
                                      btnpressed3 = false;
                                      btnpressed4 = false;
                                    });
                                  },
                                  child: Column(
                                    children: [
                                      if (currentanswer != 0)
                                        const Text("Back",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18.0,
                                            )),
                                    ],
                                  ),
                                ),
                              RawMaterialButton(
                                padding: EdgeInsets.all(10),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                fillColor: Color.fromARGB(255, 25, 86, 94),
                                onPressed: () {
                                  setState(() {
                                    if (currentanswer + 1 ==
                                        widget.qdata.length) {
                                      completed = false;
                                    }
                                  });
                                  if (currentanswer < widget.qdata.length - 1 &&
                                      (btnpressed1 == true ||
                                          btnpressed2 == true ||
                                          btnpressed3 == true ||
                                          btnpressed4 == true)) {
                                    setState(() {
                                      currentanswer = currentanswer + 1;
                                      sum = sum + score;
                                      btnpressed1 = false;
                                      btnpressed2 = false;
                                      btnpressed3 = false;
                                      btnpressed4 = false;
                                    });
                                  } else {
                                    final snackBar = SnackBar(
                                        content: Text("Select any One Option"),
                                        duration: Duration(seconds: 2),
                                        action: SnackBarAction(
                                          label: 'Dismiss',
                                          onPressed: () {},
                                        ));
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                  }
                                },
                                child: Column(
                                  children: [
                                    if (currentanswer ==
                                        widget.qdata.length - 1)
                                      const Text("Done",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18.0,
                                          ))
                                    else
                                      const Text("Next Question",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18.0,
                                          )),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  else
                    Container(
                      width: 750,
                      height: 280,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: const Color.fromARGB(
                          255,
                          25,
                          86,
                          94,
                        ).withOpacity(0.6),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text("You are Successfully Completed the Survey",
                                style: TextStyle(
                                    fontSize: 25,
                                    color: Color.fromARGB(255, 3, 3, 3),
                                    fontWeight: FontWeight.bold)),
                            Padding(
                              padding: EdgeInsets.all(20),
                              child: Text(
                                  "Click on Get Score to view your Score",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Color.fromARGB(255, 5, 5, 5),
                                      fontWeight: FontWeight.bold)),
                            )
                          ],
                        ),
                      ),
                    )
                ],
              ),

              Container(
                height: 140,
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                      child: Text(
                        "Now add up your scores for each item to get a total.",
                        style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 25, 86, 94),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: RaisedButton(
                          padding: EdgeInsets.all(20),
                          textColor: Colors.white,
                          child: const Text(
                            "  Get Score  ",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          color: Color.fromARGB(255, 25, 86, 94),
                          onPressed: () {
                            sum = sum + score;
                            if (currentanswer == widget.qdata.length - 1)
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Score(result: sum),
                                  ));
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          )),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
