FROM httpd:2.4
COPY summary-report-generator-v2.html /usr/local/apache2/htdocs/
RUN sed -i 's/Listen 80/Listen 8080/' /usr/local/apache2/conf/httpd.conf
EXPOSE 8080
