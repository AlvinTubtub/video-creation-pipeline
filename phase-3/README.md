# Phase 3 — Profile-aware CI gates

Built + locally verified 24 Oct 2026. Staged in the pipeline bundle
(`pipeline/profile_gates.py`, `.github/workflows/gates.yml`,
`profile/profiles.json`) for Alvin's `push.command` push.

## What the gates check

`python pipeline/profile_gates.py <project_dir> [--profile FT|TE]`
(also `--profiles PATH`, `--duration SECONDS`). One line per gate;
exit 1 on any FAIL, 0 otherwise (WARNs do not fail). All thresholds are
read from `profiles.json` at runtime — see the script's `--help`.

| Gate | Rule |
|---|---|
| profile | Directory name must start `FT-` or `TE-` (or `--profile`) |
| duration | film.json scene total vs the profile's target / warn / rework bands (FT 50–55 / 48–58 / 45–60s; TE 95–115 / 90–120 / 85–125s) |
| brand | TE: "Tech Explanasyon" badge + Carla (m-kape overlay or mascot/poses/ asset) present, no Futurism text. FT: "Futurism Tech" wordmark present, no TE badge / Carla |
| closing | TE: Tagalog question (ano/alin/paano/bakit/kailan/saan/sino/kanino/ilan/gaano/kumusta + "?") THEN verbatim "Follow me for more tech explained. See yah." FT: save-bait CTA keyword ("save") |
| safe-zone | STRUCTURAL ONLY (not pixel-measured): canvas 1080×1920; caption band inside the profile safe rect (≤32px overflow = WARN); TE presenter feet at/below the safe bottom; TE stage bottom = presenter zone top − ~25px (headroom rule). Pixel checking remains `hyperframes check` + snapshot review |
| from-scan | No GSAP `.from(` tween in compositions/src. Comment-only lines, HTML-comment spans, and lines marked `gates-allow-from` are exempt. (The separate, pre-existing `spatial-film/scripts/fromto-scan.py` flags fromTo from-only properties; gates.yml runs both.) |

## Run them locally

```bash
python3 pipeline/profile_gates.py projects/TE-my-topic
python3 pipeline/profile_gates.py projects/FT-my-topic --duration 53
```

## Branch convention

Work on a branch named after the project: `FT-<slug>` or `TE-<slug>`,
with the project at `projects/<branch-name>/` (film.json + compositions/).
CI (`.github/workflows/gates.yml`) triggers on pushes to `FT-*` / `TE-*`
branches, on pull requests, and on manual dispatch (inputs: `project_dir`,
`profile`). It installs Node 22 + chrome-headless-shell system libraries
on Ubuntu 24.04 (Phase 2 lesson: Kaggle shipped Node 20; HyperFrames
0.8.117 needs ≥22; on noble the audio package is `libasound2t64`, not
`libasound2`), runs `hyperframes check`, the fromTo scan, then
`profile_gates.py`.

## When CI actually starts running

Only after TWO steps that are Alvin's, not Baet's:
1. Run `push.command` on his Mac (it `git add -A`s everything, so the new
   `pipeline/profile_gates.py`, `.github/workflows/gates.yml`,
   `profile/profiles.json`, and `phase-3/README.md` files are included).
2. Set the repo public on github.com (Settings → Danger Zone → Change
   repository visibility → Public).

Until then, the gates run locally only. Fixtures + full verification log:
`phase-3/fixtures/` and `phase-3/VERIFICATION.md` in the automation folder.
