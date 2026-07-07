import 'package:flutter/material.dart';

import '../features/onboarding/presentation/category_wizard_screen.dart';
import '../theme/app_theme.dart';

class BusinessOsApp extends StatelessWidget {
  const BusinessOsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Business OS',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      home: const CategoryWizardScreen(),
    );
  }
}
