# template.java-project

Canonical minimal external reference consumer for [`brainboxemb/tool.java-project`](https://github.com/brainboxemb/tool.java-project).

This repository is intentionally small. Its job is to prove that released Java and repository-orchestration tooling works from a clean, separate repository. It is not a product framework and should not accumulate domain-specific application behaviour.

## Reference-consumer role

The Java project family uses three evidence levels:

```text
tool.git-project + tool.java-project
  owner tests for orchestration and Java domain tooling

          ↓ released tooling contracts

template.java-project
  minimal external conformance/reference consumer

          ↓ proven external contract

real Java repositories
  product-specific implementation and realistic integration evidence
```

Current tooling baseline:

```text
tool.git-project release    v0.2.8
exact Git commit            7c43f37e7b07cfb57638a1d1dad2501de09ba7eb
Moon                        2.5.4

tool.java-project release   v0.3.2
exact Java tool commit      c0ca2e1365a64bc626ca331a8170d13340ae0b36
Java                        Eclipse Temurin 8.0.504+1
Maven                       3.9.16
Maven Wrapper               3.3.4
```

`project.yml` uses the semantic Java tooling ref `v0.3.2`. Committed gitlinks and reusable workflow callers use the exact commit behind that released baseline. This combines readable release intent with immutable execution provenance.

## What this repository proves

The consumer owns only its triggers, permissions, impact declarations and project-specific artifact inputs. The generic Java execution lifecycle is owned by released `tool.java-project`.

The shared production path proves:

- one exact base-to-head affected preflight before Java runtime allocation;
- README-only/unrelated changes stop before JDK, Maven, Windows and build publication;
- pull requests use `windows-mode: auto`;
- ordinary affected Java PRs resolve `auto` to Windows `smoke`;
- Windows smoke runs the exact Linux-produced runnable JAR without a second Maven build;
- build/toolchain/workflow-sensitive PRs resolve `auto` to `full`;
- `full` starts independent native Windows Maven `verify` in parallel with the Linux canonical producer and retains exact-artifact smoke after Linux completes;
- ordinary protected-`main` publication uses `windows-mode: none` because the source has already passed the required PR qualification;
- deliberate manual qualification defaults to `full` and may explicitly select `auto|smoke|none`;
- release-tag qualification always performs exact-source Linux, native full-Windows Maven verification and exact Linux-artifact smoke;
- one canonical Linux Maven producer creates the artifact, tests and provenance evidence;
- generated build publication reuses that prepared producer output and does not rebuild Maven output;
- generated build output retains current preflight/orchestration and workflow timing evidence next to producer evidence;
- generated output is published to `dev/pr-N/bld`, `prod/bld` and `rel/vX.Y.Z/bld`;
- generic cleanup removes `dev/pr-N/bld` when a pull request closes.

`moon.yml` is intentionally only the consumer-owned impact declaration. Maven remains Java build/test authority and `tool.java-project` owns the shared execution lifecycle.

## Impact declarations

The template declares two capabilities:

```text
java.canonical
  all changes that require Java execution

java.windows-full
  narrower build/toolchain/workflow/platform-sensitive changes
  that require native Windows Maven qualification
```

Ordinary changes under `src/main/**` or `src/test/**` affect `java.canonical` but not `java.windows-full`. Build configuration, wrapper, lifecycle workflow and tooling-contract changes affect both. `README.md` affects neither.

## Local use

A normal clone does not require `--recurse-submodules`.

Linux/POSIX:

```bash
git clone https://github.com/brainboxemb/template.java-project.git
cd template.java-project
./bootstrap.sh
bash tools/tool.java-project/java-project.sh canonical \
  --working-directory . \
  --java-version '8.0.504+1' \
  --maven-version '3.9.16' \
  --maven-wrapper-version '3.3.4' \
  --test-report-path 'target/surefire-reports/**' \
  --source-revision "$(git rev-parse HEAD)" \
  --repository brainboxemb/template.java-project \
  --publication-root bld \
  --publication-artifact target/template-java-project-0.1.0.jar
java -jar bld/artifacts/template-java-project-0.1.0.jar
```

Windows bootstrap remains available through:

```powershell
.\bootstrap.ps1
```

Expected application output:

```text
template.java-project OK
```

Use `update-repo.sh` / `update-repo.ps1` only when deliberately moving a declared tooling release forward.

## Generated evidence

Verified canonical output is published as:

```text
pull request #N  -> dev/pr-N/bld
main             -> prod/bld
release vX.Y.Z   -> rel/vX.Y.Z/bld
```

The generated tree contains selected canonical artifacts plus producer and orchestration evidence such as:

```text
artifacts/
  template-java-project-0.1.0.jar

evidence/
  toolchain-build-provenance.txt
  executions/java-canonical/
    execution.json
    execution.log
  tests/

orchestration/
  preflight/
    decision.json
    preflight.log
    affected/
  timing.json
  timing.md

README.md
source-sha.txt
```

The canonical `execution.log` is the retained Maven/build log. The preflight tree records the current base/head affected decision and selected Windows mode. `timing.md` and `timing.json` make real Maven/build time distinguishable from runner, setup and publication overhead.

## Release

`VERSION`, the root Maven version and the matching `CHANGELOG.md` section define a template release. A release request may tag only an already-qualified exact `main` commit. The tag is then verified independently by `.github/workflows/release-verify.yml`; only a green tagged run may publish `rel/vX.Y.Z/bld` and complete the GitHub Release.

## Scope rule

Keep this repository deliberately boring. Add a test here only when it proves a generic Java project-tooling contract that should work for every suitable consumer. Product-specific architecture, services, dependencies and integration scenarios belong in real product repositories instead.
