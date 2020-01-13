import 'package:flutter/material.dart';

import 'package:makaryo_mobile/color.dart';

class AddPostAdminScreen extends StatefulWidget {
  @override
  _AddPostAdminScreenState createState() => _AddPostAdminScreenState();
}

class _AddPostAdminScreenState extends State<AddPostAdminScreen> {
  var typeList = ["Artikel", "Video", "Agenda"];
  var categoryList = ["Kuliner", "Fesyen", "Kerajinan", "Motivasi"];
  var selectedType;
  var selectedCategory;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedType = typeList[0];
    selectedCategory = categoryList[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('POST BARU'),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(width: 2, color: primaryColor),
              borderRadius: BorderRadius.circular(4),
            ),
            padding: EdgeInsets.symmetric(horizontal: 10),
            margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
            child: DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Jenis',
                enabledBorder:
                    UnderlineInputBorder(borderSide: BorderSide.none),
              ),
              hint: Text('Jenis'),
              items: typeList
                  .map((label) => DropdownMenuItem(
                        child: Text(label),
                        value: label,
                      ))
                  .toList(),
              value: selectedType,
              onChanged: (value) {
                print(value);
                setState(() {
                  selectedType = value;
                });
              },
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(width: 2, color: primaryColor),
              borderRadius: BorderRadius.circular(4),
            ),
            padding: EdgeInsets.symmetric(horizontal: 10),
            margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
            child: DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Tipe',
                enabledBorder:
                    UnderlineInputBorder(borderSide: BorderSide.none),
              ),
              hint: Text('Tipe'),
              items: categoryList
                  .map((label) => DropdownMenuItem(
                        child: Text(label),
                        value: label,
                      ))
                  .toList(),
              value: selectedCategory,
              onChanged: (value) {
                setState(() {
                  print(value);
                  selectedCategory = value;
                });
              },
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(width: 2, color: primaryColor),
              borderRadius: BorderRadius.circular(4),
            ),
            padding: EdgeInsets.symmetric(horizontal: 10),
            margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Judul Post',
                border: InputBorder.none,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(width: 2, color: primaryColor),
              borderRadius: BorderRadius.circular(4),
            ),
            padding: EdgeInsets.symmetric(horizontal: 10),
            margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
            child: TextField(
              enabled: false,
              decoration: InputDecoration(
                hintText: 'Tambahkan File',
                border: InputBorder.none,
                suffixIcon: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                      color: primaryColor),
                  margin: EdgeInsets.all(5),
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: primaryColor,
            ),
            child: FlatButton(
              child: Text(
                'Tambah',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
