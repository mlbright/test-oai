#!/usr/bin/env bash

PROJECT_ID="proj_c08AxEFbkFitZlx9HX36vX6N"

curl https://api.openai.com/v1/models \
  -H "Authorization: Bearer $OPENAI_API_KEY" \
  -H "OpenAI-Organization: org-sCMHcfRzif25KaN14c0YHphW" \
  -H "OpenAI-Project: $PROJECT_ID"

curl "https://api.openai.com/v1/chat/completions" \
    -H "Content-Type: application/json" \
  -H "OpenAI-Project: $PROJECT_ID" \
    -H "Authorization: Bearer $OPENAI_API_KEY" \
    -d '{
        "model": "gpt-4o-mini",
        "messages": [
            {
                "role": "system",
                "content": "You are a helpful assistant."
            },
            {
                "role": "user",
                "content": "Write a haiku that explains the concept of recursion."
            }
        ]
    }'
