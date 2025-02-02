kubectl exec -it my-postgresql-1 -- psql -U postgres -c "ALTER USER springboot WITH PASSWORD 'postgres';" 


docker run -d \
    --name backend \
  -p 8080:8080 \
  -e DATABASE_URL=jdbc:postgresql://host.docker.internal:5432/urlshortenerdb \
  -e DATABASE_USERNAME=postgres \
  -e DATABASE_PASSWORD=postgres \
  -e DATABASE_DIALECT=org.hibernate.dialect.PostgreSQLDialect \
  -e FRONTEND_URL=http://localhost \
   sp3ar007/url-shortener-be:1


docker build --build-arg VITE_BACKEND_URL=https://35.184.242.16.nip.io --build-arg VITE_REACT_FRONT_END_URL=https://35.184.242.16.nip.io -t sp3ar007/url-shortener-fe:k8s2 .