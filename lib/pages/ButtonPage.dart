// ignore_for_file: file_names
import 'package:flutter/material.dart';

class ButtonPage extends StatefulWidget {
  const ButtonPage({super.key});

  @override
  State<ButtonPage> createState() => _ButtonPageState();
}

class _ButtonPageState extends State<ButtonPage> {
  bool isClicked = false;
  bool isDone = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: (() {
                pressed();
              }),
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xff0F2027),
                      Color(0xff203A43),
                      Color(0xff2C5364),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: isClicked
                    ? const CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : buttonWidget,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buttonWidget = const Text(
    "Press Me",
    style: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 17,
      letterSpacing: 2,
    ),
  );
  void pressed() async {
    if (isDone == true) {
      isDone = false;
      buttonWidget = const Text(
        "Press Me",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 17,
          letterSpacing: 2,
        ),
      );
      setState(() {});
    } else {
      setState(() {
        isClicked = true;
      });
      await Future.delayed(const Duration(seconds: 3), () {
        isClicked = false;
        buttonWidget = const Icon(
          Icons.done,
          color: Colors.white,
          size: 30,
        );
      });
      isDone = true;
      setState(() {});
    }
  }
}
