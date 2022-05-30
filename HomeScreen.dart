import 'package:flutter/material.dart';
import 'constrans.dart';
import 'cat.dart';
import 'proo.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _projectsCont = TextEditingController();
  TextEditingController _motivationCont = TextEditingController();
  double _AxendaResult = 0;
  String _textResult = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Score Calculator for Axenda",
            style: TextStyle(color: kTextColor, fontWeight: FontWeight.w300),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        backgroundColor: kActiveIconColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 130,
                    child: TextField(
                      controller: _projectsCont,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                          color: kTextColor),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "projects",
                        hintStyle: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w300,
                            color:
                                Color.fromARGB(255, 4, 0, 228).withOpacity(.8)),
                      ),
                    ),
                  ),
                  Container(
                    width: 130,
                    child: TextField(
                      controller: _motivationCont,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                          color: kTextColor),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "motivation",
                        hintStyle: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w300,
                            color:
                                Color.fromARGB(255, 4, 0, 228).withOpacity(.8)),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  double _p = double.parse(_projectsCont.text);
                  double _m = double.parse(_motivationCont.text);
                  setState(() {
                    _AxendaResult = (_p * _m);
                    if (_AxendaResult >= 100) {
                      _textResult = "You\'re with us";
                    } else {
                      _textResult = "sorry about that";
                    }
                  });
                },
                child: Container(
                  child: Text(
                    "Calculate",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: kTextColor),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                child: Text(
                  _AxendaResult.toStringAsFixed(2),
                  style: TextStyle(fontSize: 90, color: kTextColor),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Visibility(
                  visible: _textResult.isNotEmpty,
                  child: Container(
                    child: Text(
                      _textResult,
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w400,
                          color: kTextColor),
                    ),
                  )),
              SizedBox(
                height: 10,
              ),
              LeftBar(
                barWidth: 40,
              ),
              SizedBox(
                height: 20,
              ),
              LeftBar(barWidth: 70),
              SizedBox(
                height: 20,
              ),
              LeftBar(
                barWidth: 40,
              ),
              SizedBox(
                height: 20,
              ),
              RightBar(barWidth: 70),
              SizedBox(
                height: 50,
              ),
              RightBar(barWidth: 70),
            ],
          ),
        ));
  }
}
