part of "initials_avatar.dart";

/// Get a simple background color based on the given name of the user.
Color nameToColor({required String name, required List<Color> possibleColors}) {
  int textCode = name
      .split('')
      .map((l) => l.codeUnitAt(0))
      .reduce((previous, current) => previous + current);

  return possibleColors[textCode % possibleColors.length];
}

/// A default set of possible colors for each avatar.
const List<Color> defaultColors = [
  Color(0xFF1abc9c),
  Color(0xFFf1c40f),
  Color(0xFF8e44ad),
  Color(0xFFe74c3c),
  Color(0xFFd35400),
  Color(0xFF2c3e50),
  Color(0xFF7f8c8d),
];
