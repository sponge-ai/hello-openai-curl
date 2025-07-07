# $1 is response id 'resp_123...'
# get request to resp_123; see get.sh
curl https://api.openai.com/v1/responses/$1/input_items \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $OPENAI_API_KEY"