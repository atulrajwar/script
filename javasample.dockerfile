FROM java:8  
COPY . /var/www/java  
WORKDIR /var/www/java  
 
CMD ["java", "Hello"]
