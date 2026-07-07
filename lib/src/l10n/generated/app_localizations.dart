import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_th.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('th'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In th, this message translates to:
  /// **'Business OS'**
  String get appTitle;

  /// No description provided for @appSubtitle.
  ///
  /// In th, this message translates to:
  /// **'ระบบบริหารร้านค้าอัจฉริยะ'**
  String get appSubtitle;

  /// No description provided for @welcomeTagline.
  ///
  /// In th, this message translates to:
  /// **'เปิดร้านได้ภายใน 5 นาที'**
  String get welcomeTagline;

  /// No description provided for @workforce.
  ///
  /// In th, this message translates to:
  /// **'ทีมงาน'**
  String get workforce;

  /// No description provided for @step1.
  ///
  /// In th, this message translates to:
  /// **'ขั้นตอนที่ 1'**
  String get step1;

  /// No description provided for @step2.
  ///
  /// In th, this message translates to:
  /// **'ขั้นตอนที่ 2'**
  String get step2;

  /// No description provided for @step3.
  ///
  /// In th, this message translates to:
  /// **'ขั้นตอนที่ 3'**
  String get step3;

  /// No description provided for @chooseBusinessCategory.
  ///
  /// In th, this message translates to:
  /// **'เลือกประเภทร้าน'**
  String get chooseBusinessCategory;

  /// No description provided for @chooseTemplate.
  ///
  /// In th, this message translates to:
  /// **'เลือกเทมเพลตร้าน'**
  String get chooseTemplate;

  /// No description provided for @createReadyStore.
  ///
  /// In th, this message translates to:
  /// **'สร้างร้านพร้อมใช้งาน'**
  String get createReadyStore;

  /// No description provided for @createStorePreview.
  ///
  /// In th, this message translates to:
  /// **'สร้างตัวอย่างร้าน'**
  String get createStorePreview;

  /// No description provided for @readyToSell.
  ///
  /// In th, this message translates to:
  /// **'พร้อมขาย'**
  String get readyToSell;

  /// No description provided for @categoriesMetric.
  ///
  /// In th, this message translates to:
  /// **'หมวดหมู่'**
  String get categoriesMetric;

  /// No description provided for @productsMetric.
  ///
  /// In th, this message translates to:
  /// **'สินค้า'**
  String get productsMetric;

  /// No description provided for @averageProfitMetric.
  ///
  /// In th, this message translates to:
  /// **'กำไรเฉลี่ย'**
  String get averageProfitMetric;

  /// No description provided for @seedProducts.
  ///
  /// In th, this message translates to:
  /// **'สินค้าตัวอย่าง'**
  String get seedProducts;

  /// No description provided for @storePreviewTitle.
  ///
  /// In th, this message translates to:
  /// **'ตัวอย่างหน้าร้าน'**
  String get storePreviewTitle;

  /// No description provided for @storePreviewSubtitle.
  ///
  /// In th, this message translates to:
  /// **'ดูสินค้าที่ระบบจะเตรียมให้ก่อนเริ่มใช้งานจริง'**
  String get storePreviewSubtitle;

  /// No description provided for @emptyStorePreview.
  ///
  /// In th, this message translates to:
  /// **'เลือกสร้างร้านเปล่า แล้วเพิ่มสินค้าเองในเมนูจัดการสินค้า'**
  String get emptyStorePreview;

  /// No description provided for @previewPlaceholder.
  ///
  /// In th, this message translates to:
  /// **'ระบบจะเตรียมหมวดหมู่ สินค้า ราคา หน่วยนับ สต็อกตั้งต้น คำค้นรูปสินค้า และแดชบอร์ดเริ่มต้นให้'**
  String get previewPlaceholder;

  /// No description provided for @thbAmount.
  ///
  /// In th, this message translates to:
  /// **'฿{amount}'**
  String thbAmount(int amount);

  /// No description provided for @countValue.
  ///
  /// In th, this message translates to:
  /// **'{count}'**
  String countValue(int count);

  /// No description provided for @productDetail.
  ///
  /// In th, this message translates to:
  /// **'{category} / {unit} / {imageKeyword}'**
  String productDetail(Object category, Object unit, Object imageKeyword);

  /// No description provided for @categoryCoffeeName.
  ///
  /// In th, this message translates to:
  /// **'ร้านกาแฟ'**
  String get categoryCoffeeName;

  /// No description provided for @categoryCoffeeDescription.
  ///
  /// In th, this message translates to:
  /// **'กาแฟร้อน กาแฟเย็น ชา และเครื่องดื่มพร้อมขาย'**
  String get categoryCoffeeDescription;

  /// No description provided for @categoryRestaurantName.
  ///
  /// In th, this message translates to:
  /// **'ร้านอาหาร'**
  String get categoryRestaurantName;

  /// No description provided for @categoryRestaurantDescription.
  ///
  /// In th, this message translates to:
  /// **'เมนูข้าว เมนูเส้น และอาหารตามสั่ง'**
  String get categoryRestaurantDescription;

  /// No description provided for @categoryStreetFoodName.
  ///
  /// In th, this message translates to:
  /// **'ร้านอาหารตามสั่ง'**
  String get categoryStreetFoodName;

  /// No description provided for @categoryStreetFoodDescription.
  ///
  /// In th, this message translates to:
  /// **'เมนูขายเร็ว เพิ่มท็อปปิง รับเงินสดและ QR ได้ง่าย'**
  String get categoryStreetFoodDescription;

  /// No description provided for @categoryFruitName.
  ///
  /// In th, this message translates to:
  /// **'ร้านผลไม้'**
  String get categoryFruitName;

  /// No description provided for @categoryFruitDescription.
  ///
  /// In th, this message translates to:
  /// **'ผลไม้สด ผลไม้แพ็ก และเมนูน้ำผลไม้'**
  String get categoryFruitDescription;

  /// No description provided for @categoryMeatName.
  ///
  /// In th, this message translates to:
  /// **'ร้านขายเนื้อ'**
  String get categoryMeatName;

  /// No description provided for @categoryMeatDescription.
  ///
  /// In th, this message translates to:
  /// **'สินค้าแบบชั่งน้ำหนัก ตัดแต่ง และสต็อกแช่เย็น'**
  String get categoryMeatDescription;

  /// No description provided for @categoryVegetableName.
  ///
  /// In th, this message translates to:
  /// **'ร้านขายผัก'**
  String get categoryVegetableName;

  /// No description provided for @categoryVegetableDescription.
  ///
  /// In th, this message translates to:
  /// **'ผักสดแบบกำ มัด แพ็ก หรือกิโลกรัม'**
  String get categoryVegetableDescription;

  /// No description provided for @categoryGrilledPorkName.
  ///
  /// In th, this message translates to:
  /// **'ร้านหมูปิ้ง'**
  String get categoryGrilledPorkName;

  /// No description provided for @categoryGrilledPorkDescription.
  ///
  /// In th, this message translates to:
  /// **'หมูปิ้ง ข้าวเหนียว และชุดอาหารเช้าขายเร็ว'**
  String get categoryGrilledPorkDescription;

  /// No description provided for @categoryFriedChickenName.
  ///
  /// In th, this message translates to:
  /// **'ร้านไก่ทอด'**
  String get categoryFriedChickenName;

  /// No description provided for @categoryFriedChickenDescription.
  ///
  /// In th, this message translates to:
  /// **'ไก่ทอดเป็นชิ้น เป็นชุด และซอสเสริม'**
  String get categoryFriedChickenDescription;

  /// No description provided for @categoryMilkTeaName.
  ///
  /// In th, this message translates to:
  /// **'ร้านชาและเครื่องดื่ม'**
  String get categoryMilkTeaName;

  /// No description provided for @categoryMilkTeaDescription.
  ///
  /// In th, this message translates to:
  /// **'ชา นม ไข่มุก ท็อปปิง และระดับความหวาน'**
  String get categoryMilkTeaDescription;

  /// No description provided for @categoryDessertName.
  ///
  /// In th, this message translates to:
  /// **'ร้านขนมหวาน'**
  String get categoryDessertName;

  /// No description provided for @categoryDessertDescription.
  ///
  /// In th, this message translates to:
  /// **'ขนมถ้วย ขนมไทย ของหวานเย็น และท็อปปิง'**
  String get categoryDessertDescription;

  /// No description provided for @categoryBakeryName.
  ///
  /// In th, this message translates to:
  /// **'ร้านเบเกอรี่'**
  String get categoryBakeryName;

  /// No description provided for @categoryBakeryDescription.
  ///
  /// In th, this message translates to:
  /// **'ขนมปัง เค้ก ครัวซองต์ และรอบอบประจำวัน'**
  String get categoryBakeryDescription;

  /// No description provided for @categoryGroceryName.
  ///
  /// In th, this message translates to:
  /// **'ร้านโชห่วย'**
  String get categoryGroceryName;

  /// No description provided for @categoryGroceryDescription.
  ///
  /// In th, this message translates to:
  /// **'ของใช้ประจำวัน สินค้าบาร์โค้ด และของชำ'**
  String get categoryGroceryDescription;

  /// No description provided for @categoryIceName.
  ///
  /// In th, this message translates to:
  /// **'ร้านน้ำแข็ง'**
  String get categoryIceName;

  /// No description provided for @categoryIceDescription.
  ///
  /// In th, this message translates to:
  /// **'น้ำแข็งถุง หน่วยส่ง และราคาขายส่ง'**
  String get categoryIceDescription;

  /// No description provided for @categoryOtherName.
  ///
  /// In th, this message translates to:
  /// **'อื่น ๆ'**
  String get categoryOtherName;

  /// No description provided for @categoryOtherDescription.
  ///
  /// In th, this message translates to:
  /// **'เริ่มจากร้านเปล่า แล้วปรับให้เข้ากับธุรกิจของคุณ'**
  String get categoryOtherDescription;

  /// No description provided for @templateCoffeeStarterName.
  ///
  /// In th, this message translates to:
  /// **'ร้านกาแฟ (เริ่มต้น)'**
  String get templateCoffeeStarterName;

  /// No description provided for @templateCoffeeStarterDescription.
  ///
  /// In th, this message translates to:
  /// **'เมนูยอดนิยมพร้อมใช้งาน\nกาแฟร้อน\nกาแฟเย็น\nชา\nเครื่องดื่ม'**
  String get templateCoffeeStarterDescription;

  /// No description provided for @templateRestaurantThaiName.
  ///
  /// In th, this message translates to:
  /// **'ร้านอาหารไทย (เริ่มต้น)'**
  String get templateRestaurantThaiName;

  /// No description provided for @templateRestaurantThaiDescription.
  ///
  /// In th, this message translates to:
  /// **'เมนูข้าวและเมนูเส้นยอดนิยมสำหรับร้านอาหารตามสั่ง'**
  String get templateRestaurantThaiDescription;

  /// No description provided for @templateFruitDailyName.
  ///
  /// In th, this message translates to:
  /// **'ร้านผลไม้ (เริ่มต้น)'**
  String get templateFruitDailyName;

  /// No description provided for @templateFruitDailyDescription.
  ///
  /// In th, this message translates to:
  /// **'ผลไม้ขายดีพร้อมหน่วยนับแบบกิโลกรัม ชิ้น และหวี'**
  String get templateFruitDailyDescription;

  /// No description provided for @templateStreetFoodFastName.
  ///
  /// In th, this message translates to:
  /// **'อาหารตามสั่งขายเร็ว'**
  String get templateStreetFoodFastName;

  /// No description provided for @templateStreetFoodFastDescription.
  ///
  /// In th, this message translates to:
  /// **'เมนูขนาดเล็กสำหรับรับออเดอร์เร็วและคิดเงินง่าย'**
  String get templateStreetFoodFastDescription;

  /// No description provided for @templateBakeryStarterName.
  ///
  /// In th, this message translates to:
  /// **'ร้านเบเกอรี่ (เริ่มต้น)'**
  String get templateBakeryStarterName;

  /// No description provided for @templateBakeryStarterDescription.
  ///
  /// In th, this message translates to:
  /// **'ขนมปัง เค้ก และครัวซองต์พร้อมตั้งหน้าร้าน'**
  String get templateBakeryStarterDescription;

  /// No description provided for @templateEmptyName.
  ///
  /// In th, this message translates to:
  /// **'สร้างร้านเปล่า'**
  String get templateEmptyName;

  /// No description provided for @templateEmptyDescription.
  ///
  /// In th, this message translates to:
  /// **'เริ่มต้นจากศูนย์\nเพิ่มสินค้าเองทั้งหมด'**
  String get templateEmptyDescription;

  /// No description provided for @categoryGroupCoffee.
  ///
  /// In th, this message translates to:
  /// **'กาแฟ'**
  String get categoryGroupCoffee;

  /// No description provided for @categoryGroupTea.
  ///
  /// In th, this message translates to:
  /// **'ชา'**
  String get categoryGroupTea;

  /// No description provided for @categoryGroupBakery.
  ///
  /// In th, this message translates to:
  /// **'เบเกอรี่'**
  String get categoryGroupBakery;

  /// No description provided for @categoryGroupRiceMenu.
  ///
  /// In th, this message translates to:
  /// **'เมนูข้าว'**
  String get categoryGroupRiceMenu;

  /// No description provided for @categoryGroupNoodles.
  ///
  /// In th, this message translates to:
  /// **'เมนูเส้น'**
  String get categoryGroupNoodles;

  /// No description provided for @categoryGroupDrinks.
  ///
  /// In th, this message translates to:
  /// **'เครื่องดื่ม'**
  String get categoryGroupDrinks;

  /// No description provided for @categoryGroupWholeFruit.
  ///
  /// In th, this message translates to:
  /// **'ผลไม้สด'**
  String get categoryGroupWholeFruit;

  /// No description provided for @categoryGroupCutFruit.
  ///
  /// In th, this message translates to:
  /// **'ผลไม้พร้อมทาน'**
  String get categoryGroupCutFruit;

  /// No description provided for @categoryGroupJuice.
  ///
  /// In th, this message translates to:
  /// **'น้ำผลไม้'**
  String get categoryGroupJuice;

  /// No description provided for @categoryGroupMain.
  ///
  /// In th, this message translates to:
  /// **'เมนูหลัก'**
  String get categoryGroupMain;

  /// No description provided for @categoryGroupAddOns.
  ///
  /// In th, this message translates to:
  /// **'เพิ่มพิเศษ'**
  String get categoryGroupAddOns;

  /// No description provided for @categoryGroupBread.
  ///
  /// In th, this message translates to:
  /// **'ขนมปัง'**
  String get categoryGroupBread;

  /// No description provided for @categoryGroupCake.
  ///
  /// In th, this message translates to:
  /// **'เค้ก'**
  String get categoryGroupCake;

  /// No description provided for @categoryGroupPastry.
  ///
  /// In th, this message translates to:
  /// **'เพสตรี'**
  String get categoryGroupPastry;

  /// No description provided for @unitCup.
  ///
  /// In th, this message translates to:
  /// **'แก้ว'**
  String get unitCup;

  /// No description provided for @unitPlate.
  ///
  /// In th, this message translates to:
  /// **'จาน'**
  String get unitPlate;

  /// No description provided for @unitKg.
  ///
  /// In th, this message translates to:
  /// **'กก.'**
  String get unitKg;

  /// No description provided for @unitPiece.
  ///
  /// In th, this message translates to:
  /// **'ชิ้น'**
  String get unitPiece;

  /// No description provided for @unitBunch.
  ///
  /// In th, this message translates to:
  /// **'หวี'**
  String get unitBunch;

  /// No description provided for @unitBowl.
  ///
  /// In th, this message translates to:
  /// **'ชาม'**
  String get unitBowl;

  /// No description provided for @productEspresso.
  ///
  /// In th, this message translates to:
  /// **'เอสเปรสโซ'**
  String get productEspresso;

  /// No description provided for @productAmericano.
  ///
  /// In th, this message translates to:
  /// **'อเมริกาโน'**
  String get productAmericano;

  /// No description provided for @productLatte.
  ///
  /// In th, this message translates to:
  /// **'ลาเต้'**
  String get productLatte;

  /// No description provided for @productMocha.
  ///
  /// In th, this message translates to:
  /// **'มอคค่า'**
  String get productMocha;

  /// No description provided for @productGreenTea.
  ///
  /// In th, this message translates to:
  /// **'ชาเขียว'**
  String get productGreenTea;

  /// No description provided for @productPadThai.
  ///
  /// In th, this message translates to:
  /// **'ผัดไทย'**
  String get productPadThai;

  /// No description provided for @productFriedRice.
  ///
  /// In th, this message translates to:
  /// **'ข้าวผัด'**
  String get productFriedRice;

  /// No description provided for @productRiceMenu.
  ///
  /// In th, this message translates to:
  /// **'เมนูราดข้าว'**
  String get productRiceMenu;

  /// No description provided for @productWatermelon.
  ///
  /// In th, this message translates to:
  /// **'แตงโม'**
  String get productWatermelon;

  /// No description provided for @productOrange.
  ///
  /// In th, this message translates to:
  /// **'ส้ม'**
  String get productOrange;

  /// No description provided for @productApple.
  ///
  /// In th, this message translates to:
  /// **'แอปเปิล'**
  String get productApple;

  /// No description provided for @productBanana.
  ///
  /// In th, this message translates to:
  /// **'กล้วย'**
  String get productBanana;

  /// No description provided for @productRiceBowl.
  ///
  /// In th, this message translates to:
  /// **'ข้าวกล่อง'**
  String get productRiceBowl;

  /// No description provided for @productExtraEgg.
  ///
  /// In th, this message translates to:
  /// **'ไข่ดาวเพิ่ม'**
  String get productExtraEgg;

  /// No description provided for @productMilkBread.
  ///
  /// In th, this message translates to:
  /// **'ขนมปังนมสด'**
  String get productMilkBread;

  /// No description provided for @productButterCroissant.
  ///
  /// In th, this message translates to:
  /// **'ครัวซองต์เนยสด'**
  String get productButterCroissant;

  /// No description provided for @productChocolateCake.
  ///
  /// In th, this message translates to:
  /// **'เค้กช็อกโกแลต'**
  String get productChocolateCake;

  /// No description provided for @imageEspressoCup.
  ///
  /// In th, this message translates to:
  /// **'รูปกาแฟเอสเปรสโซ'**
  String get imageEspressoCup;

  /// No description provided for @imageAmericanoCoffee.
  ///
  /// In th, this message translates to:
  /// **'รูปกาแฟอเมริกาโน'**
  String get imageAmericanoCoffee;

  /// No description provided for @imageLatteGlass.
  ///
  /// In th, this message translates to:
  /// **'รูปลาเต้'**
  String get imageLatteGlass;

  /// No description provided for @imageMochaCoffee.
  ///
  /// In th, this message translates to:
  /// **'รูปมอคค่า'**
  String get imageMochaCoffee;

  /// No description provided for @imageGreenTea.
  ///
  /// In th, this message translates to:
  /// **'รูปชาเขียว'**
  String get imageGreenTea;

  /// No description provided for @imagePadThai.
  ///
  /// In th, this message translates to:
  /// **'รูปผัดไทย'**
  String get imagePadThai;

  /// No description provided for @imageFriedRice.
  ///
  /// In th, this message translates to:
  /// **'รูปข้าวผัด'**
  String get imageFriedRice;

  /// No description provided for @imageRiceDish.
  ///
  /// In th, this message translates to:
  /// **'รูปเมนูราดข้าว'**
  String get imageRiceDish;

  /// No description provided for @imageWatermelon.
  ///
  /// In th, this message translates to:
  /// **'รูปแตงโม'**
  String get imageWatermelon;

  /// No description provided for @imageOrangeFruit.
  ///
  /// In th, this message translates to:
  /// **'รูปส้ม'**
  String get imageOrangeFruit;

  /// No description provided for @imageApple.
  ///
  /// In th, this message translates to:
  /// **'รูปแอปเปิล'**
  String get imageApple;

  /// No description provided for @imageBanana.
  ///
  /// In th, this message translates to:
  /// **'รูปกล้วย'**
  String get imageBanana;

  /// No description provided for @imageRiceBowl.
  ///
  /// In th, this message translates to:
  /// **'รูปข้าวกล่อง'**
  String get imageRiceBowl;

  /// No description provided for @imageFriedEgg.
  ///
  /// In th, this message translates to:
  /// **'รูปไข่ดาว'**
  String get imageFriedEgg;

  /// No description provided for @imageMilkBread.
  ///
  /// In th, this message translates to:
  /// **'รูปขนมปังนมสด'**
  String get imageMilkBread;

  /// No description provided for @imageButterCroissant.
  ///
  /// In th, this message translates to:
  /// **'รูปครัวซองต์'**
  String get imageButterCroissant;

  /// No description provided for @imageChocolateCake.
  ///
  /// In th, this message translates to:
  /// **'รูปเค้กช็อกโกแลต'**
  String get imageChocolateCake;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'th'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'th':
      return AppLocalizationsTh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
