FROM jupyter/datascience-notebook

COPY --chown=${NB_UID}:${NB_GID} requirements.txt /tmp/
RUN conda install --yes --file /tmp/requirements.txt && \
    conda clean --all -f -y && \
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"