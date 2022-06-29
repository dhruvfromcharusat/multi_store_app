import 'package:flutter/material.dart';

// ignore: camel_case_types
class backbutton extends StatelessWidget {
  const backbutton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back_rounded),
      color: Colors.black,
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }
}

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.black,
          fontFamily: 'Acme',
          fontSize: 24,
          letterSpacing: 1.5,
        ),
      ),
    );
  }
}
