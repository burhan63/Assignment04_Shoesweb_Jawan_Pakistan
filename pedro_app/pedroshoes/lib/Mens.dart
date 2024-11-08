import 'package:flutter/material.dart';

class MensView extends StatefulWidget {
  const MensView({super.key});

  @override
  State<MensView> createState() => _MensViewState();
}

class _MensViewState extends State<MensView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Coming Soon....!!!",
              style: TextStyle(
                fontSize: 25,
                fontFamily: 'Arial',
                //fontWeight: FontWeight.bold,
                color: Colors.redAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
