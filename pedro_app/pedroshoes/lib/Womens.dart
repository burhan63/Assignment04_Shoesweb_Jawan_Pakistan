import 'package:flutter/material.dart';

class WomensView extends StatefulWidget {
  const WomensView({super.key});

  @override
  State<WomensView> createState() => _WomensViewState();
}

class _WomensViewState extends State<WomensView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Column(
        children: [
          Text(
            'Womens Trending Collectio Right Here',
            style: TextStyle(
              fontSize: 15,
              fontFamily: 'Arial',
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
