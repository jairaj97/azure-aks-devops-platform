# Azure AKS DevOps Platform

## Why I started this project

I have been working around DevOps for a couple of years, but I had not spent enough time using these tools hands-on or troubleshooting real issues. I started this project to practise what I know, make mistakes, solve them, and understand how the different tools work together.

## What I have completed

So far, I have:

- Set up a small .NET 8 API with health, readiness, and information endpoints.
- Built and ran the application locally.
- Written a multi-stage Dockerfile using Ubuntu-based .NET images.
- Built and tagged Docker images.
- Started and tested containers.
- Configured the container to run as a non-root user.
- Added `.dockerignore`, `.gitignore`, and `.gitattributes` files.
- Created a feature branch and opened the first pull request on GitHub.

## What I learned

I learned the differences between a Dockerfile, image, and container. I also learned how the Docker client communicates with the Docker daemon and how Docker Engine manages images and containers.

Through practice, I became more comfortable with build contexts, image tags, port mappings, environment variables, container logs, and inspection commands. I also compared containers with virtual machines and understood why containers are useful for packaging and deploying applications consistently.

## How to build and run it

The application code is intentionally small because the main focus of this project is the DevOps workflow.

Run the application locally:

```powershell
cd app/DevOpsDemoApi
dotnet run
```

Build the Docker image from the repository root:

```powershell
docker build -t devops-demo-api:1.2 .
```

Run the container:

```powershell
docker run --rm --name devops-demo `
  -p 127.0.0.1:8080:8080 `
  devops-demo-api:1.2
```

The API is available at `http://localhost:8080`.

## Problems I faced

While writing the Dockerfile, I initially used incomplete `COPY` instructions and incorrect source paths. I also learned that `docker build` requires a build context, which is why the final `.` is important.

While starting the container, I missed the `run` command and used some flags incorrectly. Reading the error messages helped me identify and fix these problems. I also encountered Git line-ending warnings and added `.gitattributes` to keep line endings consistent.

## Next steps

- Push the Docker image to a container registry.
- Deploy the application to a local Kubernetes cluster.
- Add Kubernetes configuration, probes, secrets, and resource limits.
- Create Azure infrastructure using Terraform.
- Add CI/CD validation and deployment pipelines.