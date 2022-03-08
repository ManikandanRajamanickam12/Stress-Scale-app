// ignore_for_file: deprecated_member_use

import "package:flutter/material.dart";
import 'package:main/pages/Questions.dart';
import 'package:csv/csv.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<List<dynamic>> data = [];
  loadAsset() async {
    final myData = await rootBundle.loadString("questions.csv");
    List<List<dynamic>> csvTable = CsvToListConverter().convert(myData);
    data = csvTable;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 150,
              color: Color.fromARGB(255, 3, 3, 3),
              padding: EdgeInsets.all(25),
              constraints: BoxConstraints(maxWidth: 1600),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(400, 0, 0, 0),
                child: Row(
                  children: const [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Color.fromARGB(255, 34, 126, 138),
                      child: Padding(
                        padding: EdgeInsets.all(3), // Border radius
                        child: ClipOval(
                          child: Image(
                            image: AssetImage('logo.png'),
                            width: 150,
                            height: 150,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                      child: Text(
                        "Perceived Stress Scale",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 241, 238, 238),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              color: Color.fromARGB(255, 192, 226, 231),
              child: Padding(
                padding: EdgeInsets.fromLTRB(20, 50, 20, 0),
                child: RichText(
                    text: const TextSpan(
                  text:
                      "  A more precise measure of personal stress can be determined by using a variety of instruments that have been designed to help measure individual stress levels. The first of these is called the ",
                  style:
                      TextStyle(fontSize: 20, color: Colors.black, height: 1.5),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Perceived Stress Scale.',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 25, 86, 94))),
                  ],
                )),
              ),
            ),
            Container(
              color: Color.fromARGB(255, 192, 226, 231),
              child: const Padding(
                padding: EdgeInsets.fromLTRB(20, 50, 20, 0),
                child: Text(
                  "  The Perceived Stress Scale (PSS) is a classic stress assessment instrument. The tool, while originally developed in 1983, remains a popular choice for helping us understand how different situations affect our feelings and our perceived stress. The questions in this scale ask about your feelings and thoughts during the last month. In each case, you will be asked to indicate how often you felt or thought a certain way. Although some of the questions are similar, there are differences between them and you should treat each one as a separate question. The best approach is to answer fairly quickly. That is, don’t try to count up the number of times you felt a particular way; rather indicate the alternative that seems like a reasonable estimate.",
                  style:
                      TextStyle(fontSize: 20, color: Colors.black, height: 1.5),
                ),
              ),
            ),
            Container(
              color: Color.fromARGB(255, 192, 226, 231),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(20, 50, 20, 0),
                    child: Text(
                      "  The Perceived Stress Scale (PSS) is a classic stress assessment instrument. The tool, while originally developed in 1983, remains a popular choice for helping us understand how different situations affect our feelings and our perceived stress. The questions in this scale ask about your feelings and thoughts during the last month. In each case, you will be asked to indicate how often you felt or thought a certain way. Although some of the questions are similar, there are differences between them and you should treat each one as a separate question. The best approach is to answer fairly quickly. That is, don’t try to count up the number of times you felt a particular way; rather indicate the alternative that seems like a reasonable estimate.",
                      style: TextStyle(
                          fontSize: 20, color: Colors.black, height: 1.5),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 25, 0, 18),
                    child: SizedBox(
                      width: 250,
                      height: 50,
                      child: RaisedButton(
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 30),
                        onPressed: (() async {
                          await loadAsset();
                          setState(() {});
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => QuestionPage(qdata: data),
                            ),
                          );
                        }),
                        child: const Text(
                          "Get Questions",
                          style: TextStyle(color: Colors.white, fontSize: 28),
                        ),
                        color: Color.fromARGB(255, 34, 126, 138),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
