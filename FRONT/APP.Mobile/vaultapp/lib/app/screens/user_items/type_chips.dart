import 'package:flutter/material.dart';

class TypeChips extends StatelessWidget {
  const TypeChips({Key? key, required this.type}) : super(key: key);

  final String type;

  Widget _buildTypeChip(String type, BuildContext context) {
    Icon icon;
    String label;

    switch (type) {
      case 'Book':
        {
          label = 'Livre';
          icon = const Icon(Icons.auto_stories);
        }

        break;
      case ('Movie'):
        {
          label = 'Film';
          icon = const Icon(Icons.theaters);
        }
        break;

      case ('VideoGame'):
        {
          label = 'Jeux vidéo';
          icon = const Icon(Icons.sports_esports);
        }
        break;
      default:
        {
          label = 'inconnu';
          icon = const Icon(Icons.error);
        }
    }

    return Chip(
        elevation: 3,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        label: Text(label,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        avatar: icon,
        backgroundColor: Theme.of(context).cardColor);
  }

  @override
  Widget build(BuildContext context) {
    return Transform(
        transform: Matrix4.identity()..scale(0.8),
        child: _buildTypeChip(type, context));
  }
}
