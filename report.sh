set -o xtrace

bend --version

cat "${1}"

bend run "${1}"