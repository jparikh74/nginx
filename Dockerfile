FROM java:8

# define vars that was passed at build-time to the builder with the docker build command using the --build-arg
ARG STRIPE_KEY

# set the environment vars
ENV STRIPE_KEY=$STRIPE_KEY

COPY HelloWorld.java .
RUN javac HelloWorld.java
CMD ["java", "HelloWorld"]
