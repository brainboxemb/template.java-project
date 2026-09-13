# AGENTS.md

## Repository role

`template.java-project` is the canonical minimal external reference consumer for `brainboxemb/tool.java-project`.

Keep this repository focused on generic tooling conformance. Product/domain functionality belongs elsewhere.

## Workflow

- Work issue-first on a feature branch and open a draft PR early.
- Never develop directly on `main`.
- Keep `project.yml` as the semantic tooling dependency source.
- Keep reusable GitHub workflow refs pinned to the exact commit behind the declared released tool version.
- Do not replace external-consumer proof with copied tooling implementation.
- Merge only after Linux/Windows bootstrap, build/test, canonical-artifact smoke and generated evidence are green.

## Scope

A change is appropriate here when it proves behaviour expected from ordinary Java tooling consumers: bootstrap, project profiles, Maven Wrapper/toolchain, reusable CI, test evidence, build publication or controlled tooling updates.

Do not add product architecture, timing-domain behaviour or speculative libraries merely to make the template look realistic.
