import 'package:flutter/material.dart';

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
    final templates = _catalog.templatesFor(_selectedCategory.id);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Business OS'),
        actions: [
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.groups_2_outlined),
            label: const Text('Workforce'),
          ),
          const SizedBox(width: 12),
        ],
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isWide = constraints.maxWidth >= 920;
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
              padding: const EdgeInsets.all(24),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1180),
                  child: isWide
                      ? Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(child: content[0]),
                            const SizedBox(width: 16),
                            Expanded(child: content[1]),
                            const SizedBox(width: 16),
                            Expanded(child: content[2]),
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
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _StepShell extends StatelessWidget {
  const _StepShell({
    required this.step,
    required this.title,
    required this.child,
  });

  final String step;
  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(step, style: Theme.of(context).textTheme.labelLarge),
            const SizedBox(height: 4),
            Text(title, style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 16),
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
    return _StepShell(
      step: 'Step 1',
      title: 'Choose Business Category',
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: [
          for (final category in categories)
            ChoiceChip(
              avatar: Icon(category.icon, size: 18),
              label: Text(category.name),
              selected: category.id == selectedCategory.id,
              onSelected: (_) => onSelected(category),
            ),
        ],
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
    return _StepShell(
      step: 'Step 2',
      title: 'Choose Template',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(category.description),
          const SizedBox(height: 12),
          for (final template in templates) ...[
            _TemplateTile(
              template: template,
              selected: template.id == selectedTemplate.id,
              onTap: () => onSelected(template),
            ),
            const SizedBox(height: 8),
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

    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: onTap,
      child: Ink(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: selected ? colors.primary : const Color(0xffdbe5e2),
            width: selected ? 2 : 1,
          ),
          color: selected
              ? colors.primaryContainer.withValues(alpha: 0.35)
              : null,
        ),
        child: Row(
          children: [
            Icon(
              template.products.isEmpty
                  ? Icons.add_box_outlined
                  : Icons.inventory_2_outlined,
              color: colors.primary,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    template.name,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 4),
                  Text(template.description),
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
    final productCount = template.products.length;
    final averageProfit = productCount == 0
        ? 0
        : template.products
                  .map((product) => product.profit)
                  .reduce((left, right) => left + right) ~/
              productCount;

    return _StepShell(
      step: 'Step 3',
      title: 'Create Ready Store',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          FilledButton.icon(
            onPressed: onCreatePreview,
            icon: const Icon(Icons.auto_awesome_motion),
            label: const Text('Create Store Preview'),
          ),
          const SizedBox(height: 16),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            child: previewCreated
                ? Column(
                    key: const ValueKey('preview'),
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text('Ready to sell'),
                      const SizedBox(height: 12),
                      MetricCard(
                        label: 'Categories',
                        value: '${template.categories.length}',
                        icon: Icons.category_outlined,
                      ),
                      const SizedBox(height: 8),
                      MetricCard(
                        label: 'Products',
                        value: '$productCount',
                        icon: Icons.shopping_bag_outlined,
                      ),
                      const SizedBox(height: 8),
                      MetricCard(
                        label: 'Average Profit',
                        value: 'THB $averageProfit',
                        icon: Icons.trending_up,
                      ),
                      const SizedBox(height: 16),
                      _ProductSeedList(products: template.products),
                    ],
                  )
                : const Text(
                    'Business OS will create categories, products, prices, units, stock seeds, image keywords, and a starter dashboard.',
                    key: ValueKey('placeholder'),
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
    if (products.isEmpty) {
      return const Text(
        'Empty store selected. Add products from Product Management.',
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Seed Products', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 8),
        for (final product in products)
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: CircleAvatar(
              child: Text(product.name.characters.first.toUpperCase()),
            ),
            title: Text(product.name),
            subtitle: Text(
              '${product.category} / ${product.unit} / ${product.imageKeyword}',
            ),
            trailing: Text('THB ${product.price}'),
          ),
      ],
    );
  }
}
