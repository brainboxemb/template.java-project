# Changelog

## Unreleased

- Adopt released `tool.java-project v0.3.1` and `tool.git-project v0.2.8` baselines.
- Replace consumer-owned Java orchestration with the shared Migration-006 production lifecycle.
- Keep `moon.yml` as consumer-owned `java.canonical` / `java.windows-full` impact declarations.
- Add selective Windows `auto|none|smoke|full` qualification and a deliberate manual override path.
- Preserve generated `bld` publication without a duplicate Maven build.
- Qualify the external-consumer owner-revision fix released in `tool.java-project v0.3.1`.

## Earlier baseline

- Establish the canonical external reference consumer for `tool.java-project v0.1.0`.
- Prove semantic project-file tooling refs together with exact immutable workflow/gitlink provenance.
- Prove Linux/Windows bootstrap, build/test, cross-platform canonical artifact smoke and readable generated test evidence.
