import 'package:flutter/material.dart';

import '../features/onboarding/presentation/category_wizard_screen.dart';
import '../l10n/generated/app_localizations.dart';
import '../theme/app_theme.dart';

class BusinessOsApp extends StatelessWidget {
  const BusinessOsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateTitle: (context) => AppLocalizations.of(context).appTitle,
      debugShowCheckedModeBanner: false,
      locale: const Locale('th'),
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      theme: AppTheme.light(),
      home: const CategoryWizardScreen(),
    );
  }
}
