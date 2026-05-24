#!/bin/bash
# Cartographer Drones — Backlog Issues
# Run from anywhere after: gh auth login
# Targets: github.com/jwhicks727/cartographer-drones

REPO="jwhicks727/cartographer-drones"
PROJECT=2
OWNER="jwhicks727"

echo "=== Creating new labels ==="
gh label create "type: design" --color "f4a261" --description "System design and architecture" --repo $REPO
gh label create "type: companion" --color "9b5de5" --description "Companion or integration mod" --repo $REPO
gh label create "priority: future" --color "ced4da" --description "Long term backlog, no milestone yet" --repo $REPO

add_to_project() {
  local url=$1
  gh project item-add $PROJECT --owner $OWNER --url "$url"
}

echo "=== PROGRESSION & TOOLS ==="

URL=$(gh issue create --repo $REPO \
  --title "[FEATURE] Crystal Compass — finds nearest amethyst geode" \
  --label "type: feature,priority: future" \
  --body "The first item a player crafts from Cartographer Drones. No Calibration Table required — crafted at a vanilla crafting table. Points toward the nearest amethyst geode, teaching the exploration loop before the player has touched a drone.

## Design
- Recipe: iron ingot + copper ingot + lapis lazuli (no amethyst required)
- Behavior: compass needle points toward nearest amethyst geode
- Visual: pulses gently when within 50 blocks of a geode
- Serves as mod onboarding — finding amethyst unlocks Tier 1 drone crafting

## Acceptance criteria
- [ ] Crystal Compass item registered and craftable at vanilla crafting table
- [ ] Compass needle points toward nearest amethyst geode in the current dimension
- [ ] Subtle particle or sound effect when within close range of a geode
- [ ] Works in all dimensions (points to nearest geode if one exists)
- [ ] Tooltip explains its purpose

## Notes
This is the zero-gate entry point to the mod. Should feel immediately useful even to players who aren't ready to build a drone yet.")
add_to_project "$URL"

URL=$(gh issue create --repo $REPO \
  --title "[FEATURE] Calibration Table — primary crafting and processing block" \
  --label "type: feature,priority: future" \
  --body "The mod's primary workstation. Used for crafting drones, processing materials, and upgrading components throughout most of the game's progression. Should feel like the Cartographer Drones equivalent of Create's Mechanical Crafter or AE2's ME Terminal — the block you always go back to.

## Design
- Single block, no multiblock required until late game
- Handles: drone assembly, Lodestone Dust grinding, Resonance Crystal charging, upgrade module crafting
- Custom GUI with drone preview panel and processing queue
- Thematic aesthetic: parchment textures, compass rose motifs, warm wood and brass

## Acceptance criteria
- [ ] Calibration Table block registered and craftable
- [ ] Basic GUI opens on right-click
- [ ] Supports shaped recipe crafting for drone assembly
- [ ] At least one processing recipe (Lodestone → Lodestone Dust)
- [ ] Block texture fits Artisan phase visual language

## Notes
The Calibration Table is introduced at Tier 1 and used through Tier 4. A second machine (Aetheric Infuser) handles apex tier processing.")
add_to_project "$URL"

URL=$(gh issue create --repo $REPO \
  --title "[FEATURE] Drone tier system — Wooden through Sovereign" \
  --label "type: feature,priority: future" \
  --body "Five drone tiers with distinct visual identities, capabilities, and crafting requirements. Each tier is a meaningful upgrade, not just a stat bump.

## Tiers
- **Wooden Drone** — da Vinci ornithopter aesthetic, warm palette, basic mapping only
- **Lodestone Drone** — metal rotors, first crystal visible in chassis, biome/structure detection
- **Gilded Drone** — gold accents, longer range, ore surface scanning, mob detection
- **Veilstone Drone** — dark and precise, Nether/End capable, AI command interface unlocked
- **Sovereign Drone** — apex tier, portal generation, combat capability, multi-drone coordination

## Crafting gate materials
- Wooden: Amethyst shards + vanilla materials at Calibration Table
- Lodestone: Lodestone Dust (processed) + Resonance Crystal shard
- Gilded: Charged Resonance Crystal + gold
- Veilstone: Veilstone (infused material)
- Sovereign: Aetheric Core (Aetheric Infuser output)

## Acceptance criteria
- [ ] All five drone entity types registered
- [ ] All five drone items registered with recipes
- [ ] Each tier has distinct speed, range, and capability parameters
- [ ] Visual distinction between tiers (model and texture)
- [ ] Tier capability gates enforced (e.g. Wooden drone cannot do ore scanning)

## Notes
Tier count may settle at 3-4 rather than 5 depending on playtesting. Keep flexible.")
add_to_project "$URL"

URL=$(gh issue create --repo $REPO \
  --title "[FEATURE] Launch Station tier system — matching station tiers" \
  --label "type: feature,priority: future" \
  --body "The Launch Station scales alongside drone tiers. Higher tier stations support more simultaneous drones, longer relay range, and more complex mission types.

## Station tiers
- **Wooden Launch Station** — 1 drone slot, basic missions
- **Lodestone Launch Station** — 2-3 drone slots, mission queuing, report log
- **Gilded Launch Station** — 4-5 slots, antenna upgrade slot, map integration panel
- **Veilstone Launch Station** — multi-drone coordination, cross-dimension relay
- **Sovereign Launch Station** — full AI command terminal, unlimited slots

## Per-tier additions beyond drone capacity
- Storage: higher tiers hold more waypoints, reports, loot returns
- Range relay: station amplifies drone operational range
- Antenna slot: upgrade block that boosts relay range further
- Mission complexity: higher stations unlock more sophisticated mission types
- Visual upgrades: each tier has a distinct aesthetic matching the drone tier

## Notes
Station tier count should match drone tier count. Both progress together.")
add_to_project "$URL"

URL=$(gh issue create --repo $REPO \
  --title "[FEATURE] Cartographer's Satchel — portable launcher for Wooden drone tier" \
  --label "type: feature,priority: future" \
  --body "A leather and parchment handheld launcher for the Wooden drone tier. Carried in inventory, launches drones tethered to the player's current position rather than a fixed block. One drone at a time.

## Design
- Inventory item, not a placed block
- Opens a small GUI: drone slot, mission radius, launch button
- Drone operates around the player's position at launch time
- Limited to Wooden drone tier — higher tiers require the Portable Launch Station
- Aesthetic: hand-stitched leather satchel, brass buckles, parchment map visible in texture

## Acceptance criteria
- [ ] Satchel item registered and craftable (leather, string, iron)
- [ ] Right-click opens GUI
- [ ] Launches drone at player position
- [ ] Returns drone to player position on mission complete
- [ ] Only accepts Wooden Drone item

## Thematic note
The Satchel belongs to the handmade Artisan phase. You wouldn't stuff a Sovereign drone into a leather satchel.")
add_to_project "$URL"

URL=$(gh issue create --repo $REPO \
  --title "[FEATURE] Portable Launch Station — mid/late tier portable launcher" \
  --label "type: feature,priority: future" \
  --body "An engineered portable launcher for mid-to-late tier drones. Unlike the Cartographer's Satchel (which is handmade and Wooden-tier only), the Portable Launch Station is a precision instrument that supports Lodestone tier and above.

## Design
- Inventory item
- Supports Lodestone through Sovereign drone tiers
- More capable than the Satchel: supports mission queuing, longer tether range
- Aesthetic: machined metal, crystal interface, compact engineering feel

## Acceptance criteria
- [ ] Portable Launch Station item registered
- [ ] Right-click opens GUI matching fixed Launch Station functionality
- [ ] Accepts Lodestone tier and above drones
- [ ] Tether follows player position dynamically during mission

## Notes
The Satchel and PLS are thematically distinct — one is artisan, one is engineered. Both serve the same portable use case for different game phases.")
add_to_project "$URL"

URL=$(gh issue create --repo $REPO \
  --title "[FEATURE] Aetheric Infuser — late game processing block" \
  --label "type: feature,priority: future" \
  --body "The second and final crafting machine added by Cartographer Drones. Handles apex tier material processing — specifically Aetheric Core production for Sovereign tier crafting.

## Design
- Single block, placed late game
- Processes Veilstone + end-game materials (Ender Pearl, Echo Shard, or similar) into Aetheric Core
- Could require proximity to specific conditions (near an End Portal frame, at night, etc.)
- Aesthetic: dark metal, Aetheric blue glow, dimensional energy feel

## Acceptance criteria
- [ ] Aetheric Infuser block registered and craftable
- [ ] At least one processing recipe producing Aetheric Core
- [ ] Custom GUI with processing progress indicator
- [ ] Distinct visual identity from Calibration Table

## Notes
One Calibration Table for most of the game, one Aetheric Infuser at the very end. Keep block count low and identity focused.")
add_to_project "$URL"

URL=$(gh issue create --repo $REPO \
  --title "[FEATURE] Drone upgrade modules — physical slottable upgrades" \
  --label "type: feature,priority: future" \
  --body "Rather than just crafting a higher tier drone, players augment their existing drone with physical upgrade modules slotted at the Calibration Table. The drone becomes a piece of gear players invest in over time.

## Design
- Upgrade modules are craftable items that slot into drone frames
- Examples:
  - Speed Coil — increases flight speed
  - Resonance Lens — improves ore/biome detection radius
  - Weatherproofing Kit — allows flight in rain/snow
  - Stealth Module — reduces mob aggro toward the drone
  - Extended Cell — increases mission range
- Drones can be named at the Calibration Table — name persists and appears in journal entries and mission reports

## Acceptance criteria
- [ ] Upgrade module system designed and documented
- [ ] At least 3 upgrade modules implemented for v1.0
- [ ] Calibration Table UI supports module slotting
- [ ] Drone stats reflect equipped modules
- [ ] Drone naming supported, name persists in NBT

## Notes
Players should feel attached to a specific named drone rather than treating them as disposable. 'Scout-1 has returned.' is more satisfying than 'Your drone has returned.'")
add_to_project "$URL"

URL=$(gh issue create --repo $REPO \
  --title "[FEATURE] Surveyor's Lens — field access to drone database" \
  --label "type: feature,priority: future" \
  --body "A mid-game handheld tool that overlays drone database information on what the player is looking at. Point it at a distant mountain and see what biomes and surface features your drones have recorded there.

## Design
- Crafted from a vanilla Spyglass + Resonance Crystal
- Right-click to look through, shows drone database overlay on terrain in view
- Displays: biome name, recorded structures, ore exposure notes, threat level if assessed
- Only shows data the drone has actually collected — unexplored areas show nothing
- Aesthetic: brass spyglass with crystal lens, compass rose engraving

## Acceptance criteria
- [ ] Surveyor's Lens item registered and craftable
- [ ] Right-click activates zoom view with database overlay
- [ ] Overlay renders recorded data for chunks in view
- [ ] Gracefully shows nothing for unrecorded chunks
- [ ] Tooltip explains dependency on drone data

## Notes
Solves the 'I can't read my drone's data while I'm out in the field' problem. The drone knows things — this tool lets you access that knowledge anywhere.")
add_to_project "$URL"

echo "=== MISSION TYPES ==="

URL=$(gh issue create --repo $REPO \
  --title "[FEATURE] Mission type — Threat Assessment" \
  --label "type: feature,priority: future" \
  --body "A pre-venture drone mission that returns a structured danger report for a target area before the player enters it.

## Design
- Player designates a target area (coordinate or waypoint)
- Drone flies through the area collecting threat data
- Returns a structured Threat Assessment report:
  - Mob density by type
  - Hostile structure presence (spawners, pillager patrols, etc.)
  - Environmental hazards (lava lakes, cliff drops)
  - Safe approach vector suggestion
- Report stored in Launch Station and optionally printed as a Field Journal entry
- Over multiple missions the threat picture becomes more detailed and accurate

## Acceptance criteria
- [ ] Threat Assessment mission type selectable in Launch Station GUI
- [ ] Drone collects mob and structure data during flight
- [ ] Structured report generated and stored on return
- [ ] Report accessible from Launch Station GUI
- [ ] Data feeds into and draws from world database over time")
add_to_project "$URL"

URL=$(gh issue create --repo $REPO \
  --title "[FEATURE] Mission type — Supply Run" \
  --label "type: feature,priority: future" \
  --body "The drone monitors a designated Supply Depot chest and autonomously restocks basic materials when supplies drop below threshold.

## Design
- Player designates a chest as Supply Depot in the Launch Station GUI
- Drone learns resource patterns by monitoring chest contents over time
- When a tracked resource drops below threshold, drone autonomously launches a supply mission
- Returns with a small but meaningful haul — not a replacement for manual farming, a background assistant
- Supported resources scale with drone tier:
  - Wooden: passive mobs only (wool, leather, eggs, feathers)
  - Lodestone+: adds wood, basic crops
  - Gilded+: adds mob drops from hostile mobs
  - Veilstone+: adds ore gathering

## Acceptance criteria
- [ ] Supply Depot designation in Launch Station GUI
- [ ] Resource threshold configuration per material
- [ ] Drone autonomously launches when threshold breached
- [ ] Returns drops to Supply Depot chest
- [ ] Mission log entry generated per supply run")
add_to_project "$URL"

URL=$(gh issue create --repo $REPO \
  --title "[FEATURE] Mission type — Escort Mode" \
  --label "type: feature,priority: future" \
  --body "The drone flies ahead of the player while traveling, updating the map in real time and flagging hazards before the player reaches them.

## Design
- Activated from Cartographer's Satchel or Portable Launch Station
- Drone maintains position 50 blocks ahead of player in direction of travel
- Updates JourneyMap/Xaero's in real time as player moves
- Flags: mob clusters, terrain drops, lava, hostile structures
- Warnings appear as temporary waypoints or HUD notifications
- Drone returns to player automatically if player stops moving for 30 seconds
- Primary use case for the Cartographer's Satchel

## Acceptance criteria
- [ ] Escort Mode activatable from portable launchers
- [ ] Drone tracks player movement direction and maintains advance position
- [ ] Real-time map reveal as drone moves ahead
- [ ] Hazard detection and notification system
- [ ] Drone returns on player idle timeout

## Notes
Makes overland travel feel fundamentally different. You're never walking blind. No other mod touches this specific experience.")
add_to_project "$URL"

URL=$(gh issue create --repo $REPO \
  --title "[FEATURE] Mission type — Remote Base Construction" \
  --label "type: feature,priority: future" \
  --body "A programmed drone arrives at a target location and executes a construction sequence from a player-defined schematic. Player arrives through a Sovereign portal to find a functioning outpost already built.

## Design
- Player defines a schematic (Litematica integration or custom schematic format)
- Drone flies to target location carrying materials from a designated chest
- Surveys terrain, adapts schematic placement to landscape (flat ground, avoids water)
- Constructs the base, places a bed, chest with supplies, crafting table
- Tier progression:
  - Gilded: simple preset structures only (small shelter)
  - Veilstone: player-defined schematics
  - Sovereign: terrain-adaptive placement, larger schematics
- Pairs with portal system — player steps through to find outpost waiting

## Acceptance criteria
- [ ] Schematic definition system designed
- [ ] Drone carries and places blocks at target location
- [ ] Basic terrain survey before placement
- [ ] Preset structure library for early tier
- [ ] Litematica compatibility investigated

## Notes
The emotional payoff is arriving through your Sovereign portal to find a functioning outpost waiting for you. Novel Minecraft experience.")
add_to_project "$URL"

URL=$(gh issue create --repo $REPO \
  --title "[FEATURE] Mission type — Combat assistance and boss support" \
  --label "type: feature,priority: future" \
  --body "Late-game drones serve as combat assistants — softening raids, assisting in boss fights, and hunting specific mobs for their drops.

## Design
- Combat capability unlocked at Gilded tier and above
- Gilded: hunts passive and neutral mobs, returns drops to Supply Depot
- Veilstone: engages hostile mobs, assists in raids, tags specific mob targets
- Sovereign: full combat drone — assists in Wither, Elder Guardian, Raid boss fights; evasion capability; ranged attack
- Pairs with Recall Flare for emergency abort
- Drone takes damage and can be destroyed — creates meaningful risk/reward

## Acceptance criteria
- [ ] Drone entity capable of targeting and damaging mobs
- [ ] Combat stats scale with drone tier
- [ ] Drone can be damaged and destroyed by mobs
- [ ] Loot return to designated chest on mission complete
- [ ] Sovereign tier capable of assisting in boss fights

## Notes
If the drone can hunt pigs it should absolutely scale into a legitimate combat tool. The drone IS the weapon at late game — cleaner design than adding a separate weapon item.")
add_to_project "$URL"

echo "=== WORLD SYSTEMS ==="

URL=$(gh issue create --repo $REPO \
  --title "[DESIGN] Drone world database — per-player spatial intelligence system" \
  --label "type: design,priority: future" \
  --body "The drone silently accumulates a per-player spatial database stored in world-saved data — not tied to any block. Persists independently of Launch Station placement or destruction.

## Design philosophy
Knowledge shouldn't be destroyable. The drone flew those chunks and saw those things — that knowledge exists regardless of whether the Station is intact. The Station is an interface to the database, not its container.

## Storage
- Minecraft world-saved data API (ServerLevel#getDataStorage)
- Stored at: data/cartographer_drones/player_{uuid}.dat
- Per-player within the world save
- Survives block destruction, player death, server restarts

## Data collected per chunk
- Biome type
- Surface structures present
- Ore exposure (surface level)
- Mob presence at time of scan
- Timestamp of last scan
- Threat assessment data if mission type was Threat Assessment
- Anomaly flags

## Progression unlock
- Early game: data collected but not queryable
- Mid game: basic queries ('show me all jungle chunks')
- Late game: full database query interface with filters
- Surveyor's Lens: field access to database while exploring

## Acceptance criteria
- [ ] World-saved data system designed and implemented
- [ ] Data collected during all drone mission types
- [ ] Per-player isolation confirmed
- [ ] Data persists across server restarts
- [ ] Query interface designed
- [ ] Surveyor's Lens reads from database

## Notes
This database is also the foundation for the GIS export feature — it IS a GIS dataset. Exporting to ArcGIS is a natural extension of a system that already exists.")
add_to_project "$URL"

URL=$(gh issue create --repo $REPO \
  --title "[FEATURE] Drone Field Journal — auto-generated mission log book" \
  --label "type: feature,priority: future" \
  --body "Every completed mission generates a Field Journal entry — an in-game written book describing what the drone found in first-person exploratory prose.

## Design
- Book auto-generates in Launch Station output slot on mission return
- Written in first-person from the drone's perspective
- Content: what was found, coordinates of notable discoveries, anomalies flagged, threats detected
- Example: 'Flew northeast 400 blocks. Encountered dense spruce forest. Located a pillager outpost at 847, 64, -203. No signs of prior looting.'
- Named drones sign their journals ('- Scout-1')
- Journals are collectible — players accumulate a library of their drone's history

## Acceptance criteria
- [ ] Journal book generated on mission complete
- [ ] Content reflects actual mission findings
- [ ] Drone name appears as author if named
- [ ] Stored in Launch Station output slot
- [ ] Multiple journal format templates for different mission types

## Notes
Collectible, lore-rich, shareable. Players will post their drone's journal entries the way they share screenshots.")
add_to_project "$URL"

URL=$(gh issue create --repo $REPO \
  --title "[FEATURE] Sovereign portal system — drone-generated dimensional portals" \
  --label "type: feature,priority: future" \
  --body "Sovereign tier drones can generate temporary portals at their mission location, allowing the player to teleport directly to the drone rather than traveling overland.

## Design
- Sovereign drone reaches target, opens a portal instead of returning
- Portal is a swirling cartographic event — maps and coordinates visible in the vortex
- Explorer's Compass-style targeting UI: compass narrows to coordinates before portal stabilizes
- Portal duration tied to drone power — finite window to step through
- Dimensional portals reflect destination visually:
  - Nether: hellish orange vortex
  - End: void black with star field
  - Twilight Forest: emerald shimmer
  - Overworld: parchment and compass rose
- Two-way: player can recall drone through same portal before it closes
- Pairs with Remote Base Construction — step through to find outpost waiting

## Acceptance criteria
- [ ] Portal entity spawns at drone location on Sovereign mission complete
- [ ] Targeting UI displayed before portal stabilizes
- [ ] Player can teleport through portal to drone location
- [ ] Portal duration is finite and configurable
- [ ] Dimensional variants have distinct visual effects
- [ ] Drone can be recalled through portal before close

## Notes
The single most cinematic feature in the mod. The portal IS the Sovereign tier's identity.")
add_to_project "$URL"

URL=$(gh issue create --repo $REPO \
  --title "[FEATURE] Relay Beacon — extends drone operational range" \
  --label "type: feature,priority: future" \
  --body "Lightweight placeable blocks that extend drone operational range. Building a relay network is a satisfying mid-game infrastructure project.

## Design
- Cheap craftable block (iron, Lodestone Dust, copper)
- Each beacon extends drone range by 500 blocks beyond it
- Drones navigate beacon-to-beacon for long range missions
- Beacons pulse with soft light when a drone passes through range — visible progress indicator
- Network expands map coverage gradually as beacons are placed further out

## Acceptance criteria
- [ ] Relay Beacon block registered and craftable
- [ ] Drone range calculation accounts for beacon positions
- [ ] Visual pulse effect when drone passes within range
- [ ] Beacon network visualized on JourneyMap as waypoints
- [ ] Multiple beacons chain correctly for extended range")
add_to_project "$URL"

URL=$(gh issue create --repo $REPO \
  --title "[FEATURE] Natural language intent parser — command interface" \
  --label "type: feature,priority: future" \
  --body "A freeform text command interface for the Launch Station that parses plain English into structured drone missions. No AI, no external dependencies — pure pattern matching that feels like talking to an intelligent assistant.

## Design philosophy
Natural language STYLE without actual AI. Works identically to any other Fabric mod — no Ollama, no API keys, no local model required. Zero external dependencies.

## Architecture
- Player types freely in a command input field in the Launch Station GUI
- Parser matches input against a library of intent patterns
- Extracts intent + parameters, executes mission
- Unrecognized inputs return helpful suggestions: 'I don't know what a blorf is — try find biome, find structure, or hunt entity'
- Failed or unrecognized commands optionally file a GitHub issue as a player feature request

## Example mappings
- 'find me a jungle' → [find] [biome: jungle]
- 'go kill some pigs' → [hunt] [entity: pig]
- 'scout north 500 blocks' → [scout] [direction: north] [range: 500]
- 'find a desert temple I haven't visited' → [find] [structure: desert_temple] [filter: unvisited]
- 'go find me diamonds' → [hunt] [ore: diamond] [depth: auto]

## Acceptance criteria
- [ ] Command input field in Launch Station GUI (Veilstone tier+)
- [ ] Intent pattern library covers all implemented mission types
- [ ] Helpful failure messages for unrecognized input
- [ ] Structured task object generated from parsed input
- [ ] Optional GitHub issue filing for unrecognized commands

## Notes
Feels like talking to an AI. Is actually a smart pattern matcher. No runtime dependencies, works offline, works in any modpack.")
add_to_project "$URL"

URL=$(gh issue create --repo $REPO \
  --title "[FEATURE] In-game bug and feature request reporter" \
  --label "type: feature,priority: future" \
  --body "Unrecognized commands and failed missions offer the player an option to report the issue directly to the mod's GitHub Issues, turning players into a QA and feature-request pipeline without leaving the game.

## Design
- Unrecognized command: 'I don't know how to do that yet — want to suggest it?' → yes → small in-game form
- Failed mission: 'Something went wrong — report this?' → posts bug report with mission parameters
- Posts to GitHub Issues API with label 'type: player-request' or 'type: player-bug'
- Player can optionally add a note before submitting
- Requires GitHub API token configured by server admin (optional feature, gracefully disabled if not configured)

## Acceptance criteria
- [ ] Report prompt shown on unrecognized command and mission failure
- [ ] GitHub Issues API integration implemented
- [ ] Player note field in report UI
- [ ] Graceful fallback if API not configured
- [ ] Rate limiting to prevent spam

## Notes
Turns players into a QA pipeline. Wake up to GitHub issues filed by players describing exactly what they tried to do.")
add_to_project "$URL"

URL=$(gh issue create --repo $REPO \
  --title "[FEATURE] Warp capability for late-game drones" \
  --label "type: feature,priority: future" \
  --body "Late-game drones can teleport/warp rather than physically flying to destinations, enabling faster operations and clean separation between work zones and base areas.

## Design
- Unlocked at Veilstone tier and above
- Use cases:
  - Warp drone past base perimeter so mining/killing happens away from built areas
  - Skip traversal time for long-distance missions
  - Cross-dimension operation without physically flying through a portal
  - Drone operates in designated work zone, not near player base
- Warp range scales with tier
- Sovereign tier: unlimited warp range including cross-dimension

## Acceptance criteria
- [ ] Warp mechanic implemented for Veilstone+ drones
- [ ] Work zone designation in Launch Station GUI
- [ ] Cross-dimension warp for Sovereign tier
- [ ] Warp animation/visual effect
- [ ] Configurable warp range per tier")
add_to_project "$URL"

echo "=== INTEGRATIONS ==="

URL=$(gh issue create --repo $REPO \
  --title "[INTEGRATION] Xaero's Minimap and World Map compatibility" \
  --label "type: integration,priority: future" \
  --body "Add map reveal support for Xaero's Minimap and Xaero's World Map as an alternative to JourneyMap.

## Design
- Soft dependency — mod works without Xaero's
- Drone-loaded chunks trigger Xaero's mapping events
- Waypoints dropped by drone missions appear on Xaero's map
- Tested with both Minimap and World Map variants

## Acceptance criteria
- [ ] Xaero's Minimap API investigated
- [ ] Chunk reveal integration implemented
- [ ] Waypoint integration implemented
- [ ] Tested alongside JourneyMap (should not conflict)
- [ ] README compatibility table updated

## Notes
Xaero's is roughly equally popular to JourneyMap. Supporting both maximizes modpack compatibility.")
add_to_project "$URL"

URL=$(gh issue create --repo $REPO \
  --title "[INTEGRATION] GeckoLib — drone entity animations" \
  --label "type: integration,priority: future" \
  --body "Add GeckoLib for entity animations — rotating rotors, bobbing flight, landing/folding animation, mission state transitions.

## Design
- GeckoLib integrates directly with Blockbench for animation authoring
- Key animations:
  - Idle: gentle rotor spin, slight hover bob
  - Active: faster rotor spin, forward lean
  - Returning: slower spin, slight tilt toward home
  - Landing: rotor deceleration, settle animation
- Each drone tier has its own animation set reflecting its aesthetic

## Acceptance criteria
- [ ] GeckoLib dependency added to build.gradle
- [ ] Wooden Drone has at least idle and active animations
- [ ] Animations transition correctly between drone states
- [ ] No performance impact confirmed

## Notes
Not required for v0.1.0. Add after core mechanic is proven working.")
add_to_project "$URL"

URL=$(gh issue create --repo $REPO \
  --title "[INTEGRATION] GIS export — ArcGIS and QGIS compatible world data export" \
  --label "type: integration,priority: future" \
  --body "Export drone-collected world data as real geospatial formats alongside JourneyMap tile exports, importable into ArcGIS Pro or QGIS as a proper layer stack.

## Design
- Export drone database as GeoJSON or Shapefile
- Data layers: biomes, structures, ore locations, mob density, threat zones, waypoints
- JourneyMap tile export as georeferenced basemap (TMS or GeoTIFF)
- Minecraft coordinate space → projected CRS (custom CRS definition for MC world space)
- Export triggered from Launch Station GUI or a dedicated Export Terminal block
- Output: a folder of files ready to open in ArcGIS Pro or QGIS

## Acceptance criteria
- [ ] GeoJSON export of drone database implemented
- [ ] JourneyMap tile export integrated as basemap
- [ ] Custom CRS definition file included in export
- [ ] Tested in ArcGIS Pro and QGIS
- [ ] Export UI in Launch Station or dedicated block

## Notes
Given the mod author's Esri background this is a genuinely notable crossover project. The drone database IS a GIS dataset — this is a natural extension of a system that already exists.")
add_to_project "$URL"

URL=$(gh issue create --repo $REPO \
  --title "[COMPANION] AE2 integration mod — autonomous resource gathering via ME network" \
  --label "type: companion,priority: future" \
  --body "A separate companion mod that integrates Cartographer Drones with Applied Energistics 2. When AE2 detects a resource below threshold, it triggers a drone mission to find and harvest that resource.

## Design
- AE2 ME network monitors resource levels via standard AE2 crafting/export system
- When wool drops below threshold: trigger drone hunt mission for sheep
- Drone returns drops directly to ME network input bus
- Drone becomes a biological/organic equivalent of an AE2 autocrafting pattern
- Supported resources: any mob drop that drone combat supports

## Acceptance criteria
- [ ] Companion mod repo created: cartographer-drones-ae2
- [ ] AE2 API dependency added
- [ ] ME network resource monitoring implemented
- [ ] Drone mission trigger from AE2 threshold event
- [ ] Loot return to ME network on mission complete

## Notes
Separate mod, separate repo, separate CurseForge/Modrinth page. Depends on both Cartographer Drones and AE2.")
add_to_project "$URL"

URL=$(gh issue create --repo $REPO \
  --title "[COMPANION] Twilight Forest compatibility mod" \
  --label "type: companion,priority: future" \
  --body "A companion mod adding drone tiers and upgrades designed for Twilight Forest dimensions and structures.

## Design
- Twilight Forest-specific drone tier or upgrade module
- Drones can operate in Twilight Forest dimension
- Structure detection for TF-specific structures (Lich Tower, Labyrinth, etc.)
- Boss combat assistance for TF bosses
- Possibly a TF-aesthetic drone skin

## Acceptance criteria
- [ ] Companion mod repo created: cartographer-drones-twilightforest
- [ ] Twilight Forest API dependency added
- [ ] Drone dimension compatibility confirmed
- [ ] TF structure detection implemented
- [ ] README lists TF mod version compatibility

## Notes
Separate mod. First of potentially many dimension-specific companion mods.")
add_to_project "$URL"

URL=$(gh issue create --repo $REPO \
  --title "[INTEGRATION] Public Java API for third-party mod integration" \
  --label "type: integration,priority: future" \
  --body "A public Java API allowing other mod developers to register custom drone mission types, hook into the world database, and add custom sensor modules.

## Design
- API jar published to Maven
- Exposes:
  - Mission type registration
  - World database read access
  - Drone state event hooks
  - Custom sensor module interface
  - Waypoint registration
- Versioned independently of main mod
- Documented with Javadoc

## Acceptance criteria
- [ ] API interfaces designed and documented
- [ ] API jar built and published to Maven
- [ ] At least one example companion mod uses the API
- [ ] Javadoc generated and linked from README
- [ ] Breaking changes follow semantic versioning

## Notes
A public API is a real professional differentiator and gets you noticed in the modding community. Other mods registering custom drone mission types is the goal.")
add_to_project "$URL"

echo ""
echo "=== Done! All backlog issues created and added to project board ==="
echo "Visit https://github.com/jwhicks727/cartographer-drones/issues to verify."
