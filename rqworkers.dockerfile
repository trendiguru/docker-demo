FROM us.gcr.io/test-paper-doll/appengine/tg_base_full:8

ENV INCLUDE_DIRECTORIES=EIGEN3_INCLUDE_DIR
ENV  DEBIAN_FRONTEND=noninteractive
ENV MONGO_HOST=mongodb_mongodb_1
ENV REDIS_URL=rediss://h:OUKfVbB+mXmHZ7sepr2twq0mJiIkYfuRzEkCL11jAbo=@tg.redis.cache.windows.net:6380

RUN pip install msgpack-python
RUN pip install --upgrade google-api-python-client
RUN pip install xmltodict
RUN pip install xlsxwriter

WORKDIR /usr/lib/python2.7/dist-packages/trendi
RUN git pull
WORKDIR /

COPY rqworker_startup.sh /

ENTRYPOINT ["/bin/bash"]
ENTRYPOINT ["./rqworker_startup.sh"]
