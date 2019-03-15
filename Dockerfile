FROM scratch
EXPOSE 8080
ENTRYPOINT ["/jx-golang"]
COPY ./bin/ /