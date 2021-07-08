# cURL Recipes

* GET
```bash
    curl http://localhost:4000/posts
```

* POST with json
```bash
    curl -X POST -H "Content-Type: application/json" -d '{"title": "A title"}' http://localhost:4000/posts
```

* Silence the progress bar
```bash
    curl -s http://localhost:4000/
```

* Pretty Print Json
```bash
    curl -s http://localhost:4000/posts | json_pp
```

* Follow Redirects with -L
```bash
    curl -L -O https://golang.org/dl/go1.16.2.linux-amd64.tar.gz
```

