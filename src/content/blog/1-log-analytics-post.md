---
title: "Using Azure Log Analytics for Cost Optimisation"
date: 2023-05-11T21:37:22Z
draft: true
tags:
 - KQL
 - Log Analytics
 - Azure Monitor
categories:
 - DevOps
 - Azure
---

I've recently done some work on cost optimisation for my current employer, and some of recommendations have saved the company nearly 6k pounds in a single month. This post will cover some of the work I've done, and how you can use Log Analytics to do the same.

## What is Log Analytics?

Azure (Monitor) Log Analytics is a service that allows you to collect, analyse and visualise data from various Azure infrastructure. It is also part of Azure Monitor, and can be used for both alerting & Monitoring development, as well as cost optimisation. Log Analytics uses KQL (Kusto Query Language) to query data - you can think of is as a dialect of SQL, but with a few differences that we do not need to cover here.

Logs in Azure are stored in a Log Analytics Workspace - a container for all the log data. Each table is a collection of logs, such as Azure Virtual Machines perfomance databe via `Perf`; or `AzureActivity` table that can be used to audit changes to Azure resources across the subscription (think of it as a `syslog` for Azure).

Each table has a schema, which defines the structure of the data which is something Data Engineers are more than familiar with. The schema can be viewed in the Azure Portal, or via the `schema` operator in KQL.

## Perf Table

This is a table that contains performance data for Azure Virtual Machines (VMs), it as a number of columns that can be used to identify VMs and the `_ResourceID` we can parse. It also contains a number of columns that can be used to identify the performance metrics ()`CounterValue`, `CounterInstance` or `CounterName`).

## Cost Optimisation

In this brief example, you can Log Analytics to identify VMs that are underutilised via CPU and Memory metrics that can aid in reducing costs. You can also check for metrics Disk IO, Network IO, etc. depending on the workload but I will keep it simple here.

1) Create a Log Analytics Workspace if it does not already exist.   
2) Enable diagnostics on the VMs you want to monitor. This can be done via the Azure Portal (or ARM/Bicep if you are fancy...). In Azure Portal, navigate to the VM you want to monitor -> **Diagnostics Settings** -> Log Analytics Workspace you created in step 1. Select the Performance Counters you want to monitor. Save your changes.
3) Create a new query in Log Analytics, and paste the following queries depending on what you want to investigate:

```sql




```

or the following, if we want **aggregated** values via the `summary` operator (think of `GROUP BY` in SQL).

```sql
Perf
| where TimeGenerated > ago(1d)
| where CounterName == "% Processor Time" or CounterName == "% Committed Bytes In Use"
| summarize AggregatedValue = avg(CounterValue) by bin(TimeGenerated, 1h), Computer, CounterName
| summarize AggregatedValue = avg(AggregatedValue) by Computer, CounterName
| extend AggregatedValue = round(AggregatedValue, 2)
| order by AggregatedValue asc
```

## VM Tiers

With this information, we can head to the VM
