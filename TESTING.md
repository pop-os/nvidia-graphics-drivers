# Testing
This document provides a guideline for testing and verifying NVIDIA driver updates. Copy this checklist and mark items as they are verified to work.

These tests _must_ be performed on every OS version that the driver will be released on. Typically, that will be the Pop!\_OS regular release, the Pop!\_OS LTS, and the Ubuntu LTS.

## Installation

Add the staging branch containing the updated driver with the [apt script](https://github.com/pop-os/pop/blob/master/scripts/apt) in the pop-os/pop repo.

- [ ] `sudo apt upgrade` updates the driver without conflicts (Ubuntu may require `full-upgrade`).

## Desktop graphics

Several graphics cards will have to be tested, preferably in several desktops. Test at least one current generation NVIDIA card, as well as one previous generation NVIDIA card.

- [ ] HDMI-out (including sound output) works at expected resolution and refresh rate
- [ ] DisplayPort-out (including sound output) works at expected resolution and refresh rate
- [ ] HDMI-out fractional scaling works at 125%, 150%, 175%
- [ ] DisplayPort-out fractional scaling works at 125%, 150%, 175%
- [ ] Daisy-chained DisplayPort monitors (DP alt mode) work at expected resolution and refresh rate
- [ ] Hot plugging/unplugging displays works as expected
- [ ] Multiple displays at once work as expected
- [ ] GSync over DisplayPort is working without flickering or flashing
- [ ] Multiple NVIDIA GPUs in a desktop are correctly reported by `nvidia-smi`
- [ ] Steam can be installed and launched
  - [ ] From Launcher
  - [ ] From App Library
  - [ ] From Dock
  - [ ] From Terminal
- [ ] A native Linux game can be launched from Steam
- [ ] A Proton game can be launched from Steam

## Laptop graphics (switchable graphics)

Switchable graphics laptops can render with either the CPU-integrated GPU or the dedicated NVIDIA GPU. Before installing the driver update, make sure the machine is in Hybrid graphics mode.

- [ ] After update and reboot, the machine remained in Hybrid graphics mode.

### Hybrid mode tests

- [ ] Laptop suspends and resumes (works with a bluetooth device paired)
- [ ] `nvidia-smi` correctly reports the GPU's status
- [ ] DisplayPort (mDP and DP over USB-C) outputs (including sound) work as expected
- [ ] HDMI-out (including sound) works as expected
- [ ] External display becomes primary display when laptop lid is closed
- [ ] HDMI-out fractional scaling on extrnal monitor works at 125%, 150%, 175%
- [ ] DisplayPort (mDP and DP over USB-C) fractional scaling on extrnal monitor works at 125%, 150%, 175%
- [ ] Steam can be installed and launched
  - [ ] From Launcher
  - [ ] From App Library
  - [ ] From Dock
  - [ ] From Terminal
- [ ] A native Linux game can be launched from Steam
- [ ] A Proton game can be launched from Steam

### NVIDIA mode tests

- [ ] Laptop suspends and resumes (works with a bluetooth device paired)
- [ ] `nvidia-smi` correctly reports the GPU's status
- [ ] DisplayPort (mDP and DP over USB-C) outputs (including sound) work as expected
- [ ] HDMI-out (including sound) works as expected
- [ ] External display becomes primary display when laptop lid is closed
- [ ] HDMI-out fractional scaling on extrnal monitor works at 125%, 150%, 175%
- [ ] DisplayPort (mDP and DP over USB-C) fractional scaling on extrnal monitor works at 125%, 150%, 175%
- [ ] Steam can be installed and launched
  - [ ] From Launcher
  - [ ] From App Library
  - [ ] From Dock
  - [ ] From Terminal
- [ ] A native Linux game can be launched from Steam
- [ ] A Proton game can be launched from Steam

### Compute mode tests

- [ ] `nvidia-smi` correctly reports the GPU's status
- [ ] Plugging in a display correctly prompts to switch to Hybrid mode

### Integrated mode test

- [ ] Plugging in a display correctly prompts to switch to Hybrid mode
- [ ] Steam can be installed and launched
  - [ ] From Launcher
  - [ ] From App Library
  - [ ] From Dock
  - [ ] From Terminal
- [ ] A native Linux game can be launched from Steam
- [ ] A Proton game can be launched from Steam

## Software tests

These can be done on any machine with an NVIDIA GPU

- [ ] NVIDIA X Server Settings application launches properly
- [ ] A Unigine benchmark performs as expected
