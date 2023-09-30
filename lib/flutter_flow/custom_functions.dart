import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

bool? showCardSearchTextUpdated(
  String? textTosearchFor,
  String? textTosearchIn,
  String? category,
  String? cardCategory,
) {
  if (category == "" || category == null) {
  } else {
    return cardCategory == category;
  }

  if (textTosearchFor == "" || textTosearchFor == null) {
  } else {
    return textTosearchIn!.contains(textTosearchFor!) ||
        textTosearchIn == textTosearchFor!;
  }

  //return textTosearchIn!.contains(textTosearchFor!) || cardCategory == category;
}

double? returnLAt(LatLng? location) {
  // write me a function that gets as input the place and returns the longitude as floating point
  if (location != null) {
    return location.latitude;
  } else {
    return null;
  }
}

bool? showCardSearchText(
  String? textTosearchFor,
  String? textTosearchIn,
) {
  return textTosearchIn!.contains(textTosearchFor!);
}

double? returnLon(LatLng? location) {
  // write me a function that gets as input the place and returns the longitude as floating point
  if (location != null) {
    return location.longitude;
  } else {
    return null;
  }
}
