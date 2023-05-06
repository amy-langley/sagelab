FROM sagemath/sagemath

ENV \
	INFOPATH=/home/sage/sage/local/share/info:: \
	LIBRARY_PATH=/home/sage/sage/local/lib \
	SAGE_ORIG_PATH_SET=True \
	PATH=/home/sage/sage/src/bin:/home/sage/sage/build/bin:/home/sage/sage/local/var/lib/sage/venv-python3.10.5/bin:/home/sage/sage/local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin \
	SAGE_ORIG_PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin \
	CPATH=/home/sage/sage/local/include \
	SAGE_VENV=/home/sage/sage/local/var/lib/sage/venv-python3.10.5 \
	IPYTHONDIR=/home/sage/.sage//ipython-5.0.0 \
	PYTHON_EGG_CACHE=/home/sage/.sage//.python-eggs \
	PYTHONUSERBASE=/home/sage/.sage//local \
	SAGE_ENV_SOURCED=6:/home/sage/sage/local:/home/sage/sage/local/var/lib/sage/venv-python3.10.5:

RUN pip install jupyterlab numpy pandas qiskit matplotlib pylatexenc
RUN sudo sed -i "s/-n jupyter/-n jupyterlab/g" /usr/local/bin/sage-entrypoint

#ENTRYPOINT ["/usr/local/bin/sage-entrypoint"]
EXPOSE 8888
CMD ["bash"]
