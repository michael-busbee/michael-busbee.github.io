---
layout: post
title: "Introduction To Volatility"
date: 2025-01-15
categories: [Malware Analysis]
tags: [Malware, Memory, RAM]
---

# Introduction to Volatility

Volatility is a powerful tool for analyzing memory dump files from a system's running RAM. Since RAM doesn’t organize data into structured files, tools like Volatility can be used to parse and analyze this raw information effectively.

---

## Installation on Ubuntu

Follow these steps to install Volatility 3 on Ubuntu:

```bash
cd ~/
sudo apt install python3 python3-pip git -y
git clone --branch stable https://github.com/volatilityfoundation/volatility3
cd ~/volatility3
sudo apt install python3-venv -y
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
```

---

## Using Volatility

### Activating the Virtual Environment
If you lose the Python virtual environment session, reactivate it with:

```bash
cd ~/volatility3
source venv/bin/activate
```

---

### Calculate Hash of the Memory File
Generate the SHA-256 hash of your memory dump file:

```bash
sha256sum ~/Desktop/memdump/win10.vmem
```

---

## Information Gathering

Run the `windows.info` command to gather general system information from the memory dump:

```bash
python3 vol.py -f ~/Desktop/memdump/win10.vmem windows.info
```

- `-f`: Specifies the memory dump file location.
- `-o`: (Optional) Specifies the output file destination.
- Command Variants:
  - `windows.info`: Gathers Windows-specific information.
  - `mac.info`: Gathers macOS-specific information.
  - `linux.info`: Gathers Linux-specific information.

---

## Network Memory Analysis

### Netstat Information
Retrieve network information similar to the `netstat` command on a live system:

```bash
python3 vol.py -f ~/Desktop/memdump/win10.vmem windows.netstat
```

- Look for:
  - Suspicious services and associated IP addresses.
  - WHOIS information for IPs.
  - Suspicious port numbers.
  - Process IDs (PIDs) linked to services.

### Raw Network Objects
Use `netscan` to find raw network objects in memory, potentially revealing additional connections:

```bash
python3 vol.py -f ~/Desktop/memdump/win10.vmem windows.netscan
```

---

## Process Memory Analysis

### List Processes (`pslist`)
Retrieve a list of running processes:

```bash
python3 vol.py -f ~/Desktop/memdump/win10.vmem windows.pslist
```

**Optional Flags**:
- `--physical`: Show physical memory locations.
- `--pid <PID>`: Filter by process ID.
- `--dump`: Dumps process memory to the current folder.

Use `grep` to refine the output:
```bash
| grep <PID>
```

---

### Scan for Processes (`psscan`)
`psscan` may reveal hidden or terminated processes but takes longer to run:

```bash
python3 vol.py -f ~/Desktop/memdump/win10.vmem windows.psscan
```

---

### Process Tree (`pstree`)
Build a process tree to visualize relationships between processes:

```bash
python3 vol.py -f ~/Desktop/memdump/win10.vmem windows.pstree
```

---

### Command Line Arguments
Display command line arguments used by processes:

```bash
python3 vol.py -f ~/Desktop/memdump/win10.vmem windows.cmdline
```

---

## Registry Memory Analysis

### User Assist Registry
Analyze what programs were executed, when, and by whom:

```bash
python3 vol.py -f ~/Desktop/memdump/win10.vmem windows.registry.userassist | less
```

---

### Hive List
List all registry hives available in memory:

```bash
python3 vol.py -f ~/Desktop/memdump/win10.vmem windows.registry.hivelist
```

**Optional Flags**:
- `--filter`: Search for specific hives (e.g., user-related hives).
- `--dump`: Export a registry hive for analysis in Registry Explorer.

---

### Query Specific Registry Keys
Query specific keys from the registry:

```bash
python3 vol.py -f ~/Desktop/memdump/win10.vmem windows.registry.printkey --key "Software\Microsoft\Windows\CurrentVersion\Run"
```

This command helps identify programs set to run at startup.

---

