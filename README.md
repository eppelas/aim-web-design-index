# aim website research

Single GitHub Pages repository for all isolated visual styles.

## Structure

- `docs/index.html` — root index page
- `docs/54/` — style 54 build (deployed as `/54/`)
- `scripts/add-style.sh` — helper to add next style folders

## Add another style

Run:

```bash
./scripts/add-style.sh <style-index> "<absolute-path-to-source-project>"
```

Example:

```bash
./scripts/add-style.sh 29 "/Users/viola/All/Yandex.Disk.localized/3 Process/8 Vibe Coding/AI Mindset Visual Research - 29 Kampong Organic Type"
```

This builds source project with Vite base `/<style-index>/` and copies build output into `docs/<style-index>/`.

## GitHub Pages recommendation

- Branch: `main`
- Source: `/docs`

Then URLs will look like:

- `/54/`
- `/29/`
- `/48/`
