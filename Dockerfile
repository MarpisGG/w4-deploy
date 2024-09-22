FROM node:20 AS base

### <JANGAN DIGANTI>
ARG STUDENT_NAME
ARG STUDENT_NIM

ENV NUXT_STUDENT_NAME ${STUDENT_NAME}
ENV NUXT_STUDENT_NIM ${STUDENT_NIM}
### </JANGAN DIGANTI>

# TODO: code disini
WORKDIR /app

COPY package.json pnp-lock.yaml ./

RUN npm install -g pnpm

RUN pnpm install

COPY . .

RUN pnpm run build

EXPOSE 3000

CMD ["pnpm", "start"]
