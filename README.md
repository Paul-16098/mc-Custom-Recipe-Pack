# Custom Recipe Pack

<!-- numd-gen-start: open .build.features.json|transpose id val|par-each --keep-order {|el|  $"## ($el.val.name)\n($el.val.description?)\n> default enable: ($el.val.default_enable)\n\n"} | str join (char newline) -->
## Dev file
This feature is used for development purposes.
It Not included in the final build.
> default enable: false

## Wool to String
Convert wool into string.
> default enable: true

## Sophisticated Backpacks Upgrade

> default enable: true

## Raw Ores Processing
新增了原礦塊的熔爐及高爐配方
> default enable: true
<!-- numd-gen-end -->
