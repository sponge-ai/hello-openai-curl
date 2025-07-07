set -x
img_path=$1
prompt=$2

# file_id=$(curl https://api.openai.com/v1/files \
#         -H "Authorization: Bearer $OPENAI_API_KEY" \
#         -F purpose="vision" \
#         -F file="@$img_path"
#     | jq '.id'
# )

file_id=$(curl https://api.openai.com/v1/files \
  -H "Authorization: Bearer $OPENAI_API_KEY" \
  -F purpose="vision" \
  -F file="@$img_path" | jq '.id')

echo $file_id
echo $prompt

# curl https://api.openai.com/v1/responses \
#     -H "Content-Type: application/json" \
#     -H "Authorization: Bearer $OPENAI_API_KEY" \
#     -d @- <<EOF
# {
#     "model":"gpt-4o",
#     "input": [
#         {
#             "role":"user",
#             "content": [
#                 { "type": "input_text", "text": "$prompt" },
#                 { "type": "input_image", "file_id": "$file_id"}
#             ]
#         }
#     ]
# }
# EOF    

cat << EOF | pbcopy
{
  "model": "gpt-4o",
  "input": [
    {
      "role": "user",
      "content": [
        { "type": "input_text", "text": "$prompt" },
        { "type": "input_image", "file_id": "$file_id" }
      ]
    }
  ]
}
EOF


curl https://api.openai.com/v1/responses \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $OPENAI_API_KEY" \
  -d @- <<EOF | jq
{
  "model": "gpt-4o",
  "input": [
    {
      "role": "user",
      "content": [
        { "type": "input_text", "text": "$prompt" },
        { "type": "input_image", "file_id": "$file_id" }
      ]
    }
  ]
}
EOF