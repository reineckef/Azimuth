FROM continuumio/anaconda2

RUN apt-get update && apt-get install -y nano

RUN pip uninstall -y matplotlib \
  && python -m pip install --upgrade pip \
  && pip install scikit-learn==0.17.1 numpy==1.14.6 matplotlib

RUN git clone https://github.com/reineckef/Azimuth.git \
  && cd /Azimuth \
  && python setup.py install

RUN mkdir -p /opt/conda/lib/python2.7/site-packages/Azimuth-2.0-py2.7.egg/azimuth/data/ \
  && cp -r /Azimuth/azimuth/data/* /opt/conda/lib/python2.7/site-packages/Azimuth-2.0-py2.7.egg/azimuth/data

RUN cd /opt/conda/lib/python2.7/site-packages/Azimuth-2.0-py2.7.egg/azimuth/ \
  && python model_comparison.py

RUN echo "\nTESTING THE INSTALLATION:\n\n" && /Azimuth/azimuth/example.py
