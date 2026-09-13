# template.java-project

Canonical minimal external reference consumer for [`brainboxemb/tool.java-project`](https://github.com/brainboxemb/tool.java-project).

This repository is intentionally small. Its job is to prove that a **released** Java project-tooling baseline works from a clean, separate repository. It is not a product framework and should not accumulate domain-specific application behaviour.

## Reference-consumer role

The Java project family uses three evidence levels:

```text
tool.java-project
  internal fixture tests for fast tooling feedback

          ↓ released tooling contract

template.java-project
  minimal external conformance/reference consumer

          ↓ proven external contract

real Java repositories
  product-specific implementation and realistic integration evidence
```

Current tooling baseline:

```text
tool.java-project release   v0.1.0
exact release commit        3dd4b176956513948c601ec9cf95f09f6f21712a
Java                        Eclipse Temurin 8.0.504+1
Maven                       3.9.16
Maven Wrapper               3.3.4
```

`project.yml` deliberately uses the semantic tooling ref `v0.1.0`. The committed gitlink and reusable GitHub workflow callers use the exact commit behind that tag. This combines a human-readable release baseline with immutable execution provenance.

## What this repository proves

A normal PR/main build proves:

- clean checkout without recursively preloading submodules;
- `tool.git-project` bootstrap on Linux and Windows;
- resolution of released `tool.java-project v0.1.0` through the project-file model;
- exact tool commit agreement after bootstrap;
- Java 8 / Maven Wrapper baseline;
- Linux canonical Maven verify and runnable JAR production;
- independent Windows Maven verify;
- Windows execution of the exact JAR built on Linux;
- readable Surefire summary generated from the original XML without rerunning tests;
- generated build publication to `dev/pr-N/bld` and `prod/bld`.

## Local use

A normal clone does not require `--recurse-submodules`.

Linux/POSIX:

```bash
git clone https://github.com/brainboxemb/template.java-project.git
cd template.java-project
./bootstrap.sh
./mvnw verify
java -jar target/template-java-project-0.1.0-SNAPSHOT.jar
```

Windows:

```powershell
git clone https://github.com/brainboxemb/template.java-project.git
cd template.java-project
.\bootstrap.ps1
.\mvnw.cmd verify
java -jar target\template-java-project-0.1.0-SNAPSHOT.jar
```

Expected application output:

```text
template.java-project OK
```

Use `update-repo.sh` / `update-repo.ps1` only when deliberately moving the declared tooling release forward.

## Generated evidence

The released reusable tooling publishes canonical build output as:

```text
pull request #N  -> dev/pr-N/bld
main             -> prod/bld
```

The generated tree contains the selected JAR, build provenance, raw Surefire evidence and a readable `evidence/tests/README.md` summary.

## Scope rule

Keep this repository deliberately boring. Add a test here only when it proves a generic Java project-tooling contract that should work for every suitable consumer. Product-specific architecture, services, dependencies and integration scenarios belong in real product repositories instead.
