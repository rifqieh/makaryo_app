import 'package:flutter/material.dart';
import 'package:makaryo_mobile/screens/add-post-admin-screen.dart';

class AddCategoryCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => AddPostAdminScreen()));
      },
      child: Card(
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
      ),
    );
  }
}
