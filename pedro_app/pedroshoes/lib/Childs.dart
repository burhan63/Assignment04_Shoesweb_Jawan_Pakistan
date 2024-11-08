import 'package:flutter/material.dart';

class ChildsView extends StatefulWidget {
  const ChildsView({super.key});

  @override
  State<ChildsView> createState() => _ChildsViewState();
}

class _ChildsViewState extends State<ChildsView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Column(
        children: [
          Text(
            'Childs Trending Collectio Right Here',
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
