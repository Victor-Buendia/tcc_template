FROM debian:buster-slim

RUN apt-get update
RUN apt-get install -y ghostscript texlive-publishers texlive-lang-portuguese texlive-latex-extra texlive-fonts-recommended make texlive-font-utils texlive-extra-utils
RUN apt-get install python3-pip -y
RUN pip3 install Pygments
RUN apt-get update && apt-get install -y latexmk

WORKDIR /home/latex
