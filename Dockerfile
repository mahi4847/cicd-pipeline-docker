FROM node:carbon
WORKDIR /usr/src/app
COPY package#.json ./
RUN npm install
#copy code from system to image
COPY . .
#Expose port in container
Expose 8080
CMD ["npm","start"]
