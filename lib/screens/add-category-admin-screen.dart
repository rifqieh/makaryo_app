import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:makaryo_mobile/color.dart';
import 'dummyData.dart';

class AddCategoryAdminScreen extends StatefulWidget {
  @override
  _AddCategoryAdminScreenState createState() => _AddCategoryAdminScreenState();
}

class _AddCategoryAdminScreenState extends State<AddCategoryAdminScreen> {
  var _isVisibleColorPicker = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('KATEGORI BARU'),
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
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Nama Kategori',
                border: InputBorder.none,
                suffixIcon: InkWell(
                  onTap: () {
                    setState(() {
                      _isVisibleColorPicker = !_isVisibleColorPicker;
                    });
                  },
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32),
                        color: primaryColor),
                    margin: EdgeInsets.all(5),
                  ),
                ),
              ),
            ),
          ),
          (_isVisibleColorPicker == false
              ? Container()
              : Container(
                  height: 70,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    itemCount: colorList.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => ColorWidget(index),
                  ),
                )),
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

class ColorWidget extends StatelessWidget {
  var _index;

  ColorWidget(this._index);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: colorList[_index],
        borderRadius: BorderRadius.circular(32),
      ),
    );
  }
}
