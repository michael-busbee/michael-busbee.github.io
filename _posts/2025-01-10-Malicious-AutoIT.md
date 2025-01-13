---
layout: post
title: "Let's Defend: Malicious AutoIT"
date: 2025-01-10
categories: [Lets Defend]
tags: [Malware, Detect It Easy, AutoIT, DLL] 
---

Challenge Link: [https://app.letsdefend.io/challenge/malicious-autoit](https://app.letsdefend.io/challenge/malicious-autoit)

File Location: `C:\Users\LetsDefend\Desktop\ChallengeFile\sample.zip`

File Password: `infected`

## Question 1
What is the MD5 hash of the sample file?

```
Get-FileHash -Algorithm MD5 -Path "C:\Users\LetsDefend\Desktop\ChallengeFile\sample"
```

![PowerShell MD5 Hash Output](/assets/img/posts/2025-01-10-Malicious-AutoIT/image-1.png)

Answer:

`5E53B40CF972F4EB08990999CE17C5C8`

## Question 2
According to the Detect It Easy (DIE) tool, what is the entropy of the sample file?

I loaded up the `sample` file into the Detect It Easy tool provided in the Lets Defend VM. I then clicked on the `Entropy` button on the dashboard to obtain entropy information.

![Entropy](/assets/img/posts/2025-01-10-Malicious-AutoIT/image-2.png)

The Entropy window showed a Total Entropy of `6.58565`

Answer:

`6.58565`

## Question 3
According to the Detect It Easy(DIE) tool, what is the virtual address of the “.text” section?

To get more information on the `.text` section of the file I clicked the sections button.


![.text Virtual Address](/assets/img/posts/2025-01-10-Malicious-AutoIT/image-3.png)


Here I found the virtual address of `00001000` or `0x1000` in the format required by the question.

Answer:

`0x1000`

## Question 4
According to the Detect Easy tool, what is the “time date stamp”?

This can be found on the Detect It Easy dashboard for the sample file.

![Time Date Stamp](/assets/img/posts/2025-01-10-Malicious-AutoIT/image-4.png)

Answer: 

`2020-02-26 21:41:13`

## Question 5
According to the Detect It Easy (DIE) tool, what is the entry point address of the executable?

This can also be found on the dashboard at the Entry point section.
  
![Entry Point Address](/assets/img/posts/2025-01-10-Malicious-AutoIT/image-5.png)

Answer:

`0x42800A`

## Question 6
What is the domain used by the malicious embedded code?

```
autoit-ripper "C:\Users\LetsDefend\Desktop\ChallengeFile\sample" "C:\Users\LetsDefend\Desktop\ChallengeFile"
```

This created a file called `script.au3` in the ChallengeFile directory. I was then able to open this file with Notepad++ that was preinstalled on the LetsDefend VM. Scanning through the file I found a URL.

![Domain](/assets/img/posts/2025-01-10-Malicious-AutoIT/image-6.png)

Answer:

`office-cleaner-commander.com`

## Question 7
What is the file path encoded in hexadecimal in the malicious code?

In the same screenshot as above I found a hard-coded hex value.

![File Path Encoded](/assets/img/posts/2025-01-10-Malicious-AutoIT/image-7.png)

I put it into CyberChef to decode and found the encoded file path.

![File Path Decoded](/assets/img/posts/2025-01-10-Malicious-AutoIT/image-8.png)

Answer:

`:\Windows\System32\`

## Question 8
What is the name of the DLL called by the malicious code?

I also found a reference to the DLL file at the bottom of the file.

![Entry Point Address](/assets/img/posts/2025-01-10-Malicious-AutoIT/image-9.png)
Answer:

`user32.dll`