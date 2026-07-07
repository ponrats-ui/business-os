import 'package:flutter/material.dart';

import '../domain/business_category.dart';
import '../domain/store_template.dart';

class TemplateCatalog {
  const TemplateCatalog();

  List<BusinessCategory> get categories => const [
    BusinessCategory(
      id: 'coffee',
      name: 'Coffee Shop',
      description: 'Espresso, latte, tea, bakery add-ons',
      icon: Icons.local_cafe,
    ),
    BusinessCategory(
      id: 'restaurant',
      name: 'Restaurant',
      description: 'Rice dishes, noodles, made-to-order menus',
      icon: Icons.restaurant,
    ),
    BusinessCategory(
      id: 'street_food',
      name: 'Street Food',
      description: 'Fast menus, toppings, cash and QR friendly',
      icon: Icons.storefront,
    ),
    BusinessCategory(
      id: 'fruit',
      name: 'Fruit Shop',
      description: 'Fresh fruit, packed fruit, juice-ready stock',
      icon: Icons.eco,
    ),
    BusinessCategory(
      id: 'meat',
      name: 'Meat Shop',
      description: 'Cuts, weight units, chilled stock',
      icon: Icons.scale,
    ),
    BusinessCategory(
      id: 'vegetable',
      name: 'Vegetable Shop',
      description: 'Fresh produce by bundle, pack, or kilogram',
      icon: Icons.yard,
    ),
    BusinessCategory(
      id: 'grilled_pork',
      name: 'Grilled Pork',
      description: 'Skewers, sticky rice, breakfast rush',
      icon: Icons.outdoor_grill,
    ),
    BusinessCategory(
      id: 'fried_chicken',
      name: 'Fried Chicken',
      description: 'Pieces, sets, sauces, ready-to-sell trays',
      icon: Icons.lunch_dining,
    ),
    BusinessCategory(
      id: 'milk_tea',
      name: 'Milk Tea',
      description: 'Tea bases, toppings, sweetness options',
      icon: Icons.local_drink,
    ),
    BusinessCategory(
      id: 'dessert',
      name: 'Dessert',
      description: 'Cups, toppings, chilled sweets',
      icon: Icons.icecream,
    ),
    BusinessCategory(
      id: 'bakery',
      name: 'Bakery',
      description: 'Bread, cakes, pastries, daily batches',
      icon: Icons.bakery_dining,
    ),
    BusinessCategory(
      id: 'grocery',
      name: 'Grocery',
      description: 'Daily goods, barcode products, household items',
      icon: Icons.local_grocery_store,
    ),
    BusinessCategory(
      id: 'ice',
      name: 'Ice Shop',
      description: 'Bagged ice, delivery units, wholesale pricing',
      icon: Icons.ac_unit,
    ),
    BusinessCategory(
      id: 'other',
      name: 'Other',
      description: 'Start empty and build your own store',
      icon: Icons.add_business,
    ),
  ];

  List<StoreTemplate> templatesFor(String categoryId) {
    return _templates
        .where((template) => template.categoryId == categoryId)
        .toList()
      ..add(_emptyTemplate(categoryId));
  }

  StoreTemplate? templateById(String templateId) {
    for (final template in _templates) {
      if (template.id == templateId) {
        return template;
      }
    }
    return null;
  }

  StoreTemplate _emptyTemplate(String categoryId) {
    return StoreTemplate(
      id: 'empty_$categoryId',
      categoryId: categoryId,
      name: 'Create Empty Store',
      description: 'Start with clean categories and add products manually.',
      categories: const [],
      products: const [],
    );
  }

  static const List<StoreTemplate> _templates = [
    StoreTemplate(
      id: 'coffee_starter',
      categoryId: 'coffee',
      name: 'Coffee Starter',
      description: 'Core cafe menu with hot and iced best sellers.',
      categories: ['Coffee', 'Tea', 'Bakery'],
      products: [
        ProductSeed(
          name: 'Espresso',
          category: 'Coffee',
          unit: 'cup',
          cost: 18,
          price: 45,
          stock: 80,
          imageKeyword: 'espresso cup',
        ),
        ProductSeed(
          name: 'Americano',
          category: 'Coffee',
          unit: 'cup',
          cost: 20,
          price: 55,
          stock: 80,
          imageKeyword: 'americano coffee',
        ),
        ProductSeed(
          name: 'Latte',
          category: 'Coffee',
          unit: 'cup',
          cost: 28,
          price: 65,
          stock: 60,
          imageKeyword: 'latte glass',
        ),
        ProductSeed(
          name: 'Mocha',
          category: 'Coffee',
          unit: 'cup',
          cost: 30,
          price: 70,
          stock: 50,
          imageKeyword: 'mocha coffee',
        ),
        ProductSeed(
          name: 'Green Tea',
          category: 'Tea',
          unit: 'cup',
          cost: 24,
          price: 60,
          stock: 60,
          imageKeyword: 'green tea',
        ),
      ],
    ),
    StoreTemplate(
      id: 'restaurant_thai',
      categoryId: 'restaurant',
      name: 'Thai Made-to-Order',
      description: 'Fast Thai dishes for rice and noodle shops.',
      categories: ['Rice Menu', 'Noodles', 'Drinks'],
      products: [
        ProductSeed(
          name: 'Pad Thai',
          category: 'Noodles',
          unit: 'plate',
          cost: 28,
          price: 65,
          stock: 40,
          imageKeyword: 'pad thai',
        ),
        ProductSeed(
          name: 'Fried Rice',
          category: 'Rice Menu',
          unit: 'plate',
          cost: 25,
          price: 60,
          stock: 45,
          imageKeyword: 'fried rice',
        ),
        ProductSeed(
          name: 'Rice Menu',
          category: 'Rice Menu',
          unit: 'plate',
          cost: 30,
          price: 70,
          stock: 50,
          imageKeyword: 'rice dish',
        ),
      ],
    ),
    StoreTemplate(
      id: 'fruit_daily',
      categoryId: 'fruit',
      name: 'Fresh Fruit Stand',
      description: 'Popular fruit products with kilogram and piece units.',
      categories: ['Whole Fruit', 'Cut Fruit', 'Juice'],
      products: [
        ProductSeed(
          name: 'Watermelon',
          category: 'Whole Fruit',
          unit: 'kg',
          cost: 12,
          price: 25,
          stock: 120,
          imageKeyword: 'watermelon',
        ),
        ProductSeed(
          name: 'Orange',
          category: 'Whole Fruit',
          unit: 'kg',
          cost: 35,
          price: 60,
          stock: 80,
          imageKeyword: 'orange fruit',
        ),
        ProductSeed(
          name: 'Apple',
          category: 'Whole Fruit',
          unit: 'piece',
          cost: 10,
          price: 18,
          stock: 100,
          imageKeyword: 'apple',
        ),
        ProductSeed(
          name: 'Banana',
          category: 'Whole Fruit',
          unit: 'bunch',
          cost: 18,
          price: 35,
          stock: 45,
          imageKeyword: 'banana',
        ),
      ],
    ),
    StoreTemplate(
      id: 'street_food_fast',
      categoryId: 'street_food',
      name: 'Street Food Fast Menu',
      description: 'Compact menu for quick ordering and QR checkout.',
      categories: ['Main', 'Add-ons', 'Drinks'],
      products: [
        ProductSeed(
          name: 'Rice Bowl',
          category: 'Main',
          unit: 'bowl',
          cost: 22,
          price: 55,
          stock: 60,
          imageKeyword: 'rice bowl',
        ),
        ProductSeed(
          name: 'Extra Egg',
          category: 'Add-ons',
          unit: 'piece',
          cost: 5,
          price: 12,
          stock: 100,
          imageKeyword: 'fried egg',
        ),
      ],
    ),
  ];
}
