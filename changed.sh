#!/usr/bin/env bash

get_pkg_list() {
  pkg_list=()
  local entry pkg
  for entry in "$@"; do
    IFS=$'\n' read -d "" -ra pkg <<< "${entry//\//$'\n'}"
    if [[ ${pkg[-1]} == "PKGBUILD" ]] && [[ ${#pkg[@]} -gt 3 ]]; then
      pkg_list+=("${pkg[-2]}")
    fi
  done
}

# Run
git diff-tree --name-only --no-commit-id -r HEAD > temp
mapfile -t output < "temp"; rm -f temp

get_pkg_list "${output[@]}"

# Test
echo "${pkg_list[@]}"

