#!/usr/bin/env bash
envsubst < create_jdbc_elements.sh > create_jdbc_env_enriched.sh
sh $PAYARA_PATH/generate_deploy_commands.sh
sh create_jdbc_env_enriched.sh
sh $PAYARA_PATH/bin/startInForeground.sh --passwordfile=/opt/pwdfile --postbootcommandfile $POSTBOOT_COMMANDS $PAYARA_DOMAIN
