import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _ageController =  TextEditingController();
  final TextEditingController _heightController =  TextEditingController();
  final TextEditingController _weightController =  TextEditingController();

  double _BMIresult = 0.0;
  String _stateResult = "";


  double _BMIcalculate() {
    double weight = double.parse(_weightController.text);
    double heightSquared = (double.parse(_heightController.text) *
        double.parse(_heightController.text));
    double age = double.parse(_ageController.text);
    setState(() {
      _BMIresult = weight / heightSquared;

      if (_BMIresult >= 25.0) {
        _stateResult = "OverWeight";
      } else if (_BMIresult >= 18.5 && _BMIresult <= 24.9) {
        _stateResult = "Normal";
      } else {
        _stateResult = "Abnormal";
      }
      if (age > 65 || age < 18) {
        _BMIresult = -1.0;
        _stateResult =
        "Age Required For Calculations is from 18 - 65 Years Old";
      }

    });
    return 0.0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title:  Text(
          "Body Mass Index",
          style:
           TextStyle(color: Colors.white, fontWeight: FontWeight.w400 , fontSize: 20),
        ),
        backgroundColor: Colors.blueGrey,
      ),
      backgroundColor: Colors.grey[200],
      body:  Container(
        padding: const EdgeInsets.all(8),
        alignment: Alignment.topCenter,
        child:  Center(
          child:  ListView(
            children: <Widget>[
               Row(
                children: <Widget>[
                  Padding(padding: const EdgeInsets.only(left: 150 , top: 120)),
                   Text(
                    "B",
                    style:  TextStyle(
                        backgroundColor: Colors.blueGrey[400],
                        fontSize: 45,
                        fontWeight: FontWeight.bold,
                        color: Colors.white70),
                  ),
                   Text(
                    "MI",
                    style:  TextStyle(
                        fontSize: 45,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ],
              ),
               //Padding(padding: const EdgeInsets.all(5)),
               Container(
                 margin: EdgeInsets.only(left: 45 , right: 45 , bottom: 45 , top: 0) ,
                child:  Column(
                  children: <Widget>[
                     TextField(
                      controller: _ageController,
                      keyboardType: TextInputType.number,
                      cursorColor: Colors.blue,

                      decoration:  InputDecoration(
                        contentPadding: const EdgeInsets.only(top: 15 , bottom: 3),
                          labelText: "Age",
                          icon:  Icon(Icons.person_outline , color: Colors.blueGrey),
                          labelStyle: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey,
                      )),
                    ),
                     TextField(
                      controller: _heightController,
                      keyboardType: TextInputType.number,
                      decoration:  InputDecoration(
                          contentPadding: const EdgeInsets.only(top: 15, bottom: 3),
                          labelText: "Height (M)",
                          icon:  Icon(Icons.assessment, color: Colors.blueGrey),
                          labelStyle: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueGrey
                      )),
                    ),
                     TextField(
                      controller: _weightController,
                      keyboardType: TextInputType.number,
                      decoration:  InputDecoration(
                          contentPadding: const EdgeInsets.only(top: 15 , bottom: 3),
                         labelText: "Weight (KG)",
                         icon:  Icon(Icons.line_weight, color: Colors.blueGrey),
                          labelStyle: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueGrey
                      ))
                     ),
                     Padding(
                         padding: const EdgeInsets.only(top: 42)
                     ),
                     ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(15) ,
                        primary: Colors.blueGrey[400], // background
                        onPrimary: Colors.white, // foreground
                      ),
                      child: Text(
                        "Calculate",
                        style:  TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      onPressed: _BMIcalculate,
                    ),
                  ],
                ),
              ),

             Padding(padding: const EdgeInsets.only(top: 10)),
               Text(
                  _BMIresult == 0.0 || _BMIresult == -1.0
                      ? ""
                      : "Your BMI is : ${_BMIresult.toStringAsFixed(1)}",
                  textAlign: TextAlign.center,
                  style:  TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 15,
                      fontWeight: FontWeight.w700)),

              Padding( padding: const EdgeInsets.only(
                      left: 10, bottom: 15, right: 10, top: 15)),
               Text(
                 _BMIresult == 0.0 || _BMIresult == -1.0
                  ? ""
                  : "You Are $_stateResult",
                  textAlign: TextAlign.center,
                  style:  TextStyle(
                    color: Colors.blueGrey[700],
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
