---
layout: post
title: "Let's Defend: Malicious VBA"
date: 2025-01-24
categories: [Lets Defend]
tags: [Cyberchef, VBA] 
---


Challenge Link: https://app.letsdefend.io/challenge/Malicious-VBA 
Malicious Macro: `/root/Desktop/ChallengeFiles/invoice.vb

`
## Question 1
The document initiates the download of a payload after the execution, can you tell what website is hosting it?

I opened up the file `invoice.vb` in notepad and found a file full of obfuscated code.

![](/assets/img/posts/2025-01-24-Malicious-VBA/image-1.png)

I figured Cyberchef would be a useful tool here so I copied a string of text being input to a function in the script to see what Cyberchef would give me.

![](/assets/img/posts/2025-01-24-Malicious-VBA/image-2.png)

![](/assets/img/posts/2025-01-24-Malicious-VBA/image-3.png)

This appeared to be a hexadecimal value which gave the first part of a URL when decoded. This partial URL next made me think to grab the input from the other function call right beside it.

This got me the full URL.

![](/assets/img/posts/2025-01-24-Malicious-VBA/image-4.png)

Answer:

`https://tinyurl.com/g2z2gh6f`
## Question 2
What is the filename of the payload (include the extension)?

I used the same trick as in the last question to find the obfuscated filename.

![](/assets/img/posts/2025-01-24-Malicious-VBA/image-5.png)

Answer:

`dropped.exe`

## Question 3
What method is it using to establish an HTTP connection between files on the malicious web server?

I kept decoding the function inputs and found one that appeared to be an HTTP function.

![](/assets/img/posts/2025-01-24-Malicious-VBA/image-6.png)

Answer:

`MSXML2.ServerXMLHTTP`

## Question 4
What user-agent string is it using?

So far all of these answers have been HEX encoded function inputs: 

![](/assets/img/posts/2025-01-24-Malicious-VBA/image-7.png)

Answer:

`Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.0)`

## Question 5
What object does the attacker use to be able to read or write text and binary files?

Scanning through the file I noted a CreateObject function:

![](/assets/img/posts/2025-01-24-Malicious-VBA/image-8.png)

Answer:

`ADODB.Stream`

## Question 6
What is the object the attacker uses for WMI execution? Possibly they are using this to hide the suspicious application running in the background.

Using the same strategy as all previous questions I kept decoding HEX values until I found the answer. It was one of the last decodable items in the script.

![](/assets/img/posts/2025-01-24-Malicious-VBA/image-9.png)


Answer:

`winmgmts:\\.\root\cimv2:Win32_Process`