# cURL Recipes

* GET
```bash
    curl http://localhost:4000/posts
```

* POST with json
```bash
    curl -X POST -H "Content-Type: application/json" -d '{"title": "A title"}' http://localhost:4000/posts
```

