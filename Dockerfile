FROM continuumio/miniconda3

COPY generate.sh .

ENTRYPOINT [ "/bin/bash" ]
CMD [ "./generate.sh" ]
