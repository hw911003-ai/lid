import 'package:flutter/material.dart';

class PasswordStrength {
  final int score;
  final String label;
  final Color color;
  final List<String> requirements;

  PasswordStrength({
    required this.score,
   
    required this.requirements,
  });
}
