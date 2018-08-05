tmp=$(mktemp)

docker run --rm -it jupyter/datascience-notebook python -c 'print(__import__("IPython").lib.passwd())' | tee "${tmp}" && echo JUPYTERLAB_PASSWORD=`tail -n 1 "${tmp}"` > .env

rm "${tmp}"
