---
title: "A Teams Webhook Script for Azure Pipelines"
date: 2023-05-13T13:52:19+01:00
draft: true
tags:
 - Powershell
 - Azure Pipelines
 - Teams
categories:
 - DevOps
 - Azure
---

In my recent adventures, I've decided to pick up a story to add low hanging alerting solution to one of our nightly releases done via Azure Pipelines. The mission was simple - fail some element of the pipeline and send a message to a Teams channel via a webhook. Microsoft Teams has a very simple webhook API that can be used to send messages to a channel. In layman's terms, its essentially a plugin that gives you a URL that you can send a POST request to, and the message (that can be customised) will appear in the channel. We need a script to do the job.

The webhook URL can be generated in the channel settings via connections menu.

## Payload Script

The code for exacly that can be found on Microsofts docs page, but it was written in C#. I'm not too keen with it, so a quick conversion to Powershell (that can be easily used in Azure Pipelines) was in order. The result was this:

```powershell
TODO
```

The request body is a JSON object that contains the message you want to send, and some other optional parameters.

## Azure Pipelines

```yaml
TODO
```

## References

