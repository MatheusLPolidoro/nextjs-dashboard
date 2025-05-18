#!/bin/bash

ENVIRONMENT="production"  # ou "preview" ou "development"

while IFS= read -r line; do
  # Ignorar comentários e linhas em branco
  [[ "$line" =~ ^#.*$ || -z "$line" ]] && continue

  VAR_NAME=$(echo "$line" | cut -d '=' -f1)
  VAR_VALUE=$(echo "$line" | cut -d '=' -f2-)

  echo "Adicionando $VAR_NAME"
  echo "$VAR_VALUE" | vercel env add "$VAR_NAME" "$ENVIRONMENT"
done < .env
