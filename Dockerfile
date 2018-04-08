FROM jupyter/datascience-notebook

RUN jupyter labextension install @jupyter-widgets/jupyterlab-manager

EXPOSE 8888
VOLUME /home/jovyan

ENTRYPOINT ["start.sh", "jupyter", "lab"]
