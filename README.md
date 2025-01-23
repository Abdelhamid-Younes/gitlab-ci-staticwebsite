# Static Web Application CI/CD Pipeline

## Overview

This project demonstrates a CI/CD pipeline for deploying a static web application using Docker and GitLab CI/CD. The pipeline automates building, testing, and deploying the application to various environments, including review, staging, and production. 

The application used in this project is a static website example, available at: [https://github.com/diranetafen/static-website-example.git](https://github.com/diranetafen/static-website-example.git).

---

## Project Structure

- **`.gitlab-ci.yml`**: Configuration file for GitLab CI/CD pipeline.
- **`Dockerfile`**: Dockerfile for building the static web application.

## CI/CD Pipeline

The CI/CD pipeline is defined in the `.gitlab-ci.yml` file and consists of several stages to automate the process of building, testing, and deploying the application.

### Pipeline Stages

1. **Build Image**: Builds the Docker image for the application.
2. **Test Acceptation**: Tests the built image to ensure functionality.
3. **Release Image**: Tags and pushes the Docker image to a container registry.
4. **Deploy Review**: Deploys the application to a review environment (e.g., for testing merge requests).
5. **Stop Review**: Stops the application in the review environment.
6. **Deploy Staging**: Deploys the application to the staging environment.
7. **Test Staging**: Runs tests in the staging environment to verify stability.
8. **Deploy Prod**: Deploys the application to the production environment.

### Global Variables

- **`APP_NAME`**: The name of the application.
- **`EC2_HOST_REVIEW`**: The IP address for the review environment.
- **`EC2_HOST_DEPLOY`**: Dynamically set for staging and production deployments.

---

## Getting Started

### Prerequisites

Before running the CI/CD pipeline for this project, ensure you have the following:

1. **Docker**:
   - Docker is required to build, run, and deploy the application containers.
   - Install Docker by following the instructions on the [Docker installation page](https://docs.docker.com/get-docker/).

2. **GitLab Account**:
   - A GitLab account is required to host your repository and use GitLab CI/CD.
   - Create an account at [GitLab](https://gitlab.com/users/sign_up) if you don’t already have one.

3. **SSH Access Configured for Target Servers**:
   - Add your SSH private key as a GitLab CI/CD variable.
   - Navigate to your project’s **Settings > CI/CD > Variables** and add a variable named `SSH_PRIVATE_KEY`, with the value set to the contents of your private key (`id_rsa`).

---

### Setup

1. **Fork the Repository**:
   - Clone the project repository or fork it to your GitLab account.

  ```bash
  $ git clone https://github.com/Abdelhamid-Younes/gitlab-ci-staticwebsite.git
```

2. **Set Up GitLab CI/CD**:
   - Ensure the `.gitlab-ci.yml` file is present in the root of your repository. This file defines the CI/CD pipeline configuration.

3. **Configure Environment Variables**:
   - Set the following variables in your GitLab CI/CD settings:

![](images/CI_CD_Pipeline.png)

     - **`EC2_HOST_REVIEW`**: The IP address of your review environment server.
      - **`EC2_HOST_DEPLOY`**: The IP address of your staging/production server.

![](images/CI_CD_Pipeline.png)

4. **Run the Pipeline**:
   - Push your code changes to GitLab. The CI/CD pipeline will be triggered automatically based on the `.gitlab-ci.yml` configuration.
   - Monitor the pipeline progress in the **CI/CD > Pipelines** section of your GitLab project.

---

### Results

- Here is some screenshots of the project:

    - Pipeline master branch:

![](images/CI_CD_Pipeline.png)

![](images/CI_CD_Pipeline.png)

    - Pipeline review branch:

![](images/CI_CD_Pipeline.png)

![](images/CI_CD_Pipeline.png)

    - Home page of the application:

      - From review server:

![](images/CI_CD_Pipeline.png)

        - From staging server:

![](images/CI_CD_Pipeline.png)

        - From prod server:

 ![](images/CI_CD_Pipeline.png)

## Maintainers

- **Abdelhamid YOUNES**

Feel free to reach out if you have any questions or need further assistance.
