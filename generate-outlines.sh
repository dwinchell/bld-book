SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR" || exit 1

FILENAME="export-outlines.yaml"

rm ${FILENAME}

echo '```' >> ${FILENAME}
for f in $(ls -1 ./content/outlines/*.yaml); do echo '---' >> ${FILENAME}; cat ${f} >> ${FILENAME}; done;
for f in $(ls -1 ./content/extras/*.yaml); do echo '---' >> ${FILENAME}; cat ${f} >> ${FILENAME}; done;
echo '' >> ${FILENAME}
echo '```' >> ${FILENAME}
