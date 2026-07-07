import 'package:flutter/material.dart';

class BusinessCategory {
  const BusinessCategory({
    required this.id,
    required this.nameKey,
    required this.descriptionKey,
    required this.icon,
  });

  final String id;
  final String nameKey;
  final String descriptionKey;
  final IconData icon;
}
