---
layout: post
title: "Let's Defend: PCAP Analysis"
date: 2025-01-05
categories: [Lets Defend]
tags: [PCAP, Wireshark] 
---

## Question 1
In network communication, what are the IP addresses of the sender and receiver?

I used the following Wireshark display filter to limit results to ones containing `P13` :

```
frame contains "P13"
```

![P13 Conversation](/assets/img/posts/2025-01-005-PCAP-Analysis/image-1.png)

It appears there was a conversation happening between 192.168.235.137 and 192.168.235.131. This can be confirmed by right clicking one of the packets and selecting Follow > TCP Stream .

![Follow TCP Stream](/assets/img/posts/2025-01-005-PCAP-Analysis/image-2.png)

This shows us the full conversation between the users `P13` and `Cu713` 

![Full Conversation](/assets/img/posts/2025-01-005-PCAP-Analysis/image-3.png)

Answer:
`192.168.235.137,192.168.235.131 `


## Question 2
P13 uploaded a file to the web server. What is the IP address of the server?

Since uploading to a web server uses the http POST method, I searched for that as a display filter. I also added `frame contains "upload" to filter down to the most likely suspect.

```
http.request.method == "POST" && frame contains "upload"
```

From this I found the host connected to the server with IP `192.168.1.7` .


## Question 3
What is the name of the file that was sent through the network?

By following the TCP stream of the packet found in the previous question and investigating its contents, I found a reference to a file named `file` .

![Upload](/assets/img/posts/2025-01-005-PCAP-Analysis/image-4.png)

Answer: 
`file` 


## Question 4
What is the name of the web server where the file was uploaded?

Further down on the same TCP stream I found a reference to an Apache server.

![Server Information](/assets/img/posts/2025-01-005-PCAP-Analysis/image-5.png)

Answer:
`Apache` 


## Question 5
What directory was the file uploaded to?

In the same screenshot above, I can also see a reference to the `upload` directory where the `file` will be sent.

![Upload Directory](/assets/img/posts/2025-01-005-PCAP-Analysis/image-6.png)

Answer:
`uploads` 


## Question 6
How long did it take the sender to send the encrypted file?

To find the duration of the upload I went to `Statistics` > `Conversation` and selected the `Limit to display filter` checkbox to only show the conversation related to my selected packet from the previous questions. Here I was able to find the duration was listed as `0.0073`.

![Upload Duration](/assets/img/posts/2025-01-005-PCAP-Analysis/image-7.png)

Answer:
`0.0073`
