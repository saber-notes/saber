# Effect Pack System
**Date:** 2026-03-30
**Stage:** 24 - Live Interaction Families

## 1. EffectPreset Expansion
The `EffectPreset` model was upgraded with per-phase interaction fields:
- **Phase Colors:** `ignitionColor` (pen-down flash), `trailColor` (movement embers), `fadeColor` (motion-stop decay), `eraseColor` (dissolve feedback)
- **Intensity Knobs:** `ignitionIntensity` (0–1 flash radius), `trailDensity` (0–1 ember density), `fadeDuration` (0–1 linger time), `particleScale` (base size multiplier)
- **Pack Metadata:** `packId`, `character` flavor text

Defaults ensure backward compatibility with existing code using the old constructor.

## 2. Built-In Effect Packs (9 Effects)
| Pack | Identity | Effects |
|------|----------|---------|
| **Subtle** | Professional, quiet | Dying Ember, Ink Bloom, Frost Breath |
| **Infernal** | Theatrical fire | Hellfire, Molten Gold, Ash Fall |
| **Cyber** | Electric, synthetic | Electric Pulse, Neon Bleed |
| **Silent** | Zero FX | None |

## 3. LiveEffectEngine Integration
The `spawnIgnition` and `spawnTrail` methods now consume the active preset's phase colors and intensity knobs directly instead of hardcoded `orangeAccent`/`deepOrange`. Particle sizes scale through `particleScale × ignitionIntensity` and `particleScale × trailDensity`.

## 4. Selection UX
A **flare icon** in the Squeeze Palette opens the `EffectSelectorSheet`. Effects are presented as horizontal swatches per pack, each showing a gradient of the three phase colors (ignition → trail → fade) with descending dot sizes previewing the interaction lifecycle.

## 5. Independence & Saved Document Policy
- Effects remain strictly independent from Theme and Ink
- All particles are transient, RAM-resident, and never serialized into `.sbn2` files
- Selecting "None" from the Silent pack zeroes all particle emission
