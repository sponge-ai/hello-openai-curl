curl https://api.openai.com/v1/responses \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $OPENAI_API_KEY" \
  -d @- << EOF 
  {
    "model": "gpt-4.1",
    "input": [
      {
        "role": "user",
        "content": [
          { "type": "input_text",  "text": "$1" },
          { "type": "input_image", "image_url": "$2" }
        ]
      }
    ]
  }
EOF