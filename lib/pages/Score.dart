import "package:flutter/material.dart";
import 'package:main/pages/Home.dart';
import 'package:provider/provider.dart';

class Score extends StatefulWidget {
  int result;
  Score({Key? key, required this.result}) : super(key: key);

  @override
  State<Score> createState() => _ScoreState();
}

class _ScoreState extends State<Score> {
  @override
  Widget build(BuildContext context) {
    //final display = context.watch<ValueNotifier<int>>().value;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0),
        child: AppBar(
          title: const Padding(
            padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
            child: Text(
              'User-Score',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
          ),
          automaticallyImplyLeading: false,
          backgroundColor: Colors.black,
          centerTitle: true,
        ),
      ),
      body: Container(
        color: Color.fromARGB(255, 192, 226, 231),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Your Score",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 25, 86, 94),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Text(
                  widget.result.toString(),
                  style: TextStyle(
                      fontSize: 35,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: RawMaterialButton(
                  padding: EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  fillColor: Color.fromARGB(255, 25, 86, 94),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ),
                    );
                  },
                  child: Text("Go To Home",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
