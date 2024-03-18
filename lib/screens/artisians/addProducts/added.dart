import 'package:flutter/material.dart';

class Added extends StatefulWidget {
  const Added({super.key});

  @override
  State<Added> createState() => _AddedState();
}

class _AddedState extends State<Added> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.green,
      ),
    );
  }
}