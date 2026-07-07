import 'package:flutter/material.dart';

import '../domain/business_category.dart';
import '../domain/store_template.dart';

class TemplateCatalog {
  const TemplateCatalog();

  List<BusinessCategory> get categories => const [
    BusinessCategory(
      id: 'coffee',
      nameKey: 'categoryCoffeeName',
      descriptionKey: 'categoryCoffeeDescription',
      icon: Icons.local_cafe,
    ),
    BusinessCategory(
      id: 'restaurant',
      nameKey: 'categoryRestaurantName',
      descriptionKey: 'categoryRestaurantDescription',
      icon: Icons.restaurant,
    ),
    BusinessCategory(
      id: 'street_food',
      nameKey: 'categoryStreetFoodName',
      descriptionKey: 'categoryStreetFoodDescription',
      icon: Icons.storefront,
    ),
    BusinessCategory(
      id: 'fruit',
      nameKey: 'categoryFruitName',
      descriptionKey: 'categoryFruitDescription',
      icon: Icons.eco,
    ),
    BusinessCategory(
      id: 'meat',
      nameKey: 'categoryMeatName',
      descriptionKey: 'categoryMeatDescription',
      icon: Icons.scale,
    ),
    BusinessCategory(
      id: 'vegetable',
      nameKey: 'categoryVegetableName',
      descriptionKey: 'categoryVegetableDescription',
      icon: Icons.yard,
    ),
    BusinessCategory(
      id: 'grilled_pork',
      nameKey: 'categoryGrilledPorkName',
      descriptionKey: 'categoryGrilledPorkDescription',
      icon: Icons.outdoor_grill,
    ),
    BusinessCategory(
      id: 'fried_chicken',
      nameKey: 'categoryFriedChickenName',
      descriptionKey: 'categoryFriedChickenDescription',
      icon: Icons.lunch_dining,
    ),
    BusinessCategory(
      id: 'milk_tea',
      nameKey: 'categoryMilkTeaName',
      descriptionKey: 'categoryMilkTeaDescription',
      icon: Icons.local_drink,
    ),
    BusinessCategory(
      id: 'dessert',
      nameKey: 'categoryDessertName',
      descriptionKey: 'categoryDessertDescription',
      icon: Icons.icecream,
    ),
    BusinessCategory(
      id: 'bakery',
      nameKey: 'categoryBakeryName',
      descriptionKey: 'categoryBakeryDescription',
      icon: Icons.bakery_dining,
    ),
    BusinessCategory(
      id: 'grocery',
      nameKey: 'categoryGroceryName',
      descriptionKey: 'categoryGroceryDescription',
      icon: Icons.local_grocery_store,
    ),
    BusinessCategory(
      id: 'ice',
      nameKey: 'categoryIceName',
      descriptionKey: 'categoryIceDescription',
      icon: Icons.ac_unit,
    ),
    BusinessCategory(
      id: 'other',
      nameKey: 'categoryOtherName',
      descriptionKey: 'categoryOtherDescription',
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
      nameKey: 'templateEmptyName',
      descriptionKey: 'templateEmptyDescription',
      categoryKeys: const [],
      products: const [],
    );
  }

  static const List<StoreTemplate> _templates = [
    StoreTemplate(
      id: 'coffee_starter',
      categoryId: 'coffee',
      nameKey: 'templateCoffeeStarterName',
      descriptionKey: 'templateCoffeeStarterDescription',
      categoryKeys: [
        'categoryGroupCoffee',
        'categoryGroupTea',
        'categoryGroupBakery',
      ],
      products: [
        ProductSeed(
          nameKey: 'productEspresso',
          categoryKey: 'categoryGroupCoffee',
          unitKey: 'unitCup',
          cost: 18,
          price: 45,
          stock: 80,
          imageKeywordKey: 'imageEspressoCup',
          icon: '☕',
        ),
        ProductSeed(
          nameKey: 'productAmericano',
          categoryKey: 'categoryGroupCoffee',
          unitKey: 'unitCup',
          cost: 20,
          price: 55,
          stock: 80,
          imageKeywordKey: 'imageAmericanoCoffee',
          icon: '☕',
        ),
        ProductSeed(
          nameKey: 'productLatte',
          categoryKey: 'categoryGroupCoffee',
          unitKey: 'unitCup',
          cost: 28,
          price: 65,
          stock: 60,
          imageKeywordKey: 'imageLatteGlass',
          icon: '🥛',
        ),
        ProductSeed(
          nameKey: 'productMocha',
          categoryKey: 'categoryGroupCoffee',
          unitKey: 'unitCup',
          cost: 30,
          price: 70,
          stock: 50,
          imageKeywordKey: 'imageMochaCoffee',
          icon: '🍫',
        ),
        ProductSeed(
          nameKey: 'productGreenTea',
          categoryKey: 'categoryGroupTea',
          unitKey: 'unitCup',
          cost: 24,
          price: 60,
          stock: 60,
          imageKeywordKey: 'imageGreenTea',
          icon: '🍵',
        ),
      ],
    ),
    StoreTemplate(
      id: 'restaurant_thai',
      categoryId: 'restaurant',
      nameKey: 'templateRestaurantThaiName',
      descriptionKey: 'templateRestaurantThaiDescription',
      categoryKeys: [
        'categoryGroupRiceMenu',
        'categoryGroupNoodles',
        'categoryGroupDrinks',
      ],
      products: [
        ProductSeed(
          nameKey: 'productPadThai',
          categoryKey: 'categoryGroupNoodles',
          unitKey: 'unitPlate',
          cost: 28,
          price: 65,
          stock: 40,
          imageKeywordKey: 'imagePadThai',
          icon: '🍜',
        ),
        ProductSeed(
          nameKey: 'productFriedRice',
          categoryKey: 'categoryGroupRiceMenu',
          unitKey: 'unitPlate',
          cost: 25,
          price: 60,
          stock: 45,
          imageKeywordKey: 'imageFriedRice',
          icon: '🍛',
        ),
        ProductSeed(
          nameKey: 'productRiceMenu',
          categoryKey: 'categoryGroupRiceMenu',
          unitKey: 'unitPlate',
          cost: 30,
          price: 70,
          stock: 50,
          imageKeywordKey: 'imageRiceDish',
          icon: '🍚',
        ),
      ],
    ),
    StoreTemplate(
      id: 'fruit_daily',
      categoryId: 'fruit',
      nameKey: 'templateFruitDailyName',
      descriptionKey: 'templateFruitDailyDescription',
      categoryKeys: [
        'categoryGroupWholeFruit',
        'categoryGroupCutFruit',
        'categoryGroupJuice',
      ],
      products: [
        ProductSeed(
          nameKey: 'productWatermelon',
          categoryKey: 'categoryGroupWholeFruit',
          unitKey: 'unitKg',
          cost: 12,
          price: 25,
          stock: 120,
          imageKeywordKey: 'imageWatermelon',
          icon: '🍉',
        ),
        ProductSeed(
          nameKey: 'productOrange',
          categoryKey: 'categoryGroupWholeFruit',
          unitKey: 'unitKg',
          cost: 35,
          price: 60,
          stock: 80,
          imageKeywordKey: 'imageOrangeFruit',
          icon: '🍊',
        ),
        ProductSeed(
          nameKey: 'productApple',
          categoryKey: 'categoryGroupWholeFruit',
          unitKey: 'unitPiece',
          cost: 10,
          price: 18,
          stock: 100,
          imageKeywordKey: 'imageApple',
          icon: '🍎',
        ),
        ProductSeed(
          nameKey: 'productBanana',
          categoryKey: 'categoryGroupWholeFruit',
          unitKey: 'unitBunch',
          cost: 18,
          price: 35,
          stock: 45,
          imageKeywordKey: 'imageBanana',
          icon: '🍌',
        ),
      ],
    ),
    StoreTemplate(
      id: 'street_food_fast',
      categoryId: 'street_food',
      nameKey: 'templateStreetFoodFastName',
      descriptionKey: 'templateStreetFoodFastDescription',
      categoryKeys: [
        'categoryGroupMain',
        'categoryGroupAddOns',
        'categoryGroupDrinks',
      ],
      products: [
        ProductSeed(
          nameKey: 'productRiceBowl',
          categoryKey: 'categoryGroupMain',
          unitKey: 'unitBowl',
          cost: 22,
          price: 55,
          stock: 60,
          imageKeywordKey: 'imageRiceBowl',
          icon: '🍱',
        ),
        ProductSeed(
          nameKey: 'productExtraEgg',
          categoryKey: 'categoryGroupAddOns',
          unitKey: 'unitPiece',
          cost: 5,
          price: 12,
          stock: 100,
          imageKeywordKey: 'imageFriedEgg',
          icon: '🍳',
        ),
      ],
    ),
    StoreTemplate(
      id: 'bakery_starter',
      categoryId: 'bakery',
      nameKey: 'templateBakeryStarterName',
      descriptionKey: 'templateBakeryStarterDescription',
      categoryKeys: [
        'categoryGroupBread',
        'categoryGroupCake',
        'categoryGroupPastry',
      ],
      products: [
        ProductSeed(
          nameKey: 'productMilkBread',
          categoryKey: 'categoryGroupBread',
          unitKey: 'unitPiece',
          cost: 16,
          price: 35,
          stock: 40,
          imageKeywordKey: 'imageMilkBread',
          icon: '🍞',
        ),
        ProductSeed(
          nameKey: 'productButterCroissant',
          categoryKey: 'categoryGroupPastry',
          unitKey: 'unitPiece',
          cost: 22,
          price: 55,
          stock: 30,
          imageKeywordKey: 'imageButterCroissant',
          icon: '🥐',
        ),
        ProductSeed(
          nameKey: 'productChocolateCake',
          categoryKey: 'categoryGroupCake',
          unitKey: 'unitPiece',
          cost: 35,
          price: 85,
          stock: 18,
          imageKeywordKey: 'imageChocolateCake',
          icon: '🍰',
        ),
      ],
    ),
  ];
}
