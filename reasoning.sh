curl https://api.openai.com/v1/responses \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $OPENAI_API_KEY" \
  -d '{
    "model": "o3-mini",
    "input": "How many stars in the galaxy?",
    "reasoning": {
      "effort": "high"
    }
  }'
