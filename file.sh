curl https://api.openai.com/v1/responses \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $OPENAI_API_KEY" \
  -d '{
    "model": "gpt-4.1",
    "tools": [{
      "type": "file_search",
      "vector_store_ids": ["vs_1234567890"],
      "max_num_results": 20
    }],
    "input": "What are the attributes of an ancient brown dragon?"
  }'
