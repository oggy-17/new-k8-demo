FROM ubuntu:latest
MAINTAINER rananooris8@gmail.com

# Install required packages
RUN apt-get update && \
    apt-get install -y apache2 \
                       zip \
                       unzip && \
    rm -rf /var/lib/apt/lists/*

# Download and extract the zip file
ADD https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip /var/www/html/
WORKDIR /var/www/html/
RUN unzip photogenic.zip && \
    cp -rvf photogenic/* && \
    rm -rf photogenic photogenic.zip

# Expose ports
EXPOSE 80 22

# Start Apache in the foreground
CMD ["/usr/sbin/apache2", "-D", "FOREGROUND"]