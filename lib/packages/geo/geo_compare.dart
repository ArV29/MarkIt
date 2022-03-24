import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'geo_return.dart';

bool compare(Position employee) {
  print("${employee.latitude}, ${employee.longitude}");
  double distanceInMeters = Geolocator.distanceBetween(
      employee.latitude, employee.longitude, 30.7616391, 76.7891212);
  if (distanceInMeters <= 100) {
    return true;
  } else {
    return false;
  }
}
