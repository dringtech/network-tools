#!/bin/bash
set -e

logger -t speedtest "$(speedtest --simple --secure)"
