prompt=$1
effort=${2:=low}

curl https://api.openai.com/v1/responses \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $OPENAI_API_KEY" \
  -d @- << EOF 
  {
    "model": "o3-mini",
    "input": "$prompt",
    "reasoning": {
      "effort": "$effort"
    }
  }
EOF