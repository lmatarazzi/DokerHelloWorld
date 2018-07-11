FROM anapsix/alpine-java
LABEL maintainer="l.matarazzi@reply.eu"
COPY /src/hello.java /home/hello.java
RUN javac /home/hello.java
CMD ["java","/home/hello"] 
