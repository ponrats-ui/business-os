# Architecture

Business OS uses Clean Architecture with feature-based boundaries.

```text
lib/
  main.dart
  src/
    app/
    core/
    features/
      onboarding/
        data/
        domain/
        presentation/
    modules/
    shared/
      widgets/
    theme/
```

## Principles

- Features own their domain, data, and presentation code.
- Shared widgets stay generic and business-neutral.
- Local database contracts will live in `core` before feature repositories depend on them.
- Supabase and multi-tenant concerns remain behind repository interfaces when added.
- The `modules/workforce` boundary is reserved for future TimeTrack Pro migration.

## Phase 1 Modules

- Category Wizard
- Template Engine
- POS
- Product Management
- Dashboard
- Settings

## Future Modules

- Inventory
- Purchase
- Supplier
- CRM
- Promotion
- Accounting
- Payroll
- Attendance
- Workforce
- AI Assistant
- Marketplace
