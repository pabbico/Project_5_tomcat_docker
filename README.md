```markdown
# Tomcat Docker Application

This project demonstrates how to containerize a simple Java web application using Apache Tomcat and Docker. It includes a basic JSP page and configuration files to build and run the application in a Docker container.

## Project Structure


Project_5_tomcat_docker/
├── Dockerfile               # Docker configuration to build Tomcat image
├── README.md                # This documentation file
├── docker-compose.yml       # Docker Compose configuration
└── webapp/                  # Web application files
    ├── WEB-INF/             # Web application configuration directory
    └── index.jsp            # Main JSP page

## Prerequisites

Before you begin, ensure you have the following installed:

- Docker ([Installation Guide](https://docs.docker.com/get-docker/))
- Docker Compose ([Installation Guide](https://docs.docker.com/compose/install/))
- Git (optional, for version control)

## Technologies Used

- Apache Tomcat 10.1
- JDK 17
- Docker
- Docker Compose
- JSP (JavaServer Pages)

## Getting Started

### 1. Clone the Repository (Optional)

```bash
git clone https://github.com/your-username/Project_5_tomcat_docker.git
cd Project_5_tomcat_docker
```

### 2. Build and Run with Docker Compose

The easiest way to run the application is using Docker Compose:

```bash
docker-compose up --build
```

This will:
1. Build the Docker image using the Dockerfile
2. Start a container named "tomcat-container"
3. Map port 8080 on your host to port 8080 in the container

### 3. Access the Application

Once the container is running, open your web browser and navigate to:

```
http://localhost:8080
```

You should see the message: "Hello from Tomcat running in Docker!"

### 4. Stopping the Application

To stop the container, press `Ctrl+C` in the terminal where it's running, or run:

```bash
docker-compose down
```

## Manual Build and Run (Alternative)

If you prefer not to use Docker Compose, you can build and run the container manually:

1. Build the Docker image:
   ```bash
   docker build -t tomcat-app .
   ```

2. Run the container:
   ```bash
   docker run -p 8080:8080 --name tomcat-container tomcat-app
   ```

## Customizing the Application

To modify the web application:

1. Edit the files in the `webapp` directory
   - `index.jsp`: Main page content
   - `WEB-INF/`: Configuration files (web.xml, etc.)

2. Rebuild the container:
   ```bash
   docker-compose up --build
   ```

## Configuration Details

### Dockerfile

The Dockerfile performs the following actions:
- Uses the official Tomcat 10.1 image with JDK 17
- Removes the default ROOT application
- Copies your custom webapp to the ROOT directory
- Exposes port 8080 for Tomcat

### docker-compose.yml

The compose file:
- Defines a service named "tomcat-app"
- Builds the image using the local Dockerfile
- Maps port 8080
- Names the container "tomcat-container"

### Web Application

The web application consists of:
- `index.jsp`: A simple JSP page that displays a greeting message
- `WEB-INF/`: Directory for web application configuration (currently empty)

## Troubleshooting

- **Port already in use**: Ensure no other services are using port 8080
  ```bash
  lsof -i :8080
  ```
  
- **Container not starting**: Check logs with:
  ```bash
  docker logs tomcat-container
  ```

- **Build errors**: Clean up and rebuild:
  ```bash
  docker-compose down
  docker rmi $(docker images -q)
  docker-compose up --build
  ```

## Clean Up

To remove all containers and images:

```bash
docker-compose down --rmi all
```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details (if applicable).

## Contributing

Contributions are welcome! Please fork the repository and submit a pull request.

## Acknowledgments

- Apache Tomcat project
- Docker community
```

This README provides comprehensive documentation for your project, including:
- Project structure and technologies
- Setup and usage instructions
- Configuration details
- Troubleshooting tips
- Cleanup and contribution guidelines

You can customize it further by adding:
- A LICENSE file if needed
- Screenshots of the application
- More detailed contribution guidelines
- CI/CD pipeline information if implemented
