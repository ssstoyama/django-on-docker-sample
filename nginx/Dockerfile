FROM nginx:1.15.0-alpine

RUN mkdir -p /usr/src/app/static/ \
    && touch /var/run/nginx.pid \
    && chown -R nginx:nginx /var/run/nginx.pid \
    && chown -R nginx:nginx /var/cache/nginx \
    && rm /etc/nginx/conf.d/default.conf

COPY nginx.conf /etc/nginx/
COPY webapp.conf /etc/nginx/conf.d

USER nginx