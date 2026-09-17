# Java workflow timing

- Workflow run: `35192714047`
- Capture point: `before-generated-output-push`
- Wall clock to capture: `55 s`
- Hosted runner time to capture: `81 s`
- Started runners: `5`
- Maven reported total time: `4.323 s`

## Jobs

| Job | Runner | Result | Duration |
| --- | --- | --- | ---: |
| release-metadata | ubuntu-24.04 | success | 4 s |
| linux / Linux canonical build | ubuntu-24.04 | success | 24 s |
| windows-full / Windows compatibility build | windows-2025 | success | 41 s |
| windows-smoke / Windows canonical-artifact smoke | windows-2025 | success | 6 s |
| publish-build / Publish generated output | ubuntu-24.04 | running | 6 s |

## Steps

### release-metadata

| Step | Result | Duration |
| --- | --- | ---: |
| Set up job | success | 0 s |
| Checkout exact tagged source | success | 1 s |
| Validate VERSION, Maven version and tag | success | 0 s |
| Post Checkout exact tagged source | success | 0 s |
| Complete job | success | 0 s |

### linux / Linux canonical build

| Step | Result | Duration |
| --- | --- | ---: |
| Set up job | success | 1 s |
| Validate execution inputs | success | 0 s |
| Checkout exact consumer source | success | 1 s |
| Set up exact Java 8 baseline | success | 2 s |
| Checkout exact tool.java-project implementation | success | 1 s |
| Run canonical Java action | success | 12 s |
| Upload canonical Java artifact | success | 1 s |
| Upload prepared build publication | success | 1 s |
| Upload Linux evidence | success | 1 s |
| Post Checkout exact tool.java-project implementation | success | 0 s |
| Post Set up exact Java 8 baseline | success | 0 s |
| Post Checkout exact consumer source | success | 0 s |
| Complete job | success | 0 s |

### windows-full / Windows compatibility build

| Step | Result | Duration |
| --- | --- | ---: |
| Set up job | success | 2 s |
| Validate exact source when supplied | success | 0 s |
| Checkout exact consumer source | success | 7 s |
| Set up exact Java 8 baseline | success | 2 s |
| Validate Maven Wrapper baseline | success | 6 s |
| Verify | success | 15 s |
| Upload Windows test evidence | success | 2 s |
| Post Set up exact Java 8 baseline | success | 2 s |
| Post Checkout exact consumer source | success | 2 s |
| Complete job | success | 0 s |

### windows-smoke / Windows canonical-artifact smoke

| Step | Result | Duration |
| --- | --- | ---: |
| Set up job | success | 1 s |
| Set up exact Java 8 baseline | success | 0 s |
| Download canonical Linux artifact | success | 1 s |
| Run canonical artifact on Windows | success | 2 s |
| Post Set up exact Java 8 baseline | success | 0 s |
| Complete job | success | 0 s |

### publish-build / Publish generated output

| Step | Result | Duration |
| --- | --- | ---: |
| Set up job | success | 2 s |
| Checkout exact Java publication finalizer | success | 1 s |
| Checkout exact generic publisher implementation | success | 1 s |
| Download prepared output | success | 0 s |
| Download Java preflight evidence | skipped | 0 s |
| Collect current workflow timing | running | 1 s |
