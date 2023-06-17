import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/supabase/supabase.dart';

int? sumaRanking(
  int num1,
  int num2,
) {
  return num1 + num2;
}

double dividirNum1paraNum2(
  int num1,
  int num2,
) {
  return num1 / num2;
}

String restarHorasAFecha(
  DateTime dateTime,
  int hours,
) {
  Duration extract = Duration(hours: hours);
  return dateTime.subtract(extract).toString();
}
