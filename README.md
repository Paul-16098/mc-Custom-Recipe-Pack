# Custom Recipe Pack

<!-- numd-gen-start: open .build.features.json|transpose id val|par-each --keep-order {|el|  $"\n## ($el.val.name)\n\n($el.val.description?)\n> default enable: ($el.val.default_enable)\n\nfiles:\n\n ($el.val.files|to md --pretty --escape-md)\n\n"} | str join (char newline) -->

## Dev file

This feature is used for development purposes.
It Not included in the final build.
> default enable: false

files:

 * \.git/
* \.build\.\*
* \.pre\-commit\-config\.yaml

## Wool to String

Convert wool into string.
> default enable: true

files:

 * data/custom\-recipe/recipe/wool\-to\-string\.json

## Sophisticated Backpacks Upgrade

> default enable: true

files:

 * data/custom\-recipe/recipe/\*\_upgrade\.json

## Raw Ores Processing

新增了原礦塊的熔爐及高爐配方
> default enable: true

files:

 * data/custom\-recipe/recipe/raw\_\*\_block\_blasting\.json
* data/custom\-recipe/recipe/raw\_\*\_block\_smelting\.json
<!-- numd-gen-end -->
