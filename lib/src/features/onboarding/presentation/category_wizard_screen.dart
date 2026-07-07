import 'package:flutter/material.dart';

import '../../../l10n/generated/app_localizations.dart';
import '../../../l10n/localization_lookup.dart';
import '../../../shared/widgets/metric_card.dart';
import '../data/template_catalog.dart';
import '../domain/business_category.dart';
import '../domain/store_template.dart';

class CategoryWizardScreen extends StatefulWidget {
  const CategoryWizardScreen({super.key});

  @override
  State<CategoryWizardScreen> createState() => _CategoryWizardScreenState();
}

class _CategoryWizardScreenState extends State<CategoryWizardScreen> {
  final TemplateCatalog _catalog = const TemplateCatalog();
  late BusinessCategory _selectedCategory = _catalog.categories.first;
  late StoreTemplate _selectedTemplate = _catalog
      .templatesFor(_selectedCategory.id)
      .first;
  bool _previewCreated = false;

  void _selectCategory(BusinessCategory category) {
    setState(() {
      _selectedCategory = category;
      _selectedTemplate = _catalog.templatesFor(category.id).first;
      _previewCreated = false;
    });
  }

  void _selectTemplate(StoreTemplate template) {
    setState(() {
      _selectedTemplate = template;
      _previewCreated = false;
    });
  }

  void _createPreview() {
    setState(() {
      _previewCreated = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final templates = _catalog.templatesFor(_selectedCategory.id);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.appTitle),
        actions: [
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.groups_2_outlined),
            label: Text(l10n.workforce),
          ),
          const SizedBox(width: 12),
        ],
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isWide = constraints.maxWidth >= 1040;
            final content = [
              _CategoryStep(
                categories: _catalog.categories,
                selectedCategory: _selectedCategory,
                onSelected: _selectCategory,
              ),
              _TemplateStep(
                category: _selectedCategory,
                templates: templates,
                selectedTemplate: _selectedTemplate,
                onSelected: _selectTemplate,
              ),
              _StorePreviewStep(
                template: _selectedTemplate,
                previewCreated: _previewCreated,
                onCreatePreview: _createPreview,
              ),
            ];

            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: constraints.maxWidth < 640 ? 16 : 24,
                vertical: 20,
              ),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1220),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const _WelcomeHeader(),
                      const SizedBox(height: 18),
                      isWide
                          ? Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(flex: 6, child: content[0]),
                                const SizedBox(width: 16),
                                Expanded(flex: 5, child: content[1]),
                                const SizedBox(width: 16),
                                Expanded(flex: 5, child: content[2]),
                              ],
                            )
                          : Column(
                              children: [
                                content[0],
                                const SizedBox(height: 16),
                                content[1],
                                const SizedBox(height: 16),
                                content[2],
                              ],
                            ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _WelcomeHeader extends StatelessWidget {
  const _WelcomeHeader();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final colors = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: colors.primary,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(Icons.storefront, color: colors.onPrimary, size: 42),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.appTitle,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: colors.onPrimary,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  l10n.appSubtitle,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: colors.onPrimary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  l10n.welcomeTagline,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: colors.onPrimary.withValues(alpha: 0.92),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _StepShell extends StatelessWidget {
  const _StepShell({
    required this.step,
    required this.title,
    required this.icon,
    required this.child,
  });

  final String step;
  final String title;
  final IconData icon;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: colors.primary),
                const SizedBox(width: 8),
                Text(step, style: Theme.of(context).textTheme.labelLarge),
              ],
            ),
            const SizedBox(height: 6),
            Text(
              title,
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 18),
            child,
          ],
        ),
      ),
    );
  }
}

class _CategoryStep extends StatelessWidget {
  const _CategoryStep({
    required this.categories,
    required this.selectedCategory,
    required this.onSelected,
  });

  final List<BusinessCategory> categories;
  final BusinessCategory selectedCategory;
  final ValueChanged<BusinessCategory> onSelected;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return _StepShell(
      step: l10n.step1,
      title: l10n.chooseBusinessCategory,
      icon: Icons.touch_app_outlined,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final columns = constraints.maxWidth >= 560 ? 2 : 1;

          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: categories.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: columns,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: columns == 1 ? 4.2 : 2.35,
            ),
            itemBuilder: (context, index) {
              final category = categories[index];
              return _CategoryCard(
                category: category,
                selected: category.id == selectedCategory.id,
                onTap: () => onSelected(category),
              );
            },
          );
        },
      ),
    );
  }
}

class _CategoryCard extends StatelessWidget {
  const _CategoryCard({
    required this.category,
    required this.selected,
    required this.onTap,
  });

  final BusinessCategory category;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final l10n = AppLocalizations.of(context);

    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: onTap,
      child: Ink(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: selected ? colors.primaryContainer : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: selected ? colors.primary : const Color(0xffd7e2df),
            width: selected ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            Icon(category.icon, color: colors.primary, size: 30),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                l10n.textFor(category.nameKey),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TemplateStep extends StatelessWidget {
  const _TemplateStep({
    required this.category,
    required this.templates,
    required this.selectedTemplate,
    required this.onSelected,
  });

  final BusinessCategory category;
  final List<StoreTemplate> templates;
  final StoreTemplate selectedTemplate;
  final ValueChanged<StoreTemplate> onSelected;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return _StepShell(
      step: l10n.step2,
      title: l10n.chooseTemplate,
      icon: Icons.dashboard_customize_outlined,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.textFor(category.descriptionKey),
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 14),
          for (final template in templates) ...[
            _TemplateTile(
              template: template,
              selected: template.id == selectedTemplate.id,
              onTap: () => onSelected(template),
            ),
            const SizedBox(height: 10),
          ],
        ],
      ),
    );
  }
}

class _TemplateTile extends StatelessWidget {
  const _TemplateTile({
    required this.template,
    required this.selected,
    required this.onTap,
  });

  final StoreTemplate template;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final l10n = AppLocalizations.of(context);

    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: onTap,
      child: Ink(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: selected ? colors.primary : const Color(0xffdbe5e2),
            width: selected ? 2 : 1,
          ),
          color: selected
              ? colors.primaryContainer.withValues(alpha: 0.42)
              : null,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              template.products.isEmpty
                  ? Icons.add_box_outlined
                  : Icons.inventory_2_outlined,
              color: colors.primary,
              size: 30,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.textFor(template.nameKey),
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    l10n.textFor(template.descriptionKey),
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StorePreviewStep extends StatelessWidget {
  const _StorePreviewStep({
    required this.template,
    required this.previewCreated,
    required this.onCreatePreview,
  });

  final StoreTemplate template;
  final bool previewCreated;
  final VoidCallback onCreatePreview;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final productCount = template.products.length;
    final averageProfit = productCount == 0
        ? 0
        : template.products
                  .map((product) => product.profit)
                  .reduce((left, right) => left + right) ~/
              productCount;

    return _StepShell(
      step: l10n.step3,
      title: l10n.createReadyStore,
      icon: Icons.rocket_launch_outlined,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _VisualPreview(template: template),
          const SizedBox(height: 14),
          FilledButton.icon(
            onPressed: onCreatePreview,
            icon: const Icon(Icons.auto_awesome_motion),
            label: Text(l10n.createStorePreview),
          ),
          const SizedBox(height: 16),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            child: previewCreated
                ? Column(
                    key: const ValueKey('preview'),
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        l10n.readyToSell,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 12),
                      MetricCard(
                        label: l10n.categoriesMetric,
                        value: l10n.countValue(template.categoryKeys.length),
                        icon: Icons.category_outlined,
                      ),
                      const SizedBox(height: 8),
                      MetricCard(
                        label: l10n.productsMetric,
                        value: l10n.countValue(productCount),
                        icon: Icons.shopping_bag_outlined,
                      ),
                      const SizedBox(height: 8),
                      MetricCard(
                        label: l10n.averageProfitMetric,
                        value: l10n.thbAmount(averageProfit),
                        icon: Icons.trending_up,
                      ),
                      const SizedBox(height: 16),
                      _ProductSeedList(products: template.products),
                    ],
                  )
                : Text(
                    l10n.previewPlaceholder,
                    key: const ValueKey('placeholder'),
                  ),
          ),
        ],
      ),
    );
  }
}

class _VisualPreview extends StatelessWidget {
  const _VisualPreview({required this.template});

  final StoreTemplate template;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final colors = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: colors.secondaryContainer.withValues(alpha: 0.55),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.storePreviewTitle,
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 4),
          Text(l10n.storePreviewSubtitle),
          const SizedBox(height: 12),
          if (template.products.isEmpty)
            Text(l10n.emptyStorePreview)
          else
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                for (final product in template.products.take(4))
                  _PreviewProduct(product: product),
              ],
            ),
        ],
      ),
    );
  }
}

class _PreviewProduct extends StatelessWidget {
  const _PreviewProduct({required this.product});

  final ProductSeed product;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final colors = Theme.of(context).colorScheme;

    return Container(
      width: 132,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xffd7e2df)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(product.icon, style: const TextStyle(fontSize: 30)),
          const SizedBox(height: 8),
          Text(
            l10n.textFor(product.nameKey),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(
              context,
            ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 6),
          Text(
            l10n.thbAmount(product.price),
            style: TextStyle(
              color: colors.primary,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}

class _ProductSeedList extends StatelessWidget {
  const _ProductSeedList({required this.products});

  final List<ProductSeed> products;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    if (products.isEmpty) {
      return Text(l10n.emptyStorePreview);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(l10n.seedProducts, style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 8),
        for (final product in products)
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: CircleAvatar(child: Text(product.icon)),
            title: Text(l10n.textFor(product.nameKey)),
            subtitle: Text(
              l10n.productDetail(
                l10n.textFor(product.categoryKey),
                l10n.textFor(product.unitKey),
                l10n.textFor(product.imageKeywordKey),
              ),
            ),
            trailing: Text(l10n.thbAmount(product.price)),
          ),
      ],
    );
  }
}
