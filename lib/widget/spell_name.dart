import 'package:flutter/material.dart';
import 'package:project_soaring/spell/spell.dart';

final List<Color> colors = [
  Colors.white,
  Colors.lightGreen,
  Colors.lightBlue,
  Colors.deepPurple,
  Colors.deepOrange,
  Colors.red,
];

class SpellName extends StatelessWidget {
  const SpellName({Key? key, required this.spell}) : super(key: key);

  final Spell spell;

  @override
  Widget build(BuildContext context) {
    return Text(spell.name, style: TextStyle(color: colors[spell.rank]));
  }
}
