class StoreTemplate {
  const StoreTemplate({
    required this.id,
    required this.categoryId,
    required this.nameKey,
    required this.descriptionKey,
    required this.categoryKeys,
    required this.products,
  });

  final String id;
  final String categoryId;
  final String nameKey;
  final String descriptionKey;
  final List<String> categoryKeys;
  final List<ProductSeed> products;
}

class ProductSeed {
  const ProductSeed({
    required this.nameKey,
    required this.categoryKey,
    required this.unitKey,
    required this.cost,
    required this.price,
    required this.stock,
    required this.imageKeywordKey,
    required this.icon,
  });

  final String nameKey;
  final String categoryKey;
  final String unitKey;
  final int cost;
  final int price;
  final int stock;
  final String imageKeywordKey;
  final String icon;

  int get profit => price - cost;
}
