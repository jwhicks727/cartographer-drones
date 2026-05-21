#!/bin/bash
# Cartographer Drones — GitHub Issues Setup
# Run from anywhere after: gh auth login
# Targets: github.com/jwhicks727/cartographer-drones

REPO="jwhicks727/cartographer-drones"

echo "=== Creating labels ==="
gh label create "type: setup"        --color "e4e669" --description "Project scaffolding and infrastructure" --repo $REPO
gh label create "type: feature"      --color "0075ca" --description "New gameplay feature" --repo $REPO
gh label create "type: integration"  --color "7057ff" --description "Third-party mod integration" --repo $REPO
gh label create "type: bug"          --color "d73a4a" --description "Something isn't working" --repo $REPO
gh label create "type: docs"         --color "0052cc" --description "Documentation" --repo $REPO
gh label create "priority: critical" --color "b60205" --description "Blocks all other work" --repo $REPO
gh label create "priority: high"     --color "e11d48" --description "Core to the milestone" --repo $REPO
gh label create "priority: low"      --color "c5def5" --description "Nice to have" --repo $REPO
gh label create "milestone: v0.1.0"  --color "1d76db" --description "Belongs to v0.1.0" --repo $REPO

echo "=== Creating milestone ==="
gh api repos/$REPO/milestones \
  --method POST \
  --field title="v0.1.0 — Core Mechanic" \
  --field description="Bare-bones skeleton. A single Cartographer Drone entity launches from a Launch Station, explores the world by loading chunks via a sliding window, and triggers JourneyMap to reveal the map in real time. Drone returns to base on completion. No tiers, no aesthetics, no config UI — just the core loop working end-to-end."

echo "=== Creating issues ==="

gh issue create --repo $REPO \
  --title "[SETUP] Initialize Fabric mod project with Gradle" \
  --label "type: setup,priority: critical,milestone: v0.1.0" \
  --milestone "v0.1.0 — Core Mechanic" \
  --body "Scaffold the initial Fabric mod project using the official Fabric mod template.

## Acceptance criteria
- [ ] Repo exists at github.com/jwhicks727/cartographer-drones
- [ ] Project generated from https://fabricmc.net/develop/template/
- [ ] \`gradle.properties\` set:
  - \`mod_version=0.1.0-alpha\`
  - \`maven_group=io.github.jwhicks727\`
  - \`archives_base_name=cartographer-drones\`
  - \`minecraft_version=1.21.x\` (latest stable)
- [ ] \`fabric.mod.json\` complete with mod ID \`cartographer_drones\`, name, description, author, license, contact links
- [ ] \`.gitignore\` covers Gradle build artifacts, \`.idea/\`, \`*.iml\`
- [ ] Project builds cleanly: \`./gradlew build\` passes with no errors
- [ ] Initial commit pushed to \`main\`
- [ ] README.md present

## Notes
Use the Fabric template generator at https://fabricmc.net/develop/template/
Target Java 21. Use Mojang mappings (recommended for readability). Document mapping choice in a comment on this issue before closing."

gh issue create --repo $REPO \
  --title "[SETUP] Configure GitHub repository settings and branch protection" \
  --label "type: setup,priority: high,milestone: v0.1.0" \
  --milestone "v0.1.0 — Core Mechanic" \
  --body "Lock in professional repo hygiene before development begins.

## Acceptance criteria
- [ ] \`main\` branch is protected — no direct pushes, require PR
- [ ] Default branch is \`main\`
- [ ] Issues and Projects enabled
- [ ] GitHub Project created: \"Cartographer Drones Roadmap\"
  - Columns: Backlog / v0.1.0 / In Progress / Done
  - All v0.1.0 issues added to the board
- [ ] CHANGELOG.md created (Keep a Changelog format — https://keepachangelog.com)
- [ ] CONTRIBUTING.md created with basic PR guidance
- [ ] LICENSE created (MIT)

## Notes
Branch protection can be relaxed while solo — the value is building the habit and having the config ready when collaborators join."

gh issue create --repo $REPO \
  --title "[SETUP] Configure GitHub Actions CI — build on push" \
  --label "type: setup,priority: high,milestone: v0.1.0" \
  --milestone "v0.1.0 — Core Mechanic" \
  --body "Automated build verification on every push to main and on PRs.

## Acceptance criteria
- [ ] \`.github/workflows/build.yml\` created
- [ ] Workflow triggers on: push to \`main\`, pull_request to \`main\`
- [ ] Workflow steps:
  - Checkout repo
  - Set up Java 21 (temurin distribution)
  - Cache Gradle dependencies
  - Run \`./gradlew build\`
- [ ] Badge added to README showing build status
- [ ] Workflow passes on first run

## Notes
Do not include automated publish to CurseForge/Modrinth yet — that comes later when there is something worth publishing.
Reference: https://github.com/actions/setup-java"

gh issue create --repo $REPO \
  --title "[FEATURE] Cartographer Drone — basic entity registration" \
  --label "type: feature,priority: critical,milestone: v0.1.0" \
  --milestone "v0.1.0 — Core Mechanic" \
  --body "Implement the Cartographer Drone as a registered, spawnable Fabric entity. No flight logic yet — just a clean entity that exists in the world.

## Acceptance criteria
- [ ] \`CartographerDroneEntity\` class created, extends appropriate Fabric/Minecraft entity base
- [ ] Entity registered in \`cartographer_drones\` namespace as \`cartographer_drones:cartographer_drone\`
- [ ] Entity spawns in world without crashing (via \`/summon\` command)
- [ ] Placeholder model renders (resized cube is fine — aesthetics come later)
- [ ] Entity has a data-tracked state field for: IDLE, ACTIVE, RETURNING
- [ ] Entity despawns cleanly with no orphaned chunk tickets on removal

## Out of scope
Flight, pathfinding, chunk loading, JourneyMap integration — separate issues."

gh issue create --repo $REPO \
  --title "[FEATURE] Cartographer Drone — autonomous flight and state machine" \
  --label "type: feature,priority: critical,milestone: v0.1.0" \
  --milestone "v0.1.0 — Core Mechanic" \
  --body "Give the Cartographer Drone autonomous flight behavior with a simple state machine.

## Acceptance criteria
- [ ] Drone moves autonomously after being set to ACTIVE state
- [ ] Movement follows a spiral/expanding search pattern from launch point
- [ ] Drone maintains a consistent Y-level (hardcoded default: Y=80 for v0.1.0)
- [ ] Drone transitions to RETURNING when mission radius is reached or max flight time elapses
- [ ] Drone navigates back to stored launch position when RETURNING
- [ ] Drone transitions to IDLE when it reaches launch position
- [ ] Movement is server-side — client receives position updates via normal entity sync

## Notes
Obstacle avoidance is out of scope for v0.1.0. Focus on the state machine and return-to-base loop."

gh issue create --repo $REPO \
  --title "[FEATURE] Chunk loading — sliding window chunk tickets as drone moves" \
  --label "type: feature,priority: critical,milestone: v0.1.0" \
  --milestone "v0.1.0 — Core Mechanic" \
  --body "The drone's core mechanic: as it moves, it loads a small window of chunks around its position, then releases them as it moves on. Memory footprint stays flat regardless of mission distance.

## Design: sliding window
The drone maintains chunk load tickets only for a small radius (e.g. 3x3 chunks) around its current position. As the drone moves forward, new chunks at the frontier are ticketed and old chunks behind it are released. JourneyMap captures render data the moment a chunk is loaded — it does not need the chunk to remain loaded after mapping. This keeps server memory impact constant across the entire mission.

## Acceptance criteria
- [ ] Drone acquires chunk load tickets for a small fixed radius around current position
- [ ] Tickets are at an appropriate level for full world generation (TICKING or equivalent)
- [ ] Tickets at the trailing edge are released as the drone advances (sliding window, not accumulating)
- [ ] All remaining chunk tickets are forcibly released when drone entity is removed or transitions to IDLE
- [ ] No ticket leak confirmed: server chunk count returns to baseline after mission completes
- [ ] Tickets also released cleanly on server stop
- [ ] Server memory footprint confirmed flat across a 500-block test mission

## Notes
This is the highest-risk issue in v0.1.0. Test thoroughly. A drone flying 500 blocks should hold no more loaded chunks at the end of its mission than at the start."

gh issue create --repo $REPO \
  --title "[INTEGRATION] JourneyMap — trigger map render as drone loads chunks" \
  --label "type: integration,priority: critical,milestone: v0.1.0" \
  --milestone "v0.1.0 — Core Mechanic" \
  --body "Integrate with the JourneyMap API so chunks loaded by the drone are rendered to the player's map in real time.

## Acceptance criteria
- [ ] JourneyMap API added as a soft dependency in \`fabric.mod.json\` and \`build.gradle\`
- [ ] Integration is fully conditional — mod loads and functions without JourneyMap present
- [ ] When JourneyMap is absent, drone operates in blind scout mode (chunks load and unload, no map render)
- [ ] When JourneyMap is present, drone-loaded chunks trigger a JourneyMap mapping event for the owning player
- [ ] Map reveal occurs in real time as drone moves — not batched on return
- [ ] Tested with both JourneyMap Unlimited and FairPlay editions

## References
- JourneyMap API docs: https://teamjourneymap.github.io/JourneyMapAPI/
- JourneyMap API GitHub: https://github.com/TeamJourneyMap/JourneyMapAPI

## Notes
JourneyMap is client-side. The mapping trigger must reach the correct client. Review the API event model carefully before implementing — this is the second highest-risk issue in v0.1.0.

Xaero's Minimap integration is planned for a future milestone and is out of scope here."

gh issue create --repo $REPO \
  --title "[FEATURE] Launch Station — block, BlockEntity, and launch GUI" \
  --label "type: feature,priority: high,milestone: v0.1.0" \
  --milestone "v0.1.0 — Core Mechanic" \
  --body "Implement the Launch Station as a placeable block with a functional GUI for launching drone missions.

## Acceptance criteria
- [ ] \`LaunchStationBlock\` registered as \`cartographer_drones:launch_station\`
- [ ] Block has a BlockEntity (\`LaunchStationBlockEntity\`)
- [ ] Crafting recipe added (iron + compass, shaped or shapeless)
- [ ] Right-click opens a GUI (ScreenHandler + Screen)
- [ ] GUI contains:
  - Drone inventory slot (accepts Cartographer Drone item)
  - Mission radius selector (hardcoded options: 100 / 250 / 500 blocks)
  - Launch button
  - Status display: IDLE / ACTIVE / RETURNING
- [ ] Launch button spawns the drone entity at the station position and sets status to ACTIVE
- [ ] Station returns to IDLE when drone returns and despawns
- [ ] Placeholder texture acceptable — visual polish comes with tier system in a later milestone

## Thematic note
The Launch Station is the fixed, infrastructural launcher. A portable variant is planned in two forms:
- **Cartographer's Satchel** — leather/handmade, for the Wooden drone tier, carried on your person
- **Portable Launch Station** — engineered, for mid-to-late tier drones
These are future milestones and out of scope here."

gh issue create --repo $REPO \
  --title "[FEATURE] Cartographer Drone — craftable item and recipe" \
  --label "type: feature,priority: high,milestone: v0.1.0" \
  --milestone "v0.1.0 — Core Mechanic" \
  --body "The drone needs to exist as a craftable item that slots into the Launch Station.

## Acceptance criteria
- [ ] \`CartographerDroneItem\` registered as \`cartographer_drones:cartographer_drone\`
- [ ] Item is inserted into the Launch Station GUI slot to enable launching (not used directly from hand in v0.1.0)
- [ ] Crafting recipe uses vanilla materials only: iron ingots, string, compass
- [ ] Recipe registered and visible in recipe book
- [ ] Placeholder item texture (flat colored icon is fine)
- [ ] Item tooltip: brief description of function

## Notes
Custom materials (Lodestone Dust etc.) come with the tier system in a later milestone. Keep this recipe simple and accessible for v0.1.0 testing."

gh issue create --repo $REPO \
  --title "[DOCS] Write v0.1.0 wiki — Getting Started page" \
  --label "type: docs,priority: low,milestone: v0.1.0" \
  --milestone "v0.1.0 — Core Mechanic" \
  --body "A minimal Getting Started page so modpack builders and early testers know how to use v0.1.0.

## Acceptance criteria
- [ ] GitHub Wiki enabled on the repo
- [ ] Getting Started page covers:
  - Installation and dependencies (Fabric API, JourneyMap)
  - Crafting the Cartographer Drone and Launch Station
  - Launching a first mission
  - What to expect (JourneyMap reveal behavior, blind scout mode without JourneyMap)
  - Performance characteristics (sliding window chunk loading, flat memory footprint)
  - Known limitations of v0.1.0
- [ ] Page links to README, Modrinth, and CurseForge pages

## Notes
Write this last — after issues 4–9 are closed and the mechanic is confirmed working. Document what actually shipped, not what was planned."

echo ""
echo "=== Done! ==="
echo "Labels, milestone, and 10 issues created."
echo ""
echo "Next steps:"
echo "  1. Visit https://github.com/$REPO/issues to verify"
echo "  2. Create the GitHub Project board manually (Roadmap > New Project)"
echo "  3. Add all v0.1.0 issues to the board"
echo "  4. Go to fabricmc.net/develop/template to scaffold the mod project"
