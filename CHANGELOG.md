# Changelog

## Unreleased

## 0.1.0 — 2026-09-17

- Adopt released `tool.java-project v0.3.2` and `tool.git-project v0.2.8` baselines.
- Replace consumer-owned Java orchestration with the shared Migration-006 production lifecycle.
- Keep `moon.yml` as consumer-owned `java.canonical` / `java.windows-full` impact declarations.
- Use selective Windows qualification by event: PRs use `auto`, ordinary protected-main publication uses `none`, and manual/release qualification uses `full`.
- Retain canonical Maven execution evidence plus durable Java preflight and workflow timing evidence in generated `bld` output.
- Allow native full-Windows Maven qualification to run in parallel with the Linux canonical producer while exact Linux-artifact smoke waits for the canonical artifact.
- Cache Maven dependencies using all project/module POMs and wrapper inputs through the shared tooling contract.
- Add the first immutable template release lifecycle with exact tagged verification and `rel/vX.Y.Z/bld` publication.

## Earlier baseline

- Establish the canonical external reference consumer for `tool.java-project v0.1.0`.
- Prove semantic project-file tooling refs together with exact immutable workflow/gitlink provenance.
- Prove Linux/Windows bootstrap, build/test, cross-platform canonical artifact smoke and readable generated test evidence.
