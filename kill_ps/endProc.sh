#!/bin/bash

ls -l /proc/[0-9]*/fd/* |grep /dev/ttyS0
