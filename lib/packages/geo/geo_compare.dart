import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'geo_return.dart';

bool compare(Position employee) {
  double distanceInMeters = Geolocator.distanceBetween(
      employee.latitude, employee.longitude, 30.765616, 76.753638);
  if (distanceInMeters <= 100) {
    return true;
  } else {
    return false;
  }
}
