import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4280183631),
      surfaceTint: Color(4280183631),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4289196751),
      onPrimaryContainer: Color(4278198549),
      secondary: Color(4283196248),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4291815898),
      onSecondaryContainer: Color(4278788119),
      tertiary: Color(4282278772),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4290898172),
      onTertiaryContainer: Color(4278198058),
      error: Color(4290386458),
      onError: Color(4294967295),
      errorContainer: Color(4294957782),
      onErrorContainer: Color(4282449922),
      surface: Color(4294310901),
      onSurface: Color(4279704858),
      onSurfaceVariant: Color(4282403140),
      outline: Color(4285561203),
      outlineVariant: Color(4290759106),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281086510),
      inversePrimary: Color(4287419828),
      primaryFixed: Color(4289196751),
      onPrimaryFixed: Color(4278198549),
      primaryFixedDim: Color(4287419828),
      onPrimaryFixedVariant: Color(4278210874),
      secondaryFixed: Color(4291815898),
      onSecondaryFixed: Color(4278788119),
      secondaryFixedDim: Color(4289973438),
      onSecondaryFixedVariant: Color(4281682753),
      tertiaryFixed: Color(4290898172),
      onTertiaryFixed: Color(4278198058),
      tertiaryFixedDim: Color(4289121503),
      onTertiaryFixedVariant: Color(4280634203),
      surfaceDim: Color(4292271062),
      surfaceBright: Color(4294310901),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4293916143),
      surfaceContainer: Color(4293586922),
      surfaceContainerHigh: Color(4293192420),
      surfaceContainerHighest: Color(4292797662),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4278209846),
      surfaceTint: Color(4280183631),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4281893221),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4281419581),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4284643950),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4280305495),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4283726475),
      onTertiaryContainer: Color(4294967295),
      error: Color(4287365129),
      onError: Color(4294967295),
      errorContainer: Color(4292490286),
      onErrorContainer: Color(4294967295),
      surface: Color(4294310901),
      onSurface: Color(4279704858),
      onSurfaceVariant: Color(4282139968),
      outline: Color(4283982172),
      outlineVariant: Color(4285824375),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281086510),
      inversePrimary: Color(4287419828),
      primaryFixed: Color(4281893221),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4279920717),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4284643950),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4283064661),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4283726475),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4282081649),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292271062),
      surfaceBright: Color(4294310901),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4293916143),
      surfaceContainer: Color(4293586922),
      surfaceContainerHigh: Color(4293192420),
      surfaceContainerHighest: Color(4292797662),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4278200347),
      surfaceTint: Color(4280183631),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4278209846),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4279248413),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4281419581),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4278199859),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4280305495),
      onTertiaryContainer: Color(4294967295),
      error: Color(4283301890),
      onError: Color(4294967295),
      errorContainer: Color(4287365129),
      onErrorContainer: Color(4294967295),
      surface: Color(4294310901),
      onSurface: Color(4278190080),
      onSurfaceVariant: Color(4280100385),
      outline: Color(4282139968),
      outlineVariant: Color(4282139968),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281086510),
      inversePrimary: Color(4289854681),
      primaryFixed: Color(4278209846),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4278203428),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4281419581),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4279972135),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4280305495),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4278399296),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292271062),
      surfaceBright: Color(4294310901),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4293916143),
      surfaceContainer: Color(4293586922),
      surfaceContainerHigh: Color(4293192420),
      surfaceContainerHighest: Color(4292797662),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4287419828),
      surfaceTint: Color(4287419828),
      onPrimary: Color(4278204455),
      primaryContainer: Color(4278210874),
      onPrimaryContainer: Color(4289196751),
      secondary: Color(4289973438),
      onSecondary: Color(4280235307),
      secondaryContainer: Color(4281682753),
      onSecondaryContainer: Color(4291815898),
      tertiary: Color(4289121503),
      onTertiary: Color(4278728004),
      tertiaryContainer: Color(4280634203),
      onTertiaryContainer: Color(4290898172),
      error: Color(4294948011),
      onError: Color(4285071365),
      errorContainer: Color(4287823882),
      onErrorContainer: Color(4294957782),
      surface: Color(4279178514),
      onSurface: Color(4292797662),
      onSurfaceVariant: Color(4290759106),
      outline: Color(4287271821),
      outlineVariant: Color(4282403140),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292797662),
      inversePrimary: Color(4280183631),
      primaryFixed: Color(4289196751),
      onPrimaryFixed: Color(4278198549),
      primaryFixedDim: Color(4287419828),
      onPrimaryFixedVariant: Color(4278210874),
      secondaryFixed: Color(4291815898),
      onSecondaryFixed: Color(4278788119),
      secondaryFixedDim: Color(4289973438),
      onSecondaryFixedVariant: Color(4281682753),
      tertiaryFixed: Color(4290898172),
      onTertiaryFixed: Color(4278198058),
      tertiaryFixedDim: Color(4289121503),
      onTertiaryFixedVariant: Color(4280634203),
      surfaceDim: Color(4279178514),
      surfaceBright: Color(4281678647),
      surfaceContainerLowest: Color(4278849293),
      surfaceContainerLow: Color(4279704858),
      surfaceContainer: Color(4279968030),
      surfaceContainerHigh: Color(4280625960),
      surfaceContainerHighest: Color(4281349683),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4287683256),
      surfaceTint: Color(4287419828),
      onPrimary: Color(4278197009),
      primaryContainer: Color(4283866752),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4290236866),
      onSecondary: Color(4278458897),
      secondaryContainer: Color(4286486153),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4289384676),
      onTertiary: Color(4278196515),
      tertiaryContainer: Color(4285568680),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294949553),
      onError: Color(4281794561),
      errorContainer: Color(4294923337),
      onErrorContainer: Color(4278190080),
      surface: Color(4279178514),
      onSurface: Color(4294442230),
      onSurfaceVariant: Color(4291087814),
      outline: Color(4288456095),
      outlineVariant: Color(4286350719),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292797662),
      inversePrimary: Color(4278211387),
      primaryFixed: Color(4289196751),
      onPrimaryFixed: Color(4278195468),
      primaryFixedDim: Color(4287419828),
      onPrimaryFixedVariant: Color(4278206251),
      secondaryFixed: Color(4291815898),
      onSecondaryFixed: Color(4278261005),
      secondaryFixedDim: Color(4289973438),
      onSecondaryFixedVariant: Color(4280630064),
      tertiaryFixed: Color(4290898172),
      onTertiaryFixed: Color(4278194972),
      tertiaryFixedDim: Color(4289121503),
      onTertiaryFixedVariant: Color(4279319370),
      surfaceDim: Color(4279178514),
      surfaceBright: Color(4281678647),
      surfaceContainerLowest: Color(4278849293),
      surfaceContainerLow: Color(4279704858),
      surfaceContainer: Color(4279968030),
      surfaceContainerHigh: Color(4280625960),
      surfaceContainerHighest: Color(4281349683),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4293787636),
      surfaceTint: Color(4287419828),
      onPrimary: Color(4278190080),
      primaryContainer: Color(4287683256),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4293787636),
      onSecondary: Color(4278190080),
      secondaryContainer: Color(4290236866),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294441983),
      onTertiary: Color(4278190080),
      tertiaryContainer: Color(4289384676),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294965753),
      onError: Color(4278190080),
      errorContainer: Color(4294949553),
      onErrorContainer: Color(4278190080),
      surface: Color(4279178514),
      onSurface: Color(4294967295),
      onSurfaceVariant: Color(4294245878),
      outline: Color(4291087814),
      outlineVariant: Color(4291087814),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292797662),
      inversePrimary: Color(4278202657),
      primaryFixed: Color(4289525459),
      onPrimaryFixed: Color(4278190080),
      primaryFixedDim: Color(4287683256),
      onPrimaryFixedVariant: Color(4278197009),
      secondaryFixed: Color(4292079070),
      onSecondaryFixed: Color(4278190080),
      secondaryFixedDim: Color(4290236866),
      onSecondaryFixedVariant: Color(4278458897),
      tertiaryFixed: Color(4291357951),
      onTertiaryFixed: Color(4278190080),
      tertiaryFixedDim: Color(4289384676),
      onTertiaryFixedVariant: Color(4278196515),
      surfaceDim: Color(4279178514),
      surfaceBright: Color(4281678647),
      surfaceContainerLowest: Color(4278849293),
      surfaceContainerLow: Color(4279704858),
      surfaceContainer: Color(4279968030),
      surfaceContainerHigh: Color(4280625960),
      surfaceContainerHighest: Color(4281349683),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
        useMaterial3: true,
        brightness: colorScheme.brightness,
        colorScheme: colorScheme,
        textTheme: textTheme.apply(
          bodyColor: colorScheme.onSurface,
          displayColor: colorScheme.onSurface,
        ),
        scaffoldBackgroundColor: colorScheme.surface,
        canvasColor: colorScheme.surface,
      );

  List<ExtendedColor> get extendedColors => [];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
