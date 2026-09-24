# Repository agent guidance

Start with [README.md](README.md) for this repository's role as the canonical
minimal Java tooling reference consumer.

For shared BrainboxEmb working conventions, read
[brainboxemb.meta/AGENTS.md](https://github.com/brainboxemb/brainboxemb.meta/blob/main/AGENTS.md).
That shared entrypoint owns current Git/commit/PR/CI working rules and routes to
shared repository-tooling and software/Java guidance.

Do not inherit `AGENTS.md` from pinned tools or dependencies as working policy
for this repository. Exact dependency behaviour comes from this repository's
configuration/gitlinks/immutable workflow refs plus the pinned dependency's
README, docs, source and tests.

## Local role

This repository is the canonical minimal external reference consumer for
`brainboxemb/tool.java-project`.

Keep it focused on generic tooling conformance. Product/domain functionality
belongs in real consumer repositories.

Use:

- [README.md](README.md) for the consumer/tooling overview;
- [project.yml](project.yml) and [project.java.yml](project.java.yml) for the declared tooling baseline;
- the repository Maven Wrapper/POM/source/tests for the exact consumer fixture;
- live pull requests, CI and generated output for current qualification evidence.

## Consumer boundary

The template demonstrates released/qualified shared tooling; it does not become
the implementation owner of generic repository or Java tooling behaviour.

When a change belongs to `tool.git-project` or `tool.java-project`, change
and qualify that owner first. This repository should then prove the released
consumer contract.

Keep Moon limited to consumer-owned impact declarations. Maven remains Java
build/test authority.

## Qualification role

For Migration 012 this repository is the first Java consumer canary. A blank
agent should be able to discover:

- local repository role and current fixture/configuration;
- shared BrainboxEmb working conventions;
- GitHub Actions naming through shared repository-tooling guidance;
- exact pinned dependency behaviour without inheriting dependency-owner AGENTS.

Only after that path is qualified should the same guidance model roll out to
real Java product repositories.
