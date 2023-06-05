#!/bin/bash

# Keychain query fields.
# LABEL is the value you put for "Keychain Item Name" in Keychain.app.
LABEL="technocidal-cloud-vault"
ACCOUNT_NAME="technocidal"

/usr/bin/security find-generic-password -w -a "$ACCOUNT_NAME" -l "$LABEL"se