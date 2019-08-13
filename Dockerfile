FROM continuumio/miniconda3

RUN apt-get update -y && apt-get install build-essential -y

COPY generate.sh .

ENTRYPOINT [ "/bin/bash" ]
CMD [ "./generate.sh" ]
