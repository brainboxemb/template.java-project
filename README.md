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

tool.java-project release   v0.3.1
exact Java tool commit      4969c1316ca7dd3e2648e4098eccf2d5e7dd37d9
Java                        Eclipse Temurin 8.0.504+1
Maven                       3.9.16
Maven Wrapper               3.3.4
```

`project.yml` uses the semantic Java tooling ref `v0.3.1`. Committed gitlinks and reusable workflow callers use the exact commits behind the released baselines. This combines readable release intent with immutable execution provenance.

## What this repository proves

The consumer owns only its triggers, permissions, impact declarations and project-specific artifact inputs. The generic Java execution lifecycle is owned by released `tool.java-project`.

The shared production path proves:

- one exact base-to-head affected preflight before Java runtime allocation;
- README-only/unrelated changes stop before JDK, Maven, Windows and build publication;
- ordinary affected Java changes resolve `windows-mode: auto` to Windows `smoke`;
- Windows smoke runs the exact Linux-produced runnable JAR without a second Maven build;
- build/toolchain/workflow-sensitive changes resolve `auto` to `full`;
- `full` adds independent native Windows Maven `verify` and retains exact-artifact smoke;
- a deliberate manual `full` override is available through `workflow_dispatch`;
- one canonical Linux Maven producer creates the artifact, tests and provenance evidence;
- generated build publication reuses that prepared producer output and does not rebuild Maven output;
- generated output is published to `dev/pr-N/bld` and `prod/bld`;
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
  --publication-artifact target/template-java-project-0.1.0-SNAPSHOT.jar
java -jar bld/artifacts/template-java-project-0.1.0-SNAPSHOT.jar
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
```

The generated tree contains selected canonical artifacts plus producer evidence such as:

```text
artifacts/
  template-java-project-0.1.0-SNAPSHOT.jar

evidence/
  toolchain-build-provenance.txt
  executions/java-canonical/
    execution.json
    execution.log
  tests/

README.md
source-sha.txt
```

The generated `README.md` is the human-facing evidence map. `source-sha.txt` and the common producer execution envelope identify the exact Java source that produced the retained output.

## Scope rule

Keep this repository deliberately boring. Add a test here only when it proves a generic Java project-tooling contract that should work for every suitable consumer. Product-specific architecture, services, dependencies and integration scenarios belong in real product repositories instead.
