import 'package:flutter/material.dart';

Color scoreColor(BuildContext context, int? score) {
  if (score == null) {
    return Theme.of(context).colorScheme.inverseSurface;
  }

  return score > 0
      ? Colors.blue
      : score < 0
          ? Colors.redAccent
          : Theme.of(context).colorScheme.inverseSurface;
}
