use ~\.config\nushell\nupm\modules\numd

export def main []: nothing -> nothing {
  numd run README.md --ignore-git-check
}
