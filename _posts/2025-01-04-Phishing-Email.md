---
layout: post
title: "Phishing Email"
date: 2025-01-04
categories: [Lets Defend]
tages: [phishing] 
---

Challenge Link: ![https://app.letsdefend.io/challenge/phishing-email](https://app.letsdefend.io/challenge/phishing-email)


I unzipped the file `PhishingChallenge.zip` found at `C:\Users\LetsDefend\Desktop\Files\` and unlocked it using the password provided by the challenge.  I then opened the file `paypal.eml` in Notepad++ to view the raw email info.

## Question 1

What is the return path of the email?

I used `CTRL+F` to find the `Return-Path` header to get the first answer.

![Return-Path](/assets/img/posts/2025-01-04-Phishing-Email/image.png)

Answer:
`bounce@rjttznyzjjzydnillquh.designclub.uk.com`


## Question 2

What is the domain name of the url in this mail?

To find the URL embedded in the HTML code I searched for the text `href` to find the right anchor tag. This gave me a URL with the domain name:

Answer:
`storage.googleapis.com `


## Question 3

Is the domain mentioned in the previous question suspicious?

The email appears to be impersonating Paypal but has the user clicking out to a link using googleapis.com instead of out to a Paypal link. Suspicious

Answer:
`Yes`


## Question 4

What is the body SHA-256 of the domain?

I went to VirusTotal and searched the URL found in Question 2, `storage.googleapis.com`, and found this Body SHA-256 hash in the details tab:

![Body_SHA-256](/assets/img/posts/2025-01-04-Phishing-Email/image_1.png)


Answer:
`13945ecc33afee74ac7f72e1d5bb73050894356c4bf63d02a1a53e76830567f5`


## Question 5

Is this email a phishing email?

Considering all the available information from the previous questions I am confident this is a phishing attempt.

Answer:
`Yes`