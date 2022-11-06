import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {

  final String title;
  final VoidCallback action;

  const CustomButton({Key? key, required this.title, required this.action}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
    );
  }
}