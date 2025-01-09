# Step 5: Process and System Monitoring

## Overview
In this step, we monitor system processes and resource usage on the CentOS systemusing various commands like `top`, `ps`. We also scheduled a cron job to
generate system resource reports periodically.

## Monitoring Running Processes
To monitor system processes, I used the following commands:

### 1. **top**:
The `top` command provides a dynamic view of the system's resource usage. It shows CPU, memory usage, and running processes.

top -n 1 --> limits iterations to only one iteration
### 2. ps:
The ps command shows a snapshot of current processes. It can be used with aux to display detailed information about all running processes.

ps aux

##Schedule Priodic Report:


I wrote a script that generates a system resource report. The script collects CPU, memory, disk usage, and network statistics. This script is scheduled to run periodically using cron.
You can find the script in scripts dir


#Cron Job Setup

To schedule the report to run every hour, I added the following cron job:
0 * * * * /root/rhcsa-practice/resource_report.sh

This will run the script every hour, collecting and saving the system resource usage data to /root/rhcsa-practice/logs/resource_report.txt


