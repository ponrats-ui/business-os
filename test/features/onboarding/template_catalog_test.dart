import 'package:business_os/src/features/onboarding/data/template_catalog.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('TemplateCatalog', () {
    const catalog = TemplateCatalog();

    test('includes the Sprint 0 business categories', () {
      final categoryKeys = catalog.categories.map(
        (category) => category.nameKey,
      );

      expect(categoryKeys, contains('categoryCoffeeName'));
      expect(categoryKeys, contains('categoryRestaurantName'));
      expect(categoryKeys, contains('categoryStreetFoodName'));
      expect(categoryKeys, contains('categoryFruitName'));
      expect(categoryKeys, contains('categoryOtherName'));
    });

    test('adds Create Empty Store to every category', () {
      final templates = catalog.templatesFor('coffee');

      expect(
        templates.map((template) => template.nameKey),
        contains('templateEmptyName'),
      );
    });

    test('coffee starter seeds products and prices', () {
      final template = catalog.templateById('coffee_starter');

      expect(template, isNotNull);
      expect(
        template!.categoryKeys,
        containsAll([
          'categoryGroupCoffee',
          'categoryGroupTea',
          'categoryGroupBakery',
        ]),
      );
      expect(
        template.products.map((product) => product.nameKey),
        contains('productEspresso'),
      );
      expect(
        template.products.first.price,
        greaterThan(template.products.first.cost),
      );
    });

    test('bakery has a visual preview template', () {
      final templates = catalog.templatesFor('bakery');

      expect(
        templates.map((template) => template.id),
        contains('bakery_starter'),
      );
    });
  });
}
