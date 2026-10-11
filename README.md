# Joon Suk Huh

Personal academic website, built with Jekyll and hosted on GitHub Pages.

## Local preview

With Ruby installed, run:

```sh
sh preview.sh
```

Open <http://localhost:4000>. To check the production build:

```sh
sh preview.sh build
```

No Node.js, npm, JavaScript bundle, icon fonts, or external font services are needed.
The site uses one CSS file and system fonts. Jekyll and the Markdown, sitemap, and
redirect plugins are the only build dependencies (plus WEBrick for local serving).
Core plugin versions follow [GitHub Pages](https://pages.github.com/versions/).
The script installs Bundler and all gems into `vendor/gems/`, and stores download
caches and Bundler data under `vendor/` as well. RubyGems, Bundler, and the default
XDG cache path all point there, not to the home directory. It does not install
packages globally or change shell settings. `vendor/` is ignored by Git and excluded from
the site; it can be deleted and recreated by running the script again. The first
run requires network access and native build tools for some gems.

Generated pages go to `/tmp/joon-huh-site`, outside the repository. After a reboot,
run `sh preview.sh` again to rebuild and start the server using the saved local
dependencies. GitHub Pages can use its default build destination.

## Editing

- `_pages/about.md`: biography and research interests.
- `_publications/*.md`: papers, authors, venues, and PDF links. The publication list
  groups papers by year, with the newest year first and the newest paper first
  within each year. `date` must be a valid `YYYY-MM-DD` for sorting; only the year
  is displayed on the site.
- `_config.yml`: profile, contact links, and site metadata.
- `_data/navigation.yml`: navigation links.
- `assets/css/main.css`: all layout, typography, responsive, and print styles.
- `images/profile.jpg`: profile photo.
- `files/Joon Suk Huh CV.pdf`: CV; replace it in place to preserve existing links.

Keep the existing publication filenames to preserve their individual URLs.
`/about/`, `/about.html`, `/cv/`, and `/resume` remain available.

Originally based on Academic Pages / Minimal Mistakes. The original MIT license
is retained in `LICENSE`.
