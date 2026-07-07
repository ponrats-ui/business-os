# Cloudflare Pages

Business OS targets Cloudflare Pages for web deployment.

## Build Settings

- Framework preset: None
- Build command: `flutter build web --release`
- Build output directory: `build/web`

## Environments

- Production: deploy from `main`
- Beta: deploy from `develop` or `release/*`
- Previous releases must remain available through Cloudflare deployment history.

## Required Secrets

GitHub Actions deployment requires:

- `CLOUDFLARE_API_TOKEN`
- `CLOUDFLARE_ACCOUNT_ID`
- `CLOUDFLARE_PROJECT_NAME`

The release workflow is scaffolded but will not deploy until these secrets exist.
