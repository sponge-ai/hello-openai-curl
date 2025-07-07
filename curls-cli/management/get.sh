# $1 is response id 'resp_123...'
# get response to resp_123; see input-items.sh
curl https://api.openai.com/v1/responses/$1 \
    -H "Content-Type: application/json" \
    -H "Authorization: Bearer $OPENAI_API_KEY"