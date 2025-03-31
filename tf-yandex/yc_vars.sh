#/usr/bin/env bash

# ~/yandex-cloud/bin/
YC_TOKEN=$(yc iam create-token)
YC_CLOUD_ID=$(yc config get cloud-id)
YC_FOLDER_ID=$(yc config get folder-id)

echo $(jq --null-input \
          --arg token "$YC_TOKEN" \
          --arg cloud_id "$YC_CLOUD_ID" \
          --arg folder_id "$YC_FOLDER_ID" \
          '{"token": $token, "cloud_id": $cloud_id, "folder_id": $folder_id}')