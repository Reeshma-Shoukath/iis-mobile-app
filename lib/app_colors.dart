import 'package:flutter/material.dart';

/// Shared colors used across the app's screens.
class AppColors {
  AppColors._();

  static const background = Color(0xFFF6F4FA);
  static const card = Colors.white;

  static const primaryPurple = Color(0xFF6C3CE5);
  static const deepPurple = Color(0xFF2E1A66);
  static const pink = Color(0xFFB13FD6);

  static const textDark = Color(0xFF1E1A2B);
  static const textGray = Color(0xFF8C8898);
  static const textLightGray = Color(0xFFB2AEBD);

  static const divider = Color(0xFFECE9F2);

  static const success = Color(0xFF28C76F);
  static const warning = Color(0xFFF2A93B);
  static const danger = Color(0xFFE5484D);

  static const primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primaryPurple, pink],
  );

  static const wisdomCardGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF241347), Color(0xFF5B2C8C)],
  );

  static const twinHeartsGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF2E6FB0), Color(0xFF1C3F7A)],
  );

  static const hindiMeditationGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF1A8C82), Color(0xFF0E5C56)],
  );

  static const universalGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF6B2FA8), Color(0xFF3B1964)],
  );

  static const createPlaylistGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFF4E3F7), Color(0xFFE6DCFA)],
  );
}
