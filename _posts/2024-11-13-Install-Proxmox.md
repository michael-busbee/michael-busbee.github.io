--- 
title: "Chapter 2: Install Proxmox"
date: 2024-11-13
categories: [Build a Home Lab Series]
tags: [Home Lab, Proxmox]
---

## Step 0 - Introduction

Before we get started its is a good idea to think about what we plan to accomplish. I have outlined the steps we will use in this guide below.

- Step 1 - Download proxmox ISO
- Step 2 - Flash to USB drive
- Step 3 - Install on the PC
- Step 4 - Connect to the Web Console at `http://<ProxmoxIP>:8006`

## Step 1 - Downloading the Proxmox ISO

First we want to head over to the Proxmox download page to get the ISO image file. You can use the following link: [https://www.proxmox.com/en/proxmox-virtual-environment/overview](https://www.proxmox.com/en/proxmox-virtual-environment/overview)


![Proxmox Virtual Environment Webpage](/assets/img/posts/2024-11-13-Install-Proxmox/Install%20Proxmox.png)

Once on the page click the download button to get it rolling.

![PVE Download Page](/assets/img/posts/2024-11-13-Install-Proxmox/Install%20Proxmox-1.png)

Here we need to make sure we are selecting the "Proxmox VE 8.2 ISO Installer" option and click Download. Wait for the download to finish and head to the next step.

## Step 2 - Flashing the ISO to a flash drives

Next we need to load the ISO file into the flash drives so we can install it on our computer. For that I will use Balena Etcher. We can go over to [https://etcher.balena.io/#download-etcher](https://etcher.balena.io/#download-etcher) to download the app and select the option appropriate for your system. Here you can also use similar tools such as [Rufus](https://rufus.ie/en/).

Once Balena is finished downloading and is installed on your system, plug in your flash drives. Run the app, select the Proxmox ISO first, then the flash drives you plugged in, then hit "Flash!".

![Using Balena Etcher](/assets/img/posts/2024-11-13-Install-Proxmox/Install%20Proxmox-2.png)

The installer will take 1-2 minutes to run. Once it is done you have a Proxmox installer drive ready to go.

## Step 3 - Install on PC

Next we want to install Proxmox on our spare PC. Typically, this requires going into the BIOS settings on your PC and changing the boot order to allow flash drives to boot before the PC hard drive. Since this will be different for every computer, I will leave this for you to figure out. Remember Google Search and Youtube can be your friend.

Once you have changed your boot order settings, it is time to plug in the flash drive and boot up the computer. You will arrive at the Proxmox install screen below:

![Proxmox Install Screen](/assets/img/posts/2024-11-13-Install-Proxmox/Install%20Proxmox-3.png)

We want to run the Graphical installer. If you feel like you have a good grasp on what is going on, feel free to use the Terminal UI installer. Follow the install wizard and choose the appropriate options for your system and network.

1. Proxmox Virtual Environment (PVE)
	1. We will be first asked to select the hard disk to install Proxmox onto
2. Location and Time Zone selection
	1. Next we need to provide the location information. I chose United States and America/New_York.
3. Administration Password and Email Address
	1. Now we need to add a password. This is the password you will use to log into Proxmox.
	2. Enter a valid email address. This is the email the server will use to send alerts, should you configure it to do so.
4. Management Network Configuration
	1. **Management Interface:** Ensure your PC is plugged in via Ethernet and the installer recognizes it.
	2. **Hostname (FQDN):** This is the hostname name of the proxmox machine.
	3. **IP Address (CIDR):** Put in the IP address you want for the machine. It is important to check that no other devices on the network use this IP address.
	4. **Gateway:** This will most likely be the IP address of your home router.
	5. **DNS Server:** This will most likely be the IP address of your home router.
5. Summary
	1. Verify Selections
	2. Click Install

Now just sit back and wait a few minutes and wait for the installer to finish. The machine will reboot during the process. Once its back up you should see a URL to get to the management console and a prompt for login.

![Proxmox CLI Login Screen](/assets/img/posts/2024-11-13-Install-Proxmox/Install%20Proxmox-4.png)

## Step 4 - Connect to the Web Console

Now that Proxmox is up and running, we need to go to the web console it is advertising. Go to your browser on a different computer on the same network. Visit the URL showing on the Proxmox screen. This will take you to a page that should look like this.

> Note: Your browser may consider the Proxmox URL as an untrusted site and refuse to load the page. You will need to click through this warning and tell your browser to load the page anyway. This process is slightly different for each browser.

![Web Console Login Screen](/assets/img/posts/2024-11-13-Install-Proxmox/Install%20Proxmox-5.png)

The default administrator username  is called `root`. We need to use this with the password created during setup to log in. We will then be prompted that you do not have a valid subscription. Do not worry about this, as it is just warning we do not have access to enterprise features, and just click `OK`.

![No valid subscription Notice](/assets/img/posts/2024-11-13-Install-Proxmox/Install%20Proxmox-6.png)

We then are able to see the Proxmox console. It may be a good idea to bookmark this page for quick access later on. Now that we have Proxmox set up we can use it as a foundation to build upon our home lab. We can use Proxmox to install any virtual machine or container we may want or need.

