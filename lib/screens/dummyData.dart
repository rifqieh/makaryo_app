import 'package:flutter/material.dart';
import 'package:makaryo_mobile/providers/agendaClass.dart';
import 'package:makaryo_mobile/providers/kategoriClass.dart';
import 'package:makaryo_mobile/providers/kontenClass.dart';

List<Agenda> agendaList = [
  Agenda(
      "Pesta Akhir Pekan Colomadu",
      "ICSB Colomadu",
      "12 Januari 2019",
      Waktu('20 Januari 2020', "15.00", "Selesai"),
      "Pasar Colomadu",
      "",
      Colors.amberAccent),
  Agenda(
      "Acara Lain Lagi",
      "ICSB Karanganyar",
      '24 Februari 2020',
      Waktu('29 Februari 2020', '10.00', '15.00'),
      'Auditorium UNS',
      "",
      Colors.blueAccent),
  Agenda(
      "Acara Lain Lagi",
      "ICSB Karanganyar",
      '24 Februari 2020',
      Waktu('29 Februari 2020', '10.00', '15.00'),
      'Auditorium UNS',
      "",
      Colors.blueAccent),
  Agenda(
      "Acara Lain Lagi",
      "ICSB Karanganyar",
      '24 Februari 2020',
      Waktu('29 Februari 2020', '10.00', '15.00'),
      'Auditorium UNS',
      "",
      Colors.blueAccent),
  Agenda(
      "Acara Lain Lagi",
      "ICSB Karanganyar",
      '24 Februari 2020',
      Waktu('29 Februari 2020', '10.00', '15.00'),
      'Auditorium UNS',
      "",
      Colors.blueAccent)
];

List<Kategori> kategoriList = [
  Kategori(Colors.amberAccent, 'Kuliner', 0.7),
  Kategori(Colors.blueAccent, 'Fesyen', 0.4),
  Kategori(Colors.redAccent, 'Kerajinan', 0.2),
  Kategori(Colors.greenAccent, 'Motivasi', 0.1),
];

List<Konten> kontenList = [
  Konten(
      "idKonten", "Kuliner", "artikel", false, "Cara Mendapat Subsribers", ""),
  Konten("idKonten", "Kuliner", "video", false, "Cara Mendapat Subsribers", ""),
  Konten(
      "idKonten", "Fesyen", "artikel", false, "Cara Mendapat Subsribers", ""),
  Konten(
      "idKonten", "Kerajinan", "video", false, "Cara Mendapat Subsribers", ""),
  Konten("idKonten", "Kuliner", "video", false, "Cara Mendapat Subsribers", ""),
  Konten(
      "idKonten", "Kuliner", "artikel", false, "Cara Mendapat Subsribers", ""),
  Konten("idKonten", "Kuliner", "video", false, "Cara Mendapat Subsribers", ""),
  Konten("idKonten", "Kerajinan", "artikel", false, "Cara Mendapat Subsribers",
      ""),
  Konten(
      "idKonten", "Kerajinan", "video", false, "Cara Mendapat Subsribers", ""),
  Konten(
      "idKonten", "Motivasi", "video", false, "Cara Mendapat Subsribers", ""),
  Konten("idKonten", "Fesyen", "video", false, "Cara Mendapat Subsribers", ""),
  Konten(
      "idKonten", "Motivasi", "artikel", false, "Cara Mendapat Subsribers", ""),
];
