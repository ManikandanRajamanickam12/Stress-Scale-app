// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class BuildCard extends StatefulWidget {
  List<dynamic> questions = [];
  BuildCard({Key? key, required this.questions}) : super(key: key);

  @override
  State<BuildCard> createState() => _BuildCardState();
}

class _BuildCardState extends State<BuildCard> {
  int scorestate = 0;

  bool ontap = false;
  int question_pos = 0;
  int score = 0;
  bool btnPressed = false;
  PageController? _controller;
  String btnText = "Next Question";
  bool answered = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    // List<QuestionModel> list = [
    //   QuestionModel(widget.questions[0], widget.questions[1],
    //       widget.questions[2], widget.questions[3], widget.questions[4])
    // ];

    return Container(
      margin: EdgeInsets.only(top: 25),
      width: 700,
      height: 250,
      color: Color.fromRGBO(117, 121, 121, 1),
      child: Column(
        children: [
          Container(
              height: 125,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Text(widget.questions[0].toString(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    )),
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              RaisedButton(
                padding: EdgeInsets.all(20),
                textColor: Colors.white,
                child: Text(widget.questions[1].toString()),
                color: Color.fromARGB(255, 25, 86, 94),
                onPressed: () {
                  score = 1;

                  scorestate = score;
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              RaisedButton(
                padding: EdgeInsets.all(20),
                textColor: Colors.white,
                child: Text(widget.questions[2]),
                color: Color.fromARGB(255, 25, 86, 94),
                onPressed: () {
                  score = 2;
                  scorestate = score;
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              RaisedButton(
                padding: EdgeInsets.all(20),
                textColor: Colors.white,
                color: Color.fromARGB(255, 25, 86, 94),
                child: Text(widget.questions[3]),
                onPressed: () {
                  score = 3;
                  scorestate = score;
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              RaisedButton(
                padding: EdgeInsets.all(20),
                textColor: Colors.white,
                color: Color.fromARGB(255, 25, 86, 94),
                child: Text(widget.questions[4]),
                onPressed: () {
                  score = 4;
                  scorestate = score;
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: FlatButton(
                onPressed: () {
                  _controller!.nextPage(
                      duration: Duration(milliseconds: 250),
                      curve: Curves.easeInExpo);

                  setState(() {
                    btnPressed = false;
                  });
                },
                color: Color.fromARGB(255, 25, 86, 94),
                child: const Text(
                  "Next",
                  style: TextStyle(color: Colors.white),
                )),
          )
        ],
      ),
    );
  }
}
