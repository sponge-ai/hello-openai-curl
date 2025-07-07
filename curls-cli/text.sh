set -e
source .env

# $1 is prompt; 'who is Rihanna?'
curl https://api.openai.com/v1/responses \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $OPENAI_API_KEY" \
  -d @- << EOF 
{
    "model": "gpt-4o",
    "input": "$1"
}
EOF