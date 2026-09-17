import 'dart:math';
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

class PasswordService {
  static PasswordStrength checkStrength(String password) {
    if (password.isEmpty) {
      return PasswordStrength(
        score: 0,
        
      );
    }

    int score = 0;
    

    bool hasLength = password.length >= 8;
    bool hasUppercase = password.contains(RegExp(r'[A-Z]'));
    bool hasLowercase = password.contains(RegExp(r'[a-z]'));
    bool hasDigit = password.contains(RegExp(r'[0-9]'));
    bool hasSpecial = password.contains(RegExp(r'[!@#\$%^&*(),.?":{}|<>]'));

    if (hasLength) score++;
    if (hasUppercase) score++;
    if (hasLowercase) score++;
    if (hasDigit) score++;
    if (hasSpecial) score++;

    if (!hasLength) unmetRequirements.add('8 أحرف على الأقل');
    if (!hasUppercase) unmetRequirements.add('حرف كبير (A-Z)');
    if (!hasLowercase) unmetRequirements.add('حرف صغير (a-z)');
    if (!hasDigit) unmetRequirements.add('رقم (0-9)');
    if (!hasSpecial) unmetRequirements.add('رمز خاص (!@#...)');

    String label;
    Color color;
    if (score <= 1) {
      label = 'ضعيف جداً';
      color = Colors.red;
    } else if (score == 2) {
      label = 'ضعيف';
      color = Colors.orange;
    } else if (score == 3) {
      label = 'متوسط';
      color = Colors.amber;
    } else if (score == 4) {
      label = 'قوي';
      color = Colors.lightGreen;
    } else {
      label = 'قوي جداً';
      color = Colors.green;
    }

    return PasswordStrength(
      score: score,
      label: label,
      color: color,
      requirements: unmetRequirements,
    );
  }

  static String generateStrongPassword() {
    const String uppercase = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    const String lowercase = 'abcdefghijklmnopqrstuvwxyz';
    const String digits = '0123456789';
    const String specials = '!@#%^&*()_+-=';
    const String allChars = uppercase + lowercase + digits + specials;

    Random rnd = Random.secure();
    List<String> password = [];

    password.add(uppercase[rnd.nextInt(uppercase.length)]);
    password.add(lowercase[rnd.nextInt(lowercase.length)]);
    password.add(digits[rnd.nextInt(digits.length)]);
    password.add(specials[rnd.nextInt(specials.length)]);

    for (int i = 4; i < 16; i++) {
      password.add(allChars[rnd.nextInt(allChars.length)]);
    }

    password.shuffle(rnd);
    return password.join();
  }

  static String estimateCrackTime(String password) {
    int length = password.length;
    int charsetSize = 0;

    if (password.contains(RegExp(r'[a-z]'))) charsetSize += 26;
    if (password.contains(RegExp(r'[A-Z]'))) charsetSize += 26;
    if (password.contains(RegExp(r'[0-9]'))) charsetSize += 10;
    if (password.contains(RegExp(r'[!@#\$%^&*(),.?":{}|<>]'))) charsetSize += 32;

    if (charsetSize == 0) return 'غير محدد';

    double attempts = pow(charsetSize, length).toDouble();
    double seconds = attempts / 10e9;

    if (seconds < 60) {
      return 'أقل من دقيقة';
    } else if (seconds < 3600) {
      return '${(seconds / 60).toInt()} دقيقة';
    } else if (seconds < 86400) {
      return '${(seconds / 3600).toInt()} ساعة';
    } else if (seconds < 31536000) {
      return '${(seconds / 86400).toInt()} يوم';
    } else if (seconds < 315360000) {
      return '${(seconds / 31536000).toInt()} سنة';
    } else {
      return 'أكثر من 10 سنوات';
    }
  }
}
