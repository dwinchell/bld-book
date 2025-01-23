SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR" || exit 1

rm export.yaml

echo '```' >> export.yaml
for f in $(ls -1 ./content/*.yaml); do echo '---' >> export.yaml; cat ${f} >> export.yaml; done;
echo '' >> export.yaml
echo '```' >> export.yaml
