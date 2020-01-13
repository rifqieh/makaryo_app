import 'package:flutter/material.dart';
import 'package:makaryo_mobile/components/home-section/home-agenda-item.dart';
import '../color.dart';
import 'dummyData.dart';

class AgendaListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "AGENDA",
          style: TextStyle(fontWeight: FontWeight.w600, color: blackColor),
        ),
        leading: BackButton(),
      ),
      body: Container(
        color: backgroundColor,
        child: SafeArea(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return (HomeAgendaItem(agendaList[index]));
            },
            itemCount: agendaList.length,
          ),
        ),
      ),
    );
  }
}
