#!/bin/bash
set -euo pipefail

GERMINAL_DIR="/germinal"
SCRATCH_DIR="/scratch/Germinal/deGroot-data-dir"

# Initialise germinal data if the directory is absent or empty
if [ ! -d "$GERMINAL_DIR" ] || [ -z "$(ls -A "$GERMINAL_DIR")" ]; then
    echo "Initializing germinal data from ${SCRATCH_DIR}..."

    if [ ! -d "$SCRATCH_DIR" ]; then
        echo "ERROR: source directory '${SCRATCH_DIR}' not found." >&2
        exit 1
    fi

    mkdir -p "$GERMINAL_DIR"
    cp -r "$SCRATCH_DIR"/. "$GERMINAL_DIR"/
    echo "Germinal data initialized."
fi

exec "$@"
