from openai import OpenAI
import json

client = OpenAI()

with open ("../pdfs/c.pdf", "rb") as f:
    upload_response = client.files.create(
        file = f,
        purpose = "user_data"
    )

file_id = upload_response.id

response = client.responses.create(
    model = "gpt-4o",
    input = [
        {
            "role": "user",
            "content": [
                { "type": "input_text", "text": "write tears in rain monologue based on this" },
                { "type": "input_file", "file_id": file_id }
            ]
        }
    ]
)

print(response)