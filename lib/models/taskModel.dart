import 'package:flutter/material.dart';

class TaskModel {
  final String specialty;
  final DateTime startTime;
  final DateTime endTime;
  final String location;
  final String description;
  final Color color;

  TaskModel(
      {this.specialty,
      this.startTime,
      this.endTime,
      this.location,
      this.description,
      this.color});
}
