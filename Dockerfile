FROM scratch
COPY marvel-girl /marvel-girl
EXPOSE 80
CMD ["/marvel-girl"]