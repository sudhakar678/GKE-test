#!/bin/bash
  
gcloud container images describe us-central1-docker.pkg.dev/cloudside-academy/sudhakar-test/test-image:$_TAG --format 'value(image_summary.digest)' > sha

ls

cat index.html


