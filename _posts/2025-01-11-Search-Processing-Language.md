---
layout: post
title: "SPL: Search Processing Language Cheatsheet"
date: 2025-01-11
categories: [Splunk]
tags: [Splunk, SIEM]
---

This cheatsheet provides quick reference tips for using Splunk effectively. Clarity and accuracy are key—let's dive in!

---

## General Tips
- **Case Sensitivity**: Searches are case-insensitive by default.
- **Optimize Early**: Use search fields early in your query to limit results and improve performance.

---

## Exact Matches with Quotes
Wrap a search string in quotes to match the exact text.

```spl
index="sample_index" "bwilliams,login"
```

---

## Logical Operators: AND, OR, NOT
- **Order of Evaluation**: `NOT` → `OR` → `AND` (Remember the acronym: **NORA**).
- **Override with Parentheses**: Use parentheses `()` to control operator precedence.

Examples:
```spl
index="sample_index" AND bwilliams AND login
index="sample_index" AND method=GET OR method=POST
index="sample_index" AND NOT method=GET OR method=POST
```

---

## Wildcards (*)
The wildcard `*` matches one or more characters.

Examples:
```spl
index="sample_index" 192.168.1.*
index="sample_index" log*n
index="sample_index" 12:*:00
index="sample_index" clientip=100.*.*.*
```

---

## Comparison Operators
Splunk supports standard comparison operators:
- `=` (equals)
- `!=` (not equals)
- `>` (greater than)
- `<` (less than)

---

## Time Range Filters
Specify time ranges for more targeted searches.

Examples:
```spl
index="sample_index" earliest
index="sample_index" earliest=-1d
index="sample_index" earliest="January"
index="sample_index" earliest="01/01/25:00:00:00"
index="sample_index" latest
index="sample_index" latest=now
```

### Time Range Modifiers
- `-1d`: "Minus one day"
- Units: 
  - `d` = day
  - `h` = hour
  - `w` = week

---

## Using Commands
Splunk commands follow the `|` pipe syntax, similar to Bash. For a full list, refer to the [Splunk Search Commands Documentation](https://docs.splunk.com/Documentation/Splunk/9.2.2/SearchReference/ListOfSearchCommands).

---

### Common Commands

#### **sort**
Sort results by a specified field. Use `-` to sort in reverse order.
```spl
index="sample_index"
| sort -<field>
```

---

#### **stats**
Generate statistics by field.
```spl
index="sample_index"
| stats count by clientip
| sort -count
| head
```

---

#### **head / tail**
Show the top or bottom `n` results.
```spl
index="sample_index"
| head 5
| tail 5
```

---

#### **table**
Display specific fields in a table.
```spl
index="sample_index"
| table _time, clientip, method, uri, useragent
| dedup useragent
| rename useragent AS "User Agent"
```

---

#### **top**
Display the most common values, limited by the `limit` parameter.
```spl
index="sample_index"
| top limit=5
```

---

#### **chart**
Visualize data as a chart.
```spl
index="sample_index"
| chart count by status
```

---

#### **search**
Perform nested searches for advanced filtering.
```spl
index="sample_index"
| table _time, clientip, method, uri, useragent
| search useragent=*Nmap*
```

---

#### **iplocation**
Enhance IP-based data with geographic information.
```spl
index="sample_index"
| iplocation clientip
| table _time, clientip, Country, City, uri
```

For geographic visualization:
```spl
index="sample_index"
| iplocation clientip
| geostats
```

View results in **Visualization > Cluster Map**.

---

