prompt=$1

curl https://api.openai.com/v1/responses \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $OPENAI_API_KEY" \
  -d @- << EOF 
  {
    "model": "gpt-4.1",
    "tools": [{ "type": "web_search_preview" }],
    "input": "$prompt"
  }
EOF