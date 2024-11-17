--- 
title: "Part 0: Home Lab Introduction"
date: 2024-11-12
categories: [Build a Home Lab]
tags: [Home Lab, Proxmox]
---



# Building a Home Lab Introduction

Welcome to the Building a Home Lab series! If you're interested in learning more about virtualization, networking, and systems administration, or if you’re looking to boost your IT skills, this hands-on project is a great way to have fun while learning.

Join me as I take my tragically underused gaming desktop and turn it into the start of my home lab. The primary plan for this project is to have create a foundation build upon when future needs arise. Currently I have my eye on a few ideas:
1. Create a few work station machines (Windows and Linux) and practice configuring device settings such as Role Based Access Controls and Local Firewall configs.
2. Set up an Active Directory environment (WIndows Server + WIndows Workstations) and practice AD attacks using a Kali Linux Machine.
3. Build an Elastic (ELK) SEIM to monitor my network.
4. Any other cool projects that come to mind.

# Why a home lab?

Home labs are perfect for experimenting with different operating systems, testing network configurations, and getting familiar with various technologies without the risk of breaking anything in a production environment. 

If you are following along with my guide you will want to make sure the computer you install Proxmox on has enough RAM. Every VM running at the same time will require its own RAM that takes from the total your Proxmox machine has to offer. The computer I'm using has 64 GB. I would recommend using a device with at least 16 GB or you may start to notice some issues when running everything at once.

# Project Rundown

1. Install Proxmox Hypervisor on the old computer
2. Install Tailscale VPN to access our home network from anywhere
3. Create various workstation machines
4. Minecraft Server...?

