This is Frontend of the project developed with react and vite. It leverages react for UI components and vite for building the application. This uses Github Actions for CI/CD.

Note: React runs on client side on the browser, the environment values are taken during build time of vite. So, ensure that build-args are passed during build stage of docker.

# Installation

## Install packages

```
npm install package.json
```
## Start the Devlopment server
```
npm run dev
```

### The application is available in http://localhost:5173

## Build for production
```
npm run build
```

# Docker 

## Build the Docker image locally
```
docker build --build-arg VITE_BACKEND_URL=http://localhost:8080 --build-arg VITE_REACT_FRONT_END_URL=http://localhost -t sp3ar007/url-shortener-fe .
```

## Run the docker image locally
```
docker run --name frontend --network app -d -p 80:80 sp3ar007/url-shortener-fe
```