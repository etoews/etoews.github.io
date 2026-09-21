# GitHub Cards (vendored)

Source: <https://github.com/lepture/github-cards> (BSD licence, see `LICENSE`).

Taken from version 1.0.5, directory `jsdelivr/`.

## Why these files are vendored

The upstream copies are not usable:

- `lab.lepture.com/github-cards/widget.js` gives a 404 error. The author moved the site.
- The jsDelivr copy of `widget.js` builds a card URL that gives a 404 error. It looks
  for the cards in `cards/`, but the cards are in `jsdelivr/cards/`.
- jsDelivr sends `.html` files with the `text/plain` content type and the
  `X-Content-Type-Options: nosniff` header. A browser shows the card source as text
  instead of a card.

Local copies also remove a third-party script that has no Subresource Integrity hash.

## Local changes

- `widget.js`: the default base path is `/js/vendor/github-cards/`, not the jsDelivr URL.
  The `gc:base` meta tag in `_layouts/default.html` sets the same path.
- `cards/default.html`: removed the Google Analytics code of the upstream author. It sent
  a page view to the property `UA-21475122-2` each time a reader opened a page.
- `cards/default.html`: added `sitemap: false` front matter. This keeps the card out of
  `sitemap.xml`, because `jekyll-sitemap` adds all static `.html` files.
- `cards/default.html`: added a `permalink` to the same front matter. The front matter
  makes Jekyll process the card as a page. Pages obey the `permalink` setting in
  `_config.yml`, which ends with `/`. Without the explicit permalink, Jekyll writes the
  card to `cards/default/index.html`, but `widget.js` asks for `cards/default.html`.

## Limit

The card reads the GitHub API from the browser of the reader, without authentication.
GitHub permits 60 requests each hour for each IP address.
