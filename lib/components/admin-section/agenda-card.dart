import 'package:flutter/material.dart';

class AgendaCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      clipBehavior: Clip.antiAlias,
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            color: Colors.blueAccent,
          ),
          child: Icon(
            Icons.add,
            size: 60,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
