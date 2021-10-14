FROM alpine:3.13 as builder
WORKDIR /app
RUN apk add wget tar \
    && wget https://github.com/medcl/esm/releases/download/v0.5.0/linux64.tar.gz \
    && tar xzfo linux64.tar.gz

FROM gcr.io/distroless/base
COPY --from=builder /app/bin/linux64/esm /esm
