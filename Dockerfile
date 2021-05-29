FROM schoolofdevops/maven

MAINTAINER mohamedmohsen20136412@gmail.com

WORKDIR /app

COPY . /app/
RUN mv /app/* /app/x.jar

EXPOSE 8080

ENTRYPOINT [ "java" , "-jar" , "/app/x.jar" ]