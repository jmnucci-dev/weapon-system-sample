# Roblox Weapon System

A code sample from a modular Roblox weapon system i personally developed in Luau.

This repository contains a selected portion of the system focused on **server-side weapon processing, hitscan hit detection, and lag compensation**.

> **Note:** This is only a code sample. The complete weapon system and its other components are not included in this repository.

## What this demonstrates

* Server-authoritative weapon processing
* Hitscan hit detection
* Lag compensation
* Historical character position tracking
* Temporary hitbox rewinding
* Headshot and body-shot resolution
* Client/server communication
* Typed Luau
* Modular server-side architecture

## Key Function

The main function demonstrated in this sample is `rewindAndResolve()`.

It handles lag-compensated hit detection by retrieving historical character positions from when the shot was fired, temporarily rewinding the relevant hitboxes, resolving the hitscan against those positions, and restoring the characters afterward.

This allows the server to account for network latency while keeping the final hit result server-authoritative.

## My Contribution

I personally designed and implemented the server-side weapon logic shown in this repository, including the hit resolution and lag compensation implementation.

The original project also uses external libraries and systems that are not included in this sample.

## Technology

* **Roblox Studio**
* **Luau**
* **Typed Luau**
* **Chrono** — used for time/history-related functionality
* **Blink** — used for networking

## Disclaimer

This repository is provided as a **portfolio/code sample** and does not represent the complete original project.

Some project-specific code, assets, and dependencies have been omitted because the original project is private.
