FROM httpd:2.4
USER 1001
# Copy the HTML file to the Apache document root
COPY summary-report-generator-latest.html /usr/local/apache2/htdocs/

# Modify httpd.conf to:
# 1. Change Listen port from 80 to 8080
# 2. Change the default page to summary-report-generator-latest.html
RUN sed -i 's/Listen 80/Listen 8080/' /usr/local/apache2/conf/httpd.conf && \
    sed -i 's|DirectoryIndex index.html|DirectoryIndex summary-report-generator-latest.html|' /usr/local/apache2/conf/httpd.conf && \
    rm -f /usr/local/apache2/htdocs/index.html  # Remove the default index.html file
RUN chown -R 1001:0 /usr/local/apache2/logs
EXPOSE 8080
