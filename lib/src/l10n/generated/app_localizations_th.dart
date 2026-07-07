// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Thai (`th`).
class AppLocalizationsTh extends AppLocalizations {
  AppLocalizationsTh([String locale = 'th']) : super(locale);

  @override
  String get appTitle => 'Business OS';

  @override
  String get appSubtitle => 'ระบบบริหารร้านค้าอัจฉริยะ';

  @override
  String get welcomeTagline => 'เปิดร้านได้ภายใน 5 นาที';

  @override
  String get workforce => 'ทีมงาน';

  @override
  String get step1 => 'ขั้นตอนที่ 1';

  @override
  String get step2 => 'ขั้นตอนที่ 2';

  @override
  String get step3 => 'ขั้นตอนที่ 3';

  @override
  String get chooseBusinessCategory => 'เลือกประเภทร้าน';

  @override
  String get chooseTemplate => 'เลือกเทมเพลตร้าน';

  @override
  String get createReadyStore => 'สร้างร้านพร้อมใช้งาน';

  @override
  String get createStorePreview => 'สร้างตัวอย่างร้าน';

  @override
  String get readyToSell => 'พร้อมขาย';

  @override
  String get categoriesMetric => 'หมวดหมู่';

  @override
  String get productsMetric => 'สินค้า';

  @override
  String get averageProfitMetric => 'กำไรเฉลี่ย';

  @override
  String get seedProducts => 'สินค้าตัวอย่าง';

  @override
  String get storePreviewTitle => 'ตัวอย่างหน้าร้าน';

  @override
  String get storePreviewSubtitle =>
      'ดูสินค้าที่ระบบจะเตรียมให้ก่อนเริ่มใช้งานจริง';

  @override
  String get emptyStorePreview =>
      'เลือกสร้างร้านเปล่า แล้วเพิ่มสินค้าเองในเมนูจัดการสินค้า';

  @override
  String get previewPlaceholder =>
      'ระบบจะเตรียมหมวดหมู่ สินค้า ราคา หน่วยนับ สต็อกตั้งต้น คำค้นรูปสินค้า และแดชบอร์ดเริ่มต้นให้';

  @override
  String thbAmount(int amount) {
    return '฿$amount';
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
  String get categoryCoffeeName => 'ร้านกาแฟ';

  @override
  String get categoryCoffeeDescription =>
      'กาแฟร้อน กาแฟเย็น ชา และเครื่องดื่มพร้อมขาย';

  @override
  String get categoryRestaurantName => 'ร้านอาหาร';

  @override
  String get categoryRestaurantDescription =>
      'เมนูข้าว เมนูเส้น และอาหารตามสั่ง';

  @override
  String get categoryStreetFoodName => 'ร้านอาหารตามสั่ง';

  @override
  String get categoryStreetFoodDescription =>
      'เมนูขายเร็ว เพิ่มท็อปปิง รับเงินสดและ QR ได้ง่าย';

  @override
  String get categoryFruitName => 'ร้านผลไม้';

  @override
  String get categoryFruitDescription => 'ผลไม้สด ผลไม้แพ็ก และเมนูน้ำผลไม้';

  @override
  String get categoryMeatName => 'ร้านขายเนื้อ';

  @override
  String get categoryMeatDescription =>
      'สินค้าแบบชั่งน้ำหนัก ตัดแต่ง และสต็อกแช่เย็น';

  @override
  String get categoryVegetableName => 'ร้านขายผัก';

  @override
  String get categoryVegetableDescription => 'ผักสดแบบกำ มัด แพ็ก หรือกิโลกรัม';

  @override
  String get categoryGrilledPorkName => 'ร้านหมูปิ้ง';

  @override
  String get categoryGrilledPorkDescription =>
      'หมูปิ้ง ข้าวเหนียว และชุดอาหารเช้าขายเร็ว';

  @override
  String get categoryFriedChickenName => 'ร้านไก่ทอด';

  @override
  String get categoryFriedChickenDescription =>
      'ไก่ทอดเป็นชิ้น เป็นชุด และซอสเสริม';

  @override
  String get categoryMilkTeaName => 'ร้านชาและเครื่องดื่ม';

  @override
  String get categoryMilkTeaDescription =>
      'ชา นม ไข่มุก ท็อปปิง และระดับความหวาน';

  @override
  String get categoryDessertName => 'ร้านขนมหวาน';

  @override
  String get categoryDessertDescription =>
      'ขนมถ้วย ขนมไทย ของหวานเย็น และท็อปปิง';

  @override
  String get categoryBakeryName => 'ร้านเบเกอรี่';

  @override
  String get categoryBakeryDescription =>
      'ขนมปัง เค้ก ครัวซองต์ และรอบอบประจำวัน';

  @override
  String get categoryGroceryName => 'ร้านโชห่วย';

  @override
  String get categoryGroceryDescription =>
      'ของใช้ประจำวัน สินค้าบาร์โค้ด และของชำ';

  @override
  String get categoryIceName => 'ร้านน้ำแข็ง';

  @override
  String get categoryIceDescription => 'น้ำแข็งถุง หน่วยส่ง และราคาขายส่ง';

  @override
  String get categoryOtherName => 'อื่น ๆ';

  @override
  String get categoryOtherDescription =>
      'เริ่มจากร้านเปล่า แล้วปรับให้เข้ากับธุรกิจของคุณ';

  @override
  String get templateCoffeeStarterName => 'ร้านกาแฟ (เริ่มต้น)';

  @override
  String get templateCoffeeStarterDescription =>
      'เมนูยอดนิยมพร้อมใช้งาน\nกาแฟร้อน\nกาแฟเย็น\nชา\nเครื่องดื่ม';

  @override
  String get templateRestaurantThaiName => 'ร้านอาหารไทย (เริ่มต้น)';

  @override
  String get templateRestaurantThaiDescription =>
      'เมนูข้าวและเมนูเส้นยอดนิยมสำหรับร้านอาหารตามสั่ง';

  @override
  String get templateFruitDailyName => 'ร้านผลไม้ (เริ่มต้น)';

  @override
  String get templateFruitDailyDescription =>
      'ผลไม้ขายดีพร้อมหน่วยนับแบบกิโลกรัม ชิ้น และหวี';

  @override
  String get templateStreetFoodFastName => 'อาหารตามสั่งขายเร็ว';

  @override
  String get templateStreetFoodFastDescription =>
      'เมนูขนาดเล็กสำหรับรับออเดอร์เร็วและคิดเงินง่าย';

  @override
  String get templateBakeryStarterName => 'ร้านเบเกอรี่ (เริ่มต้น)';

  @override
  String get templateBakeryStarterDescription =>
      'ขนมปัง เค้ก และครัวซองต์พร้อมตั้งหน้าร้าน';

  @override
  String get templateEmptyName => 'สร้างร้านเปล่า';

  @override
  String get templateEmptyDescription =>
      'เริ่มต้นจากศูนย์\nเพิ่มสินค้าเองทั้งหมด';

  @override
  String get categoryGroupCoffee => 'กาแฟ';

  @override
  String get categoryGroupTea => 'ชา';

  @override
  String get categoryGroupBakery => 'เบเกอรี่';

  @override
  String get categoryGroupRiceMenu => 'เมนูข้าว';

  @override
  String get categoryGroupNoodles => 'เมนูเส้น';

  @override
  String get categoryGroupDrinks => 'เครื่องดื่ม';

  @override
  String get categoryGroupWholeFruit => 'ผลไม้สด';

  @override
  String get categoryGroupCutFruit => 'ผลไม้พร้อมทาน';

  @override
  String get categoryGroupJuice => 'น้ำผลไม้';

  @override
  String get categoryGroupMain => 'เมนูหลัก';

  @override
  String get categoryGroupAddOns => 'เพิ่มพิเศษ';

  @override
  String get categoryGroupBread => 'ขนมปัง';

  @override
  String get categoryGroupCake => 'เค้ก';

  @override
  String get categoryGroupPastry => 'เพสตรี';

  @override
  String get unitCup => 'แก้ว';

  @override
  String get unitPlate => 'จาน';

  @override
  String get unitKg => 'กก.';

  @override
  String get unitPiece => 'ชิ้น';

  @override
  String get unitBunch => 'หวี';

  @override
  String get unitBowl => 'ชาม';

  @override
  String get productEspresso => 'เอสเปรสโซ';

  @override
  String get productAmericano => 'อเมริกาโน';

  @override
  String get productLatte => 'ลาเต้';

  @override
  String get productMocha => 'มอคค่า';

  @override
  String get productGreenTea => 'ชาเขียว';

  @override
  String get productPadThai => 'ผัดไทย';

  @override
  String get productFriedRice => 'ข้าวผัด';

  @override
  String get productRiceMenu => 'เมนูราดข้าว';

  @override
  String get productWatermelon => 'แตงโม';

  @override
  String get productOrange => 'ส้ม';

  @override
  String get productApple => 'แอปเปิล';

  @override
  String get productBanana => 'กล้วย';

  @override
  String get productRiceBowl => 'ข้าวกล่อง';

  @override
  String get productExtraEgg => 'ไข่ดาวเพิ่ม';

  @override
  String get productMilkBread => 'ขนมปังนมสด';

  @override
  String get productButterCroissant => 'ครัวซองต์เนยสด';

  @override
  String get productChocolateCake => 'เค้กช็อกโกแลต';

  @override
  String get imageEspressoCup => 'รูปกาแฟเอสเปรสโซ';

  @override
  String get imageAmericanoCoffee => 'รูปกาแฟอเมริกาโน';

  @override
  String get imageLatteGlass => 'รูปลาเต้';

  @override
  String get imageMochaCoffee => 'รูปมอคค่า';

  @override
  String get imageGreenTea => 'รูปชาเขียว';

  @override
  String get imagePadThai => 'รูปผัดไทย';

  @override
  String get imageFriedRice => 'รูปข้าวผัด';

  @override
  String get imageRiceDish => 'รูปเมนูราดข้าว';

  @override
  String get imageWatermelon => 'รูปแตงโม';

  @override
  String get imageOrangeFruit => 'รูปส้ม';

  @override
  String get imageApple => 'รูปแอปเปิล';

  @override
  String get imageBanana => 'รูปกล้วย';

  @override
  String get imageRiceBowl => 'รูปข้าวกล่อง';

  @override
  String get imageFriedEgg => 'รูปไข่ดาว';

  @override
  String get imageMilkBread => 'รูปขนมปังนมสด';

  @override
  String get imageButterCroissant => 'รูปครัวซองต์';

  @override
  String get imageChocolateCake => 'รูปเค้กช็อกโกแลต';
}
