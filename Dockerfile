FROM ubuntu:20.04 as builder

RUN apt update && apt install -y gcc make

WORKDIR /pico
COPY . .
RUN make


FROM ubuntu:20.04

WORKDIR /pico
COPY --from=builder /pico/server .
EXPOSE 80
CMD [ "./server", "80" ]
