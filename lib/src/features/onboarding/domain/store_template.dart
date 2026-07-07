class StoreTemplate {
  const StoreTemplate({
    required this.id,
    required this.categoryId,
    required this.name,
    required this.description,
    required this.categories,
    required this.products,
  });

  final String id;
  final String categoryId;
  final String name;
  final String description;
  final List<String> categories;
  final List<ProductSeed> products;
}

class ProductSeed {
  const ProductSeed({
    required this.name,
    required this.category,
    required this.unit,
    required this.cost,
    required this.price,
    required this.stock,
    required this.imageKeyword,
  });

  final String name;
  final String category;
  final String unit;
  final int cost;
  final int price;
  final int stock;
  final String imageKeyword;

  int get profit => price - cost;
}
