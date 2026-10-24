---
title: "Project SAVIOR: 16-Channel Strain Data Recorder"
description: "[One or two sentences with what it is and the headline numbers. This is the homepage card text and the link-preview snippet.]"
date: 2026-04-01T12:00:00-05:00
lastmod: 2026-10-23T12:00:00-05:00
author: Will Rohren
avatar: /headshot.jpg
cover: Images/cover.jpg
images:
  - Images/cover.jpg
categories:
  - Electronics
  - Aerospace
tags:
  - PCB Design
  - Altium
  - Mixed-Signal
  - Strain Gauges
  - DAQ
  - Structures
  - SAE Aero
  - Texas A&M
  - In Progress
draft: true
weight: 1
---

[Two or three sentences: what SAVIOR is, why it exists, where it stands today. This is the first thing on the page.]

**STATUS:** [Dated. For example: Boards arrived October 26, 2026. Bring-up and bench calibration next, then flight testing on the 2026-27 airframe.]

<!--more-->

### At a glance

- **Role:** [solo design, or who else is involved]
- **When:** April 2026 to present
- **Purpose:** [measure in-flight wing loads and compare them with the FEA predictions]
- **Hardware:** [eight ADS1220 24-bit ADCs, Teensy 4.1, 6-DoF IMU, 200 g accelerometer, 16 strain channels]
- **Where it stands:** [schematic, layout, fab, bring-up, calibration, flight]

![Hero photo: the real board, or the full layout render until the board exists](Images/cover.jpg)
*[Caption]*

### Why this exists

[The gap from SAE Aero: inconsistent FEA inputs, guessed accelerations, no in-flight data. One paragraph. Link to the SAE Aero page at /posts/sae-aero/.]

### How it works

[One block diagram. Then a short walk down the signal path: bridge, excitation, ADC, MCU, logging, IMU.]

### Decisions worth defending

[Bridge topology per channel: half-bridge type II for bending, three-wire series-pair arms for axial. ADC choice. Sample rate and filtering. Power. Connectors and harness. A few sentences each, and say why.]

### What is done and what is next

[Dated list. Be specific about what has been tested on the bench and what has not.]

### Related

- [SAE Aero](/posts/sae-aero/): the airframe this flies on
- [Senior capstone](/posts/capstone-mgse/): the HX711 strain DAQ this grew out of
