curl -X DELETE https://api.openai.com/v1/responses/$1 \
    -H "Content-Type: application/json" \
    -H "Authorization: Bearer $OPENAI_API_KEY"