# No cotainer
find build/static/js -type f -name "*.js" -exec sh -c 'sed -i "s|http://localhost:8080|'"$REACT_APP_BACKEND_URL"'|g" {}' \;
find build -type f -name "*.html" -exec sh -c 'sed -i "s|http://localhost:8080|'"$REACT_APP_BACKEND_URL"'|g" {}' \;

#start
pm2-runtime server.js