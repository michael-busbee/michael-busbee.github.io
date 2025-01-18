---
layout: post
title: "Let's Defend: DLL Stealer"
date: 2025-01-18
categories: [Lets Defend]
tags: [DLL, dotPeek] 
---

Challenge Link: [https://app.letsdefend.io/challenge/dll-stealer](https://app.letsdefend.io/challenge/dll-stealer)

Scenario:
```
You work as a cybersecurity analyst for a major corporation. Recently, your company's security team detected some suspicious activity on the network. It appears that a new DLL Stealer malware has infiltrated your system, and it's causing concern due to its ability to exfiltrate critical DLL files from your system.
```

File Location: `C:\Users\LetsDefend\Desktop\ChallengeFile\sample.zip`

File Password: `infected`

## Question 1
What is the DLL that has the stealer code?

After unzipping the challenge folder I found a sample file. I didn't have a lot to go off of so I right clicked it and opened it in dotPeek.

![Open with dotPeek](/assets/img/posts/2025-01-18-DLL-Stealer/image-1.png)

I then had to wait so long for it to open I thought it wasn't working. Once it finally loaded I right clicked on the file name, then `Extract Bundle Contents to Folder` which let me extract the DLL files to a folder of my choosing. I just chose the ChallengeFile folder.

![Extract Bundle Contents](/assets/img/posts/2025-01-18-DLL-Stealer/image-2.png)

Once the DLLs were extracted I noted that I had two in particular:
- Colorful.dll    
- Test-Anitnazim.dll

![Extracted DLLs](/assets/img/posts/2025-01-18-DLL-Stealer/image-3.png)

Opening these in Notepad++ was useless so I tried dotPeek again and started with colorful.dll. Scrolling through the code it appears to be running CMD commands to copy a lot of data from various user folder such as `%appdata%` .

![Possible Stealer Code](/assets/img/posts/2025-01-18-DLL-Stealer/image-4.png)
  
With how suspicious this all looked I was pretty sure I had my answer.
  
Answer:
  
`colorful.dll`
  
## Question 2
What is the anti-analysis method used by the malware?

I continued to look through the code and found an `IsVirusTotal()` function that appears to be used to for a check, and exits if the check is true.

![IsVirusTotal](/assets/img/posts/2025-01-18-DLL-Stealer/image-5.png)

Presumably this function is checking the system for evidence of VirusTotal and stops running if it finds it. This could server as an anti-analysis method.

Answer:

`IsVirusTotal`

## Question 3
What is the full command used to gather information from the system into the “productkey.txt” file?

This question was fairly straight-forward. I just `CTRL+F`'d  the keyword "productkey.txt" which led me straight to the full command.

![productkey.txt](/assets/img/posts/2025-01-18-DLL-Stealer/image-6.png)

Answer:

`wmic path softwareLicensingService get OA3xOriginalProductKey >> productkey.txt`

## Question 4
What is the full command used to gather information through the "ips.txt" file?

Same strategy as last question.

![ips.txt](/assets/img/posts/2025-01-18-DLL-Stealer/image-7.png)

Answer:

`ipconfig/all >> ips.txt`

## Question 5
What is the webhook used by the malware?

It feels like cheating but I just used the same strategy yet again, this time searching for the keyword "webhook" and found a discord link.

![webhooks](/assets/img/posts/2025-01-18-DLL-Stealer/image-8.png)

Answer:

`https://discord.com/api/webhooks/1165744386949271723/kFr6Cc0DSTK1jB8aV3820mBxji06gF2KorUuO2Rd2ckLkhUEHxdi6kv6UHwgJ_W82fgZ`