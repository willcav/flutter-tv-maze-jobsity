import 'package:flutter/material.dart';
import 'package:flutter_tv_maze_jobsity/src/ui/themes/app_colors.dart';

mixin AppTheme {
  static ThemeData mainThemeData = themeData(mainColorScheme);

  static ThemeData themeData(ColorScheme colorScheme) {
    return ThemeData(
      canvasColor: colorScheme.background,
      colorScheme: colorScheme,
      disabledColor: colorScheme.onBackground.withAlpha(40),
      dividerColor: colorScheme.onBackground.withAlpha(40),
      elevatedButtonTheme: elevatedButtonThemeData(colorScheme),
      outlinedButtonTheme: outlineButtonThemeData(colorScheme),
      textButtonTheme: textButtonThemeData(colorScheme),
      errorColor: colorScheme.error,
      focusColor: const Color(0xFF303030),
      fontFamily: 'Rubik',
      highlightColor: Colors.transparent,
      iconTheme: IconThemeData(color: colorScheme.onPrimary),
      inputDecorationTheme: inputDecorationTheme(colorScheme),
      primaryColor: colorScheme.primary,
      primaryColorLight: colorScheme.primaryContainer,
      scaffoldBackgroundColor: colorScheme.background,
      textTheme: _textTheme,
    );
  }

  static const ColorScheme mainColorScheme = ColorScheme(
    background: Color(0xFF303030),
    brightness: Brightness.dark,
    error: Color(0xFFD83838),
    onBackground: AppColors.black,
    onError: Color(0xFF303030),
    onPrimary: Color(0xFF303030),
    onSecondary: Color(0xFF303030),
    onSurface: Color(0xFFFCFCFC),
    primary: AppColors.primary,
    secondary: Color(0xFF367E9B),
    surface: Color(0xFF383838),
  );

  static ElevatedButtonThemeData elevatedButtonThemeData(
      ColorScheme colorScheme) {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0.0,
        onPrimary: colorScheme.onPrimary,
        onSurface: colorScheme.onSurface,
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
        primary: colorScheme.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        textStyle: _textTheme.subtitle1?.copyWith(color: colorScheme.onPrimary),
      ),
    );
  }

  static TextButtonThemeData textButtonThemeData(ColorScheme colorScheme) {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        padding: const EdgeInsets.only(right: 0, left: 0),
        elevation: 0.0,
        onSurface: colorScheme.onSurface,
        primary: colorScheme.primary,
        textStyle: _textTheme.subtitle1?.copyWith(color: colorScheme.onPrimary),
      ),
    );
  }

  static OutlinedButtonThemeData outlineButtonThemeData(
      ColorScheme colorScheme) {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        elevation: 0.0,
        onSurface: colorScheme.onSurface,
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
        primary: colorScheme.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        textStyle: _textTheme.subtitle1?.copyWith(color: colorScheme.onPrimary),
      ).copyWith(
        side: MaterialStateProperty.resolveWith<BorderSide>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return BorderSide(color: colorScheme.onBackground.withAlpha(40));
            }
            return BorderSide(color: colorScheme.primary);
          },
        ),
      ),
    );
  }

  static InputDecorationTheme inputDecorationTheme(ColorScheme colorScheme) {
    return InputDecorationTheme(
      border: InputBorder.none,
      labelStyle: _textTheme.bodyText1,
      hintStyle: _textTheme.subtitle1?.copyWith(
        color: colorScheme.onBackground.withAlpha(40),
      ),
    );
  }

  // static const _light = FontWeight.w300;
  static const _regular = FontWeight.w400;
  // static const _medium = FontWeight.w500;
  // static const _semiBold = FontWeight.w600;
  static const _bold = FontWeight.w700;

  static const TextTheme _textTheme = TextTheme(
    headline1: TextStyle(
      color: AppColors.black,
      fontFamily: 'Rubik',
      fontSize: 32,
      fontWeight: _bold,
    ),
    headline2: TextStyle(
      color: AppColors.black,
      fontFamily: 'Rubik',
      fontSize: 16,
      fontWeight: _bold,
    ),
    headline3: TextStyle(
      color: AppColors.black,
      fontFamily: 'Rubik',
      fontSize: 20,
      fontWeight: _bold,
    ),
    bodyText1: TextStyle(
      color: AppColors.black,
      fontFamily: 'Rubik',
      fontSize: 16,
      fontWeight: _regular,
    ),
    subtitle1: TextStyle(
      color: AppColors.grey2,
      fontFamily: 'Rubik',
      fontSize: 14,
      fontWeight: _regular,
    ),
  );
}
