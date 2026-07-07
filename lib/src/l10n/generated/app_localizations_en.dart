// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Business OS';

  @override
  String get appSubtitle => 'Smart shop management system';

  @override
  String get welcomeTagline => 'Open your shop in 5 minutes';

  @override
  String get workforce => 'Workforce';

  @override
  String get step1 => 'Step 1';

  @override
  String get step2 => 'Step 2';

  @override
  String get step3 => 'Step 3';

  @override
  String get chooseBusinessCategory => 'Choose Business Category';

  @override
  String get chooseTemplate => 'Choose Template';

  @override
  String get createReadyStore => 'Create Ready Store';

  @override
  String get createStorePreview => 'Create Store Preview';

  @override
  String get readyToSell => 'Ready to sell';

  @override
  String get categoriesMetric => 'Categories';

  @override
  String get productsMetric => 'Products';

  @override
  String get averageProfitMetric => 'Average Profit';

  @override
  String get seedProducts => 'Seed Products';

  @override
  String get storePreviewTitle => 'Store Preview';

  @override
  String get storePreviewSubtitle =>
      'See what Business OS prepares before you start selling.';

  @override
  String get emptyStorePreview =>
      'Empty store selected. Add products from Product Management.';

  @override
  String get previewPlaceholder =>
      'Business OS will create categories, products, prices, units, stock seeds, image keywords, and a starter dashboard.';

  @override
  String thbAmount(int amount) {
    return 'THB $amount';
  }

  @override
  String countValue(int count) {
    return '$count';
  }

  @override
  String productDetail(Object category, Object unit, Object imageKeyword) {
    return '$category / $unit / $imageKeyword';
  }

  @override
  String get categoryCoffeeName => 'Coffee Shop';

  @override
  String get categoryCoffeeDescription =>
      'Hot coffee, iced coffee, tea, and ready-to-sell drinks';

  @override
  String get categoryRestaurantName => 'Restaurant';

  @override
  String get categoryRestaurantDescription =>
      'Rice dishes, noodles, and made-to-order menus';

  @override
  String get categoryStreetFoodName => 'Street Food';

  @override
  String get categoryStreetFoodDescription =>
      'Fast menus, toppings, cash and QR friendly';

  @override
  String get categoryFruitName => 'Fruit Shop';

  @override
  String get categoryFruitDescription =>
      'Fresh fruit, packed fruit, and juice-ready stock';

  @override
  String get categoryMeatName => 'Meat Shop';

  @override
  String get categoryMeatDescription =>
      'Weighted cuts, prepared meat, and chilled stock';

  @override
  String get categoryVegetableName => 'Vegetable Shop';

  @override
  String get categoryVegetableDescription =>
      'Fresh produce by bundle, pack, or kilogram';

  @override
  String get categoryGrilledPorkName => 'Grilled Pork';

  @override
  String get categoryGrilledPorkDescription =>
      'Skewers, sticky rice, and breakfast rush sets';

  @override
  String get categoryFriedChickenName => 'Fried Chicken';

  @override
  String get categoryFriedChickenDescription =>
      'Pieces, sets, sauces, and ready-to-sell trays';

  @override
  String get categoryMilkTeaName => 'Milk Tea';

  @override
  String get categoryMilkTeaDescription =>
      'Tea bases, milk drinks, toppings, and sweetness options';

  @override
  String get categoryDessertName => 'Dessert';

  @override
  String get categoryDessertDescription =>
      'Cups, Thai sweets, chilled desserts, and toppings';

  @override
  String get categoryBakeryName => 'Bakery';

  @override
  String get categoryBakeryDescription =>
      'Bread, cakes, croissants, and daily batches';

  @override
  String get categoryGroceryName => 'Grocery';

  @override
  String get categoryGroceryDescription =>
      'Daily goods, barcode products, and household items';

  @override
  String get categoryIceName => 'Ice Shop';

  @override
  String get categoryIceDescription =>
      'Bagged ice, delivery units, and wholesale pricing';

  @override
  String get categoryOtherName => 'Other';

  @override
  String get categoryOtherDescription =>
      'Start empty and shape the store around your business';

  @override
  String get templateCoffeeStarterName => 'Coffee Starter';

  @override
  String get templateCoffeeStarterDescription =>
      'Popular ready-made menu\nHot coffee\nIced coffee\nTea\nDrinks';

  @override
  String get templateRestaurantThaiName => 'Thai Restaurant Starter';

  @override
  String get templateRestaurantThaiDescription =>
      'Popular rice and noodle dishes for made-to-order restaurants';

  @override
  String get templateFruitDailyName => 'Fresh Fruit Stand';

  @override
  String get templateFruitDailyDescription =>
      'Best-selling fruit with kilogram, piece, and bunch units';

  @override
  String get templateStreetFoodFastName => 'Street Food Fast Menu';

  @override
  String get templateStreetFoodFastDescription =>
      'Compact menu for quick ordering and easy checkout';

  @override
  String get templateBakeryStarterName => 'Bakery Starter';

  @override
  String get templateBakeryStarterDescription =>
      'Bread, cakes, and croissants ready for the counter';

  @override
  String get templateEmptyName => 'Create Empty Store';

  @override
  String get templateEmptyDescription =>
      'Start from zero\nAdd every product yourself';

  @override
  String get categoryGroupCoffee => 'Coffee';

  @override
  String get categoryGroupTea => 'Tea';

  @override
  String get categoryGroupBakery => 'Bakery';

  @override
  String get categoryGroupRiceMenu => 'Rice Menu';

  @override
  String get categoryGroupNoodles => 'Noodles';

  @override
  String get categoryGroupDrinks => 'Drinks';

  @override
  String get categoryGroupWholeFruit => 'Whole Fruit';

  @override
  String get categoryGroupCutFruit => 'Cut Fruit';

  @override
  String get categoryGroupJuice => 'Juice';

  @override
  String get categoryGroupMain => 'Main';

  @override
  String get categoryGroupAddOns => 'Add-ons';

  @override
  String get categoryGroupBread => 'Bread';

  @override
  String get categoryGroupCake => 'Cake';

  @override
  String get categoryGroupPastry => 'Pastry';

  @override
  String get unitCup => 'cup';

  @override
  String get unitPlate => 'plate';

  @override
  String get unitKg => 'kg';

  @override
  String get unitPiece => 'piece';

  @override
  String get unitBunch => 'bunch';

  @override
  String get unitBowl => 'bowl';

  @override
  String get productEspresso => 'Espresso';

  @override
  String get productAmericano => 'Americano';

  @override
  String get productLatte => 'Latte';

  @override
  String get productMocha => 'Mocha';

  @override
  String get productGreenTea => 'Green Tea';

  @override
  String get productPadThai => 'Pad Thai';

  @override
  String get productFriedRice => 'Fried Rice';

  @override
  String get productRiceMenu => 'Rice Menu';

  @override
  String get productWatermelon => 'Watermelon';

  @override
  String get productOrange => 'Orange';

  @override
  String get productApple => 'Apple';

  @override
  String get productBanana => 'Banana';

  @override
  String get productRiceBowl => 'Rice Bowl';

  @override
  String get productExtraEgg => 'Extra Egg';

  @override
  String get productMilkBread => 'Milk Bread';

  @override
  String get productButterCroissant => 'Butter Croissant';

  @override
  String get productChocolateCake => 'Chocolate Cake';

  @override
  String get imageEspressoCup => 'espresso cup image';

  @override
  String get imageAmericanoCoffee => 'americano coffee image';

  @override
  String get imageLatteGlass => 'latte image';

  @override
  String get imageMochaCoffee => 'mocha image';

  @override
  String get imageGreenTea => 'green tea image';

  @override
  String get imagePadThai => 'pad thai image';

  @override
  String get imageFriedRice => 'fried rice image';

  @override
  String get imageRiceDish => 'rice dish image';

  @override
  String get imageWatermelon => 'watermelon image';

  @override
  String get imageOrangeFruit => 'orange image';

  @override
  String get imageApple => 'apple image';

  @override
  String get imageBanana => 'banana image';

  @override
  String get imageRiceBowl => 'rice bowl image';

  @override
  String get imageFriedEgg => 'fried egg image';

  @override
  String get imageMilkBread => 'milk bread image';

  @override
  String get imageButterCroissant => 'croissant image';

  @override
  String get imageChocolateCake => 'chocolate cake image';
}
