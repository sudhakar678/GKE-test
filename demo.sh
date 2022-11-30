#!/bin/bash
  
IMAGE_PATH="us-central1-docker.pkg.dev/cloudside-academy/sudhakar-test/test-image:$GITHUB_SHA"
IMAGE_TO_ATTEST=${IMAGE_PATH}

gcloud container binauthz create-signature-payload \
--artifact-url=${IMAGE_TO_ATTEST} > ./generated_payload.json

openssl dgst -sha256 -sign ./ec_private.pem ./generated_payload.json > ./ec_signature

gcloud container binauthz attestations create \
    --project="${PROJECT_ID}" \
    --artifact-url="${IMAGE_TO_ATTEST}" \
    --attestor="projects/${PROJECT_ID}/attestors/${ATTESTOR_NAME}" \
    --signature-file=/tmp/ec_signature \
    --public-key-id="ec_public.pem" \
    --validate
