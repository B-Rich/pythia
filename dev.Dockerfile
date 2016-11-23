FROM thelastinuit/vim_with_ruby

RUN apk update && \
    apk add build-base gcc libc6-compat ruby-dev libffi-dev

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

ADD . /usr/src/app/

RUN bundle
