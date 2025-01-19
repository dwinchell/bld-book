rm export.yaml
for f in *.yaml; do cat $f >> export.yaml; echo "---" >> export.yaml; done
