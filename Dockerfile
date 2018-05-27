FROM jupyter/datascience-notebook

USER root:root
RUN sudo apt-get update
RUN sudo apt-get install -y fonts-ipaexfont

USER jovyan:jovyan
RUN jupyter labextension install @jupyter-widgets/jupyterlab-manager
RUN pip install chainer tensorflow opencv-python tables

EXPOSE 8888
VOLUME /home/jovyan

ENTRYPOINT ["start.sh", "jupyter", "lab"]
