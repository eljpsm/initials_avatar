library initials_avatar;

import 'package:flutter/material.dart';

part "colors.dart";

class InitialsAvatar extends StatelessWidget {
  /// Return a simple avatar that uses the initials of the user.
  const InitialsAvatar({
    Key? key,
    required this.name,
    this.textStyle,
    this.maxInitials = 2,
    this.initialSeparator = ' ',
    this.radius = 40.0,
    this.elevation = 0.0,
    this.possibleColors = defaultColors,
    this.bgColor,
    this.shadowColor,
    this.shape = BoxShape.circle,
  }) : super(key: key);

  /// The name of the user.
  final String name;

  /// The style of the resulting initials.
  final TextStyle? textStyle;

  /// The maximum number of initials to be shown.
  final int maxInitials;

  /// The separator used to separate each initial.
  final String initialSeparator;

  /// The radius of the avatar background.
  final double radius;

  /// The elevation of the avatar. This mimics the Material style.
  final double elevation;

  /// The possible colors to display depending on the name of the user.
  final List<Color> possibleColors;

  /// The function to determine the avatar background color, given possible
  /// colors.
  final Function(String)? bgColor;

  /// The elevation shadow color.
  final Color? shadowColor;

  /// The shape of the resulting avatar.
  final BoxShape shape;

  /// Get the initials used for the avatar.
  String _initials(name) {
    return name
        .trim()
        .split(RegExp(' +'))
        .map((s) => s[0])
        .take(maxInitials)
        .join(initialSeparator);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: radius,
      width: radius,
      decoration: BoxDecoration(
          color: bgColor != null
              ? bgColor!(name)
              : nameToColor(name: name, possibleColors: possibleColors),
          shape: shape,
          boxShadow: elevation > 0
              ? [
                  BoxShadow(
                      offset: const Offset(0, 0),
                      blurRadius: 10.0,
                      spreadRadius: elevation,
                      color: shadowColor ??
                          Theme.of(context).shadowColor.withOpacity(0.3))
                ]
              : []),
      child: Center(child: Text(_initials(name), style: textStyle)),
    );
  }
}
