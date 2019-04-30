FROM jupyter/datascience-notebook

LABEL maintainer "MacRat <m@crat.jp>"

USER root:root
RUN apt-get update
RUN apt-get install -y fonts-ipaexfont
RUN groupadd -g 1000 jovyan && usermod -a -G jovyan jovyan
RUN mkdir /work && chown jovyan:jovyan /work

USER 1000:1000
RUN rmdir /home/jovyan/work && ln -s /work /home/jovyan/work
RUN jupyter labextension install @jupyter-widgets/jupyterlab-manager
RUN pip install chainer tensorflow keras opencv-python tables japanmap pyfpgrowth

EXPOSE 8888
VOLUME /work

HEALTHCHECK --interval=5m --timeout=10s CMD curl -sS -o /dev/null http://$HOSTNAME:8888/lab?health_check || exit 1

ENTRYPOINT ["start.sh", "jupyter", "lab", "--NotebookApp.notebook_dir=/work"]
