---
layout: post
title: "Introduction To Splunk"
date: 2025-01-09
categories: [Splunk]
tags: [Splunk, SIEM]
---

## Installing Splunk on Ubuntu

```
cd ~/Downloads/
wget -O splunk-9.4.0-6b4ebe426ca6-linux-amd64.tgz "https://download.splunk.com/products/splunk/releases/9.4.0/linux/splunk-9.4.0-6b4ebe426ca6-linux-amd64.tgz"
sudo tar xvzf splunk-9.4.0-6b4ebe426ca6-linux-amd64.tgz -C /opt
cd /opt/splunk/bin/
sudo ./splunk start --accept-license
sudo ./splunk enable boot-start # Run at boot
```

Splunk then asked to create a user. I gave the same username as the ubuntu VM.

> Note: production environment it would be more secure to use unique usernames and passwords for every system.

After creating the user, I was prompted to visit `http://127.0.0.1:8000`, the loopback address on port 8000, to visit the Splunk admin page on the browser. If I were to visit Splunk from the Windows Lab machine, or another machine on this virtual network, I would need to go to `http://<Ubuntu_IP>:8000` to see the page.

![Splunk Login Page](/assets/img/posts/2025-01-09-Introduction-To-Splunk/image-1.png)

Once the page loaded I was asked to log in so I gave it the Jarnathan credentials.

## Importing Log Data to Splunk

Data files can be added to Splunk by either clicking the `Add data` button on the Home Dashboard or by clicking `Settings` > `Add Data` in the top right corner of the screen.

![Add Data](/assets/img/posts/2025-01-09-Introduction-To-Splunk/image-2.png)

Splunk has a few ways to import data:

1. Uploading files to the Splunk Platform
2. Monitoring the data coming from the Splunk platform instance
3. Forwarding log data from other sources

1. Endpoints
2. Network Devices
3. Cloud Devices

![Add Data Options](/assets/img/posts/2025-01-09-Introduction-To-Splunk/image-3.png)

## Uploading a Log File

I was given the sample log data as a csv file called `sample.csv` so I used the `Upload` button in the Add Data page.

![sample.csv](/assets/img/posts/2025-01-09-Introduction-To-Splunk/sample.csv)

Add Data wizard walked me through the following steps:

- Select Source
	- I selected the `sample.csv` file
- Set Source Type
	- Here I ensured Splunk recognized the `.csv` file type
	- I also previewed the data to make sure Splunk was reading and formatting it correctly
- Input Settings
	- Host field value: Should be set to name of machine that collected the log
	- Since my file is fictitious I kept the host name as is
- Index
	- Here I created a new index
- Review
- Done

![New Index Page](/assets/img/posts/2025-01-09-Introduction-To-Splunk/image-4.png)

## Searching By Index

At Splunk > Apps > Search (`<Splunk IP>:8000/en-US/app/search/search`)

```
index="sample_index"
```
## Search Functions

### Time Frame
This feature filters the search results to only include a specific range of time.

![Time Frame](/assets/img/posts/2025-01-09-Introduction-To-Splunk/image-5.png)

### Save As
The Save As button in the top right corner has different options that can be used to export the current search

- Report
- Alert
- Existing Dashboard
- New Dashboard

![Export Options](/assets/img/posts/2025-01-09-Introduction-To-Splunk/image-6.png)

### Results Tabs
These tabs reveal information about the data collected by the search criteria. There are four main tabs.

![Results Tabs](/assets/img/posts/2025-01-09-Introduction-To-Splunk/image-7.png)

- Events - List of all events
- Patterns - Detected from underlying data. Needs >5000 events to be useful
- Statistics
- Visualization

A lot of the automatically generated information will only be generated and useful if you have enough data to support the analysis functions.

### Event Sampling

Selecting an option from the Event Sampling drop down allows us to display only one result per X amount of events.

- 1:10
- 1:100
- 1:1000
- 1:10000
- 1:100000
- Custom

![Event Sampling](/assets/img/posts/2025-01-09-Introduction-To-Splunk/image-8.png)

### Job Settings

Splunk searches are treated as "Jobs".

- Create unique URL for the job to share results with others
- Print
- Export to CSV, JSON, XML

### Modes

Splunk Search has three modes:
- Fast Mode - Field discovery off
- Smart Mode - Field discovery on
- Verbose Mode - All data

### Event Timeline

Visual representation of the data over time


![Event Timeline](/assets/img/posts/2025-01-09-Introduction-To-Splunk/image-9.png)

## Searching Events

By clicking on a text string in the event data allows us to refine the search based on the selected text.

- Add to search
- Exclude from search
- New search

Clicking the icon next to each option will open in a new tab

![Refine Search](/assets/img/posts/2025-01-09-Introduction-To-Splunk/image-10.png)

By excluding `bwilliams` from the search results I ended up with 2 fewer results.

![Excluded Username Field](/assets/img/posts/2025-01-09-Introduction-To-Splunk/image-11.png)

## Event Item Fields
By clicking on the drop down arrow next to an event shows the available fields.

![Event Item Fields](/assets/img/posts/2025-01-09-Introduction-To-Splunk/image-12.png)

There is also a field overview on the left side bar

![Fields Sidebar](/assets/img/posts/2025-01-09-Introduction-To-Splunk/image-13.png)

Clicking on a field in this bar gives us statistics of this field's results.

![Field Statistics](/assets/img/posts/2025-01-09-Introduction-To-Splunk/image-14.png)