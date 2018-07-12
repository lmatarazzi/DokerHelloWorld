FROM java
LABEL maintainer="l.matarazzi@reply.eu"
COPY /src/Hello.java /home/Hello.java
RUN javac /home/Hello.java
CMD ["java","/home/Hello"] 
