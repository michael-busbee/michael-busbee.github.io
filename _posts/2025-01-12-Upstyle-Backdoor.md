---
layout: post
title: "Let's Defend: Upstyle Backdoor"
date: 2025-01-12
categories: [Lets Defend]
tags: [Malware, Python] 
---

Challenge Link: [https://app.letsdefend.io/challenge/upstyle-backdoor](https://app.letsdefend.io/challenge/upstyle-backdoor)

File Location: `C:\Users\LetsDefend\Desktop\ChallengeFile\sample.zip`

File Password: `infected`

## Question 1
What function is responsible for monitoring a log file for embedded commands and executing them, while also restoring the file to its original state?

After extracting the** `**sample.zip**` file I found a file within called** `**sample.py**` . Since the question asks for the name of a function I opened this python file in Notepad++.

![Check Function](/assets/img/posts/2025-01-12-Upstyle-Backdoor/image-1.png)

In the python code I found a function called `check()` that appeared to be searching through logs and comparing them to a shell regex pattern. This seemed like my answer.


Answer:

`check()`

## Question 2
What is the system path that is used by the threat actor?

Further down in the code I found a `protect()` function that contained a variable called `systempth`.

![System Path](/assets/img/posts/2025-01-12-Upstyle-Backdoor/image-2.png)

Answer:

`/usr/lib/python3.6/site-packages/system.pth`

## Question 3
What is the CSS path used by the script?

I remembered seeing references to CSS earlier in the script so I used `CTRL+F` to search for the keyword "css" and found a variable called `css_path`.

![CSS Path](/assets/img/posts/2025-01-12-Upstyle-Backdoor/image-3.png)

Answer:

`/var/appweb/sslvpndocs/global-protect/portal/css/bootstrap.min.css`

## Question 4
Where does the script attempt to remove certain license files from?

I used the same trick as the previous question and searched for the keyword "license"

Answer:

`/opt/pancfg/mgmt/licenses/`

## Question 5
What specific signal does the protection function respond to?

In the `protect()` function at the bottom of the file I found the signal used.

![Protection Function](/assets/img/posts/2025-01-12-Upstyle-Backdoor/image-4.png)

Answer:

`SIGTERM`

## Question 6
What function is responsible for protecting the script itself?

I already discovered the `protect()` function earlier in the challenge.

Answer:

`protect()`

## Question 7
What type of pattern does the script search for within the log file?

In Question 1, I found a reference to a `SHELL_PATTERN` that I believe is what this question is asking for.

![Search Pattern](/assets/img/posts/2025-01-12-Upstyle-Backdoor/image-5.png)

Answer:

`img\[([a-zA-Z0-9+/=]+)\]`

## Question 8
Which specific log file does the script read from?

Here I searched for the keyword "log" and found a reference to a specific log file path:

![Log File](/assets/img/posts/2025-01-12-Upstyle-Backdoor/image-6.png)

Answer:

`/var/log/pan/sslvpn_ngx_error.log`