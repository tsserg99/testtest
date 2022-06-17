#!/bin/bash

echo -e "\n- Getting token...\n"

TOKEN=$(curl -u wazuh:wazuh -k -X GET "https://localhost:55000/security/user/authenticate?raw=true")

echo -e "\n- API calls with TOKEN environment variable ...\n"

echo -e "Getting default information:\n"

curl -k -X GET "https://localhost:55000/?pretty=true" -H  "Authorization: Bearer $TOKEN"

echo -e "\n\nGetting /agents/summary/os:\n"

curl -k -X GET "https://localhost:55000/agents/summary/status?pretty=true" -H  "Authorization: Bearer $TOKEN"

echo -e "\n\nEnd of the script.\n"
