# AGENTS.md

## Repository role

`template.java-project` is the canonical minimal external reference consumer for `brainboxemb/tool.java-project`.

Keep this repository focused on generic tooling conformance. Product/domain functionality belongs elsewhere.

## Workflow

- Use one work-item number end to end: create issue `#N`, create `feature/pr-N-<short-slug>`, make the smallest initial commit, then convert that exact issue directly into draft PR `#N`; do not create a separate PR number for the same work item when issue conversion is available.
- Continue implementation and evidence in that same PR and mark it ready only when reviewable.
- Never develop directly on `main`.
- Keep `project.yml` as the semantic tooling dependency source.
- Keep reusable GitHub workflow refs pinned to the exact commit behind the declared released tool version.
- Keep `moon.yml` limited to consumer-owned impact declarations; do not copy Java lifecycle execution into the template.
- Use released `tool.java-project` production/release workflows for shared preflight, Java execution, Windows qualification and build-output preparation.
- Do not replace external-consumer proof with copied tooling implementation.
- Merge only after the relevant Migration-006 canary evidence is green: affected selection, selected Windows mode, exact-source Java execution where applicable and generated-output publication.

## Scope

A change is appropriate here when it proves behaviour expected from ordinary Java tooling consumers: bootstrap, project profiles, Maven Wrapper/toolchain, affected classification, shared reusable CI, test evidence, build publication or controlled tooling updates.

Do not add product architecture, timing-domain behaviour or speculative libraries merely to make the template look realistic.
