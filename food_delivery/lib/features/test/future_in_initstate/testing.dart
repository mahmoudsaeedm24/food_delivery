import 'dart:developer';

import 'package:flutter/material.dart';

class Testing extends StatefulWidget {
  const Testing({super.key});

  @override
  State<Testing> createState() => _TestingState();
}

class _TestingState extends State<Testing> {
  int? i;
  Future<void> secondFunc() async {
    log("4 secondFunc start method at time ${DateTime.now()}");
    i = 10;
    Future.delayed(Duration(seconds: 6), () {
      log("9 secondFunc in function 3 sec at time ${DateTime.now()}");
    });
    log("5 After secondFunc at time ${DateTime.now()}");
  }

  Future<void> myFunction() async {
    log("2 start method at time ${DateTime.now()}");
    Future.delayed(Duration(seconds: 15), () {
      log("8 myFirst in function 3 sec at time ${DateTime.now()}");
    });
    log("3 After myFunction at time ${DateTime.now()}");
    await secondFunc();
    log("7 myFirst after secondFunc");
    i = 5;
  }

  @override
  void initState() {
    super.initState();
    log("1 before initState ");
    myFunction();
    log("6 After initState");

    log("i = $i");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container());
  }
}
