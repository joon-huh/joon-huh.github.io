#!/bin/sh
set -eu

case "${1:-serve}" in
  serve|build) mode=${1:-serve} ;;
  *) echo "Usage: sh preview.sh [serve|build]" >&2; exit 2 ;;
esac

site_root=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
cd "$site_root"

# Keep all installed gems, Bundler settings, and download caches in this repo.
export GEM_HOME="$site_root/vendor/gems"
export GEM_PATH="$GEM_HOME"
export GEM_SPEC_CACHE="$site_root/vendor/gem-specs"
export XDG_CACHE_HOME="$site_root/vendor/cache"
export BUNDLE_USER_HOME="$site_root/vendor/bundler"
export BUNDLE_GEMFILE="$site_root/Gemfile"
export BUNDLE_IGNORE_CONFIG=1
export BUNDLE_FROZEN=true

if [ ! -f "$GEM_HOME/specifications/bundler-2.4.22.gemspec" ]; then
  gem install bundler --version 2.4.22 --no-document --install-dir "$GEM_HOME"
fi

if ! ruby "$GEM_HOME/bin/bundle" check; then
  ruby "$GEM_HOME/bin/bundle" install
fi

if [ "$mode" = build ]; then
  exec ruby "$GEM_HOME/bin/bundle" exec jekyll build \
    --strict_front_matter --destination /tmp/joon-huh-site
fi

exec ruby "$GEM_HOME/bin/bundle" exec jekyll serve \
  --host 127.0.0.1 --port 4000 --destination /tmp/joon-huh-site
