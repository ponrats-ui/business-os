import 'package:business_os/src/features/onboarding/data/template_catalog.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('TemplateCatalog', () {
    const catalog = TemplateCatalog();

    test('includes the Sprint 0 business categories', () {
      final categoryNames = catalog.categories.map((category) => category.name);

      expect(categoryNames, contains('Coffee Shop'));
      expect(categoryNames, contains('Restaurant'));
      expect(categoryNames, contains('Street Food'));
      expect(categoryNames, contains('Fruit Shop'));
      expect(categoryNames, contains('Other'));
    });

    test('adds Create Empty Store to every category', () {
      final templates = catalog.templatesFor('coffee');

      expect(
        templates.map((template) => template.name),
        contains('Create Empty Store'),
      );
    });

    test('coffee starter seeds products and prices', () {
      final template = catalog.templateById('coffee_starter');

      expect(template, isNotNull);
      expect(template!.categories, containsAll(['Coffee', 'Tea', 'Bakery']));
      expect(
        template.products.map((product) => product.name),
        contains('Espresso'),
      );
      expect(
        template.products.first.price,
        greaterThan(template.products.first.cost),
      );
    });
  });
}
