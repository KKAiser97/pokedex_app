import 'dart:ui';

import 'package:flutter/material.dart';

class TypeFilterChip extends StatelessWidget {
  final String type;

  const TypeFilterChip({Key? key, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(
        type,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      onSelected: (b) {},
      backgroundColor: _color(type.toLowerCase()),
    );
  }

  _color(type) {
    if (type == 'grass') {
      return Color(0xFF78c850);
    } else if (type == 'fire') {
      return Color(0xFFf08030);
    } else if (type == 'water') {
      return Color(0xFF6890f0);
    } else if (type == 'steel') {
      return Color(0xFFf08030);
    } else if (type == 'ground') {
      return Color(0xFFe0c068);
    } else if (type == 'rock') {
      return Color(0xFFb8a038);
    } else if (type == 'electric') {
      return Color(0xFFf8d030);
    } else if (type == 'poison') {
      return Color(0xFFa040a0);
    } else if (type == 'normal') {
      return Color(0xFFa8a878);
    } else if (type == 'fighting') {
      return Color(0xFFc03028);
    } else if (type == 'psychic') {
      return Color(0xFFf85888);
    } else if (type == 'flying') {
      return Color(0xFFa890f0);
    } else if (type == 'bug') {
      return Color(0xFFa8b820);
    } else if (type == 'dark') {
      return Color(0xFF705848);
    } else if (type == 'ghost') {
      return Color(0xFF705898);
    } else if (type == 'dragon') {
      return Color(0xFF7038f8);
    } else if (type == 'fairy') {
      return Color(0xFFee99ac);
    } else {
      return Color(0xFF68a090);
    }
  }
}
