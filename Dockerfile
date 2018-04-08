FROM jupyter/datascience-notebook

RUN jupyter labextension install @jupyter-widgets/jupyterlab-manager
RUN pip install chainer opencv-python

EXPOSE 8888
VOLUME /home/jovyan

ENTRYPOINT ["start.sh", "jupyter", "lab"]
