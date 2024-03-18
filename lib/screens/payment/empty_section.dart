import 'package:flutter/material.dart';

class EmptySection extends StatelessWidget {
  final String emptyImg, emptyMsg;

  const EmptySection({super.key, required this.emptyImg, required this.emptyMsg});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: AssetImage(emptyImg),
            height: 150.0,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              emptyMsg,
              style: const TextStyle(
                fontSize: 20.0,
                color:  Color(0xFF303030),
              ),
            ),
          ),
        ],
      ),
    );
  }
}