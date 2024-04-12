# Use the official R base image as a parent image
FROM r-base:latest

# Install shiny package
RUN R -e "install.packages('shiny')"

# Set new workdir
WORKDIR /home/app

# Copy the app files into the Docker image
COPY src/ .

# Expose port
EXPOSE 3838

# Run the app
CMD ["R", "-e", "shiny::runApp('/home/app', host='0.0.0.0', port=3838)"]
