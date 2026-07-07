# Business OS

Business OS is a Flutter 3, web-first operating system for small businesses and street food vendors. It starts with the first-launch Category Wizard and Template Engine, then grows into POS, product management, dashboard, inventory, purchasing, accounting, workforce, and marketplace modules.

## Mission

Build the easiest Business Operating System for:

- coffee shops
- fruit shops
- Thai street food vendors
- made-to-order restaurants
- grilled pork shops
- fried chicken shops
- meat shops
- vegetable shops
- grocery stores
- ice shops
- beverage shops
- dessert shops
- bakeries
- any small business that needs a simple operating system

## Technology

- Flutter 3, web first
- Material 3
- Clean Architecture
- Offline-first local data design
- Future-ready for Supabase
- Future-ready for multi-tenant businesses
- Cloudflare Pages deployment target

## Sprint 0 Scope

- Bootstrap independent project in `C:\business-os`
- Initialize feature-based architecture
- Add Category Wizard screen
- Add Template selection screen
- Generate ready-store preview with categories, products, prices, units, stock seeds, and image keywords
- Reserve Workforce module for future TimeTrack Pro migration
- Add documentation, CI, release, and Cloudflare deployment scaffolding

## Commands

```powershell
flutter analyze
flutter test
flutter build web
```

## Repository Strategy

- `main`: stable production
- `develop`: integration
- `feature/*`: sprint work
- `release/*`: release candidates

Stable and beta releases must stay isolated. Never overwrite stable deployments with beta builds.
