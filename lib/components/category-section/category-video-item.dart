import 'package:flutter/material.dart';
import '../../color.dart';

class CategoryVideoItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 20),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        title: Text('Hello'),
        trailing: Icon(
          Icons.favorite,
          color: primaryColor,
        ),
        leading: Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          height: 50,
          child: AspectRatio(
            aspectRatio: 2 / 1,
            child: Container(
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
