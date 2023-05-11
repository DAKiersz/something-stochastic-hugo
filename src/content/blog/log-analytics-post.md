---
title: "Using Log Analytics for Cost Optimisation"
date: 2023-05-11T21:37:22Z
draft: true
tags: ["KQL, Log Analytics, Azure"]
categories: ["platform engineering"]
---

I've recently done some work on cost optimisation for my current employer, and some of recommendations have saved the company nearly 6k pounds in a single month. This post will cover some of the work I've done, and how you can use Log Analytics to do the same.

## What is Log Analytics?

Azure (Monitor) Log Analytics is a service that allows you to collect, analyse and visualise data from various Azure infrastructure. It is also part of Azure Monitor, and can be used for both alerting & Monitoring development, as well as cost optimisation. Log Analytics uses KQL (Kusto Query Language) to query data - you can think of is as a dialect of SQL, but with a few differences that we do not need to cover here.

Logs in Azure are stored in a Log Analytics Workspace, which is a container for all the data. Each table is a collection of logs from a single source, such as Azure Virtual Machines. Each table has a schema, which defines the structure of the data which is something Data Engineers are more than familiar with. 

## Perf Table

This is a table that contains performance data for Azure Virtual Machines, it as a number of columns that can be used to identify VMs and the `_ResourceID` we can parse. It also contains a number of columns that can be used to identify the performance metric, such as `CounterValue`, `CounterInstance` or `CounterName`.

## Cost Optimisation


