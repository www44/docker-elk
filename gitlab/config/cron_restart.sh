#!/bin/bash
echo "Gitlab STOP $(date)"
gitlab-ctl stop
echo "Sleep 4 min $(date)"
sleep 4m
echo "Gitlab start $(date)"
gitlab-ctl start
