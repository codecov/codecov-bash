FROM alpine:latest
RUN apk --update add bash curl git mercurial
WORKDIR /app
ADD codecov /codecov
CMD ["/codecov"]
