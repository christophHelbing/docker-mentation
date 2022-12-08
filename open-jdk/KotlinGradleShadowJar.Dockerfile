FROM openjdk:18
EXPOSE 8080:8080
RUN mkdir /app
ENV DB_URL=<FILL_IN_YOUR_DB_URL>
ENV USER=<FILL_IN_YOUR_USERNAME>
ENV PASSWORD=<FILL_IN_YOUR_PASSWORD>
COPY /application/build/libs/application-1.0-SNAPSHOT-all.jar /app/server.jar
ENTRYPOINT ["java","-jar","/app/server.jar"]