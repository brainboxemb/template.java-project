# Java workflow timing

- Workflow run: `35192557796`
- Capture point: `before-generated-output-push`
- Wall clock to capture: `44 s`
- Hosted runner time to capture: `39 s`
- Started runners: `3`
- Selected Windows mode: `none`
- Java/Moon decision action: `4 s`
- Maven reported total time: `7.911 s`

## Jobs

| Job | Runner | Result | Duration |
| --- | --- | --- | ---: |
| java-production / Java affected preflight | ubuntu-24.04 | success | 13 s |
| java-production / Java execution / Linux canonical build | ubuntu-24.04 | success | 21 s |
| publish-build / Publish generated output | ubuntu-24.04 | running | 5 s |

## Steps

### java-production / Java affected preflight

| Step | Result | Duration |
| --- | --- | ---: |
| Set up job | success | 1 s |
| Validate policy inputs | success | 0 s |
| Checkout exact consumer source | success | 1 s |
| Fetch exact affected-analysis base | success | 1 s |
| Checkout exact generic affected owner | success | 1 s |
| Checkout exact Java preflight owner | success | 0 s |
| Resolve Java and Windows impact once | success | 4 s |
| Upload preflight evidence | success | 1 s |
| Post Checkout exact Java preflight owner | success | 0 s |
| Post Checkout exact generic affected owner | success | 0 s |
| Post Checkout exact consumer source | success | 0 s |
| Complete job | success | 0 s |

### java-production / Java execution / Linux canonical build

| Step | Result | Duration |
| --- | --- | ---: |
| Set up job | success | 1 s |
| Validate execution inputs | success | 0 s |
| Checkout exact consumer source | success | 1 s |
| Set up exact Java 8 baseline | success | 1 s |
| Checkout exact tool.java-project implementation | success | 0 s |
| Run canonical Java action | success | 13 s |
| Upload canonical Java artifact | success | 0 s |
| Upload prepared build publication | success | 1 s |
| Upload Linux evidence | success | 1 s |
| Post Checkout exact tool.java-project implementation | success | 0 s |
| Post Set up exact Java 8 baseline | success | 1 s |
| Post Checkout exact consumer source | success | 0 s |
| Complete job | success | 0 s |

### publish-build / Publish generated output

| Step | Result | Duration |
| --- | --- | ---: |
| Set up job | success | 1 s |
| Checkout exact Java publication finalizer | success | 1 s |
| Checkout exact generic publisher implementation | success | 1 s |
| Download prepared output | success | 1 s |
| Download Java preflight evidence | running | 1 s |
