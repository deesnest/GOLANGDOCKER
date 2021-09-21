# The base go-image
FROM alpine:latest
FROM deepatp/golangcentos:base       # This is custom public image
RUN su -
RUN mkdir /app                               # Creates working directory in the container
COPY . /app/                                     # Copy all files from the current directory to the app directory
WORKDIR /app                                # Set working directory
#set AWS creadentials as Environment variables
ENV AWS_ACCESS_KEY_ID= ******************
ENV AWS_SECRET_ACCESS_KEY= *****************
# Bring aws-sdk to local environment
RUN  go get -u github.com/aws/aws-sdk-go
# create a build from the source code
RUN go build filename1.go
RUN go build filename2.go      #needed if you have multiple files to build on the same container
