# DotNet Example-Api including Dockerization and Pipeline

## Github Actions pipeline

### Building the exampleApi image

- The `dev` image is built and pushed by a github action when pushing to the `develop` branch
- The `prod` image is built and pushed by a github action when pushing to the `main` branch
- The Images are pushed to the OVH Harbor Registry:
    - exampleapp/exampleapi:dev
    - exampleapp/exampleapi:prod

### URL

- The dev exampleApi is available here: https://exampleapi.dev.example.com/weatherforecast