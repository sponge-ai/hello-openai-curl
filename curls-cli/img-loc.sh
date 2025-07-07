img_path=$1
prompt=$2

file_id=$(
    curl https://api.openai.com/v1/files \
        -H "Authorization: Bearer $OPENAI_API_KEY" \
        -F purpose="vision" \
        -F file="@$img_path" \
    | jq -r '.id'
)

curl https://api.openai.com/v1/responses \
    -H "Content-Type: application/json" \
    -H "Authorization: Bearer $OPENAI_API_KEY" \
    -d @- << EOF 
    {
        "model": "gpt-4o",
        "input": [
            {
                "role": "user",
                "content": [
                    { "type": "input_image", "file_id": "$file_id" }
                ]
            }
        ]
    }
EOF