use std/log

def p []: table -> table {
  reject default_enable id
}

export def main [
  --features: record = {} # Features to enable or disable
  --features-enable: list<string> = [] # What features to enable
  --features-disable: list<string> = [] # What features to disable
]: nothing -> nothing {
  mut features = $features

  for id in $features_enable {
    $features = $features | upsert $id true
  }

  for id in $features_disable {
    $features = $features | upsert $id false
  }

  let features = $features

  let build_features: table<id: string, name: string, default_enable: bool, files: list<oneof<path, glob>>, enable: bool> = open .build.features.json | items {|id value|
      {
        id: $id
        ...$value
      } | if ($features has $id) {
        upsert enable ($features | get --optional $id)
      } else {
        upsert enable $in.default_enable
      }
    }

  let enable_features = $build_features | where $it.enable

  print "enable features: " ($enable_features | p)

  let not_enable_features = $build_features | where not $it.enable

  print "not enable features: " ($not_enable_features | p)

  let 7z_exclude: list<string> = $not_enable_features | par-each --keep-order {|el|
      $el.files | par-each --keep-order {|file|
        $file
      }
    } | flatten

  log debug $"7z_exclude: ($7z_exclude)"

  $7z_exclude | save .build.exclude_list.txt --force

  try { build } catch {|err| log error $err.msg } finally { rm .build.exclude_list.txt }
}

def build [--output (-o): path = "../Custom Recipe Pack.zip"]: nothing -> nothing {
  rm $output --force
  ^7z a '-x@.build.exclude_list.txt' ($output) .
}
