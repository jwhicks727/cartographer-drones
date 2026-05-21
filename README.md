# Cartographer Drones
 
> *Deploy autonomous drones that explore the world and reveal your map — so you don't have to.*
 
[![Minecraft](https://img.shields.io/badge/Minecraft-26.1.2-brightgreen)](https://minecraft.net)
[![Loader](https://img.shields.io/badge/Loader-Fabric-blue)](https://fabricmc.net)
[![Java](https://img.shields.io/badge/Java-25-orange)](https://adoptium.net)
[![License](https://img.shields.io/badge/License-MIT-lightgrey)](LICENSE)
[![Modrinth](https://img.shields.io/badge/Modrinth-cartographer--drones-green)](https://modrinth.com/mod/cartographer-drones)
[![CurseForge](https://img.shields.io/badge/CurseForge-cartographer--drones-orange)](https://curseforge.com/minecraft/mc-mods/cartographer-drones)
[![Build](https://github.com/jwhicks727/cartographer-drones/actions/workflows/build.yml/badge.svg)](https://github.com/jwhicks727/cartographer-drones/actions/workflows/build.yml)
 
---
 
Cartographer Drones is a Fabric mod for Minecraft 26.1.2 that adds autonomous explorer drones. Launch a drone from your Launch Station, set a mission, and watch your map fill in organically as the drone moves through the world — loading chunks and triggering your map mod in real time, exactly as if a second player were exploring for you.
 
---
 
## Features
 
### v0.1.0 — Core Mechanic
- **Cartographer Drone** — a single autonomous drone entity that explores the world around a fixed launch point
- **Launch Station** — a machine block from which missions are launched and drone reports are received
- **Full JourneyMap integration** — drones load chunks *and* trigger JourneyMap to render them, revealing the map organically as the drone moves
- **Return-to-base** — drones navigate back to the station on mission completion
### Planned — Tier Progression
3-5 drone tiers (e.g. Wooden → Lodestone → Argus → Veilstone → Sovereign) with increasing speed, range, and capability, plus matching Station tiers. See the [roadmap](https://github.com/jwhicks727/cartographer-drones/milestones) for details.
 
### Planned — Reconnaissance
Biome detection, structure flagging, ore scanning, mob tracking — with auto-dropped waypoints on your map.
 
### Planned — Command Interface
A structured mission UI evolving into a natural language command system. Tell your drone: *"Find me a jungle"* or *"Scout for diamonds below Y=16"* or *"Hunt pigs and bring back drops."*
 
---
 
## Requirements
 
| Dependency | Version | Required? |
|---|---|---|
| Fabric API | Latest for 26.1.2 | ✅ Required |
| JourneyMap | 26.1.2-latest |  ⚠️ Soft (map reveal disabled without it) |
| Cloth Config | Latest for 26.1.2 | ✅ Required (configuration screen) |
| Mod Menu | Latest for 26.1.2 | ✅ Required (in-game settings UI) |
 
> **Modpack builders:** Cartographer Drones works without JourneyMap, but the core map-reveal mechanic requires it. Xaero's Minimap compatibility is planned for a future release.
>

---
 
## Compatibility
 
| Mod | Status |
|---|---|
| JourneyMap | ✅ Supported |
| Xaero's Minimap | 🔜 Planned |
| Xaero's World Map | 🔜 Planned |
 
---
 
## Installation
 
1. Install [Fabric Loader](https://fabricmc.net/use/) for Minecraft 26.1.x
2. Download [Fabric API](https://modrinth.com/mod/fabric-api)
3. Download Cartographer Drones from [Modrinth](https://modrinth.com/mod/cartographer-drones) or [CurseForge](https://curseforge.com/minecraft/mc-mods/cartographer-drones)
4. Place all `.jar` files in your `mods/` folder
5. Launch Minecraft
---
 
## Getting Started
 
1. Craft a **Launch Station** and place it in the world
2. Craft a **Cartographer Drone** and insert it into the Station
3. Open the Station GUI and set mission parameters
4. Launch — and watch your map reveal
Full progression guide: [Wiki](https://github.com/jwhicks727/cartographer-drones/wiki)
 
---
 
## For Modpack Builders
 
- **Performance:** Cartographer Drones uses a sliding chunk ticket window — only a small radius of chunks around the drone's current position are loaded at any time. Chunks are released as the drone moves on, keeping server memory impact flat regardless of mission range.
- **Mod ID:** `cartographer_drones`
- **Maven:** `io.github.jwhicks727:cartographer-drones`
- JourneyMap is a soft dependency — include it for the full experience, but the mod will load without it
- All config values are exposed via Cloth Config and can be overridden in `config/cartographer_drones.json`
- A public Java API is planned for v0.3.0, enabling other mods to register custom drone mission types
---
 
## Roadmap
 
| Milestone | Content |
|---|---|
| [v0.1.0](https://github.com/jwhicks727/cartographer-drones/milestone/1) | Core drone entity, Launch Station, JourneyMap reveal |
| v0.2.0 | Textures and aesthetics, Drone tier system (Wooden → Lodestone), Station tiers, Calibration Table |
| v0.3.0 | Biome/structure detection, auto-waypoints, public API |
| v0.4.0 | Ore scanning, mob detection, Cartographer's Satchel/Portable Launch Station |
| v0.5.0 | AI command interface, combat/loot return, cross-dimension |
 
---
 
## Contributing
 
Issues and PRs welcome. Please read [CONTRIBUTING.md](CONTRIBUTING.md) before submitting.
 
---
 
## License
 
MIT — see [LICENSE](LICENSE) for details.
 
---
 
*Built by [jwhicks727](https://github.com/jwhicks727)*
