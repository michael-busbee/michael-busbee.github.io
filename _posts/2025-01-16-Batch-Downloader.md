---
layout: post
title: "Let's Defend: Batch Downloader"
date: 2025-01-16
categories: [Lets Defend]
tags: [PDF, VBS] 
---

Challenge Link: [https://app.letsdefend.io/challenge/batch-downloader](https://app.letsdefend.io/challenge/batch-downloader)

## Question 1
What command is used to prevent the command echoing in the console?

In the ChallengeFile folder on the Desktop I found a zip file that contained a PDF. To learn more about the contents of the PDF I opened it with Notepad++. In the first line of the file I found a reference to `@echo off`

![Script Screenshot #1](/assets/img/posts/2025-01-16-Batch-Downloader/image-1.png)

Answer:

`@echo off`

## Question 2
Which tool is used to download a file from a specified URL in the script?

In the screenshot above I also found a reference to `bitsadmin` that is used to download in the script.

Answer:

`bitsadmin`

## Question 3
What is the priority set for the download operation in the script?

The `bitsadmin` command in the script also shows a `/Priority FOREGROUND` option.

Answer:

`FOREGROUND`

## Question 4
Which command is used to start localization of environment changes in the script?

Below `bitsadmin` in the script is a `setlocal` command that looks about right for the answer.

Answer:

`setlocal`

## Question 5
Which IP address is used by malicious code?

After the `/Priority FOREGROUND` option of the `bitsadmin` command is a URL to the malicious download. Here it shows the full IP address of the attacker's malware server.

Answer:

`193.169.255.78`

## Question 6
What is the name of the subroutine called to extract the contents of the zip file?

Further down in the script is a reference to `UnZipFile` which looks like it is being used to unzip the downloaded file.

Answer:

`UnZipFile`

## Question 7
Which command attempts to start an executable file extracted from the zip file?  

Line 7 of the script shows a command attempting to start a .exe file.

![Script Screenshot #2](/assets/img/posts/2025-01-16-Batch-Downloader/image-2.png)


Answer:

`start "" "FW-APGKSDTPX4HOAUJJMBVDNXPOHZ.PDF.exe"`

## Question 8
Which scripting language is used to extract the contents of the zip file?

The bottom half of the script file shows a lot of references to "vbs" which is the extension for VBscript.  

Answer:

`VBscript`