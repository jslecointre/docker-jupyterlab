FROM jupyter/datascience-notebook

RUN jupyter labextension install @jupyter-widgets/jupyterlab-manager
RUN pip install chainer tensorflow opencv-python

EXPOSE 8888
VOLUME /home/jovyan

ENTRYPOINT ["start.sh", "jupyter", "lab"]
