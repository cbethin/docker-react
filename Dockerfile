FROM node:alpine
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx

# Added for elastic beanstalk to expose the port
EXPOSE 80

COPY --from=0 /app/build /usr/share/nginx/html
# Default nginx starts nginx for us