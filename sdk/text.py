from openai import OpenAI

client = OpenAI()

response = client.responses.create(
    model="gpt-4o",
    input="who starred in blade runner 2049?"
)

print(response.model_dump_json(indent = 4))