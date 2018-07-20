FROM jupyter/datascience-notebook

LABEL maintainer "MacRat <m@crat.jp>"

USER root:root
RUN apt-get update
RUN apt-get install -y fonts-ipaexfont
RUN groupadd -g 1000 jovyan && usermod -a -G jovyan jovyan

USER 1000:1000
RUN jupyter labextension install @jupyter-widgets/jupyterlab-manager
RUN pip install chainer tensorflow opencv-python tables

EXPOSE 8888
VOLUME /home/jovyan

HEALTHCHECK --interval=5m --timeout=10s CMD curl -sS -o /dev/null http://$HOSTNAME:8888/lab?health_check || exit 1

ENTRYPOINT ["start.sh", "jupyter", "lab"]
