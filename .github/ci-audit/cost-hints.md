# CI Cost Hints for iamdrewfortini/DiatonicVisuals-SharePoint-IA

Failed runs (window): 4

## Longest failing jobs (minutes)
-   5.07m  Dependabot  labels=['ubuntu-latest']  run=https://github.com/iamdrewfortini/DiatonicVisuals-SharePoint-IA/actions/runs/18148736025
-   4.98m  Dependabot  labels=['ubuntu-latest']  run=https://github.com/iamdrewfortini/DiatonicVisuals-SharePoint-IA/actions/runs/19388065766
-    4.7m  Dependabot  labels=['ubuntu-latest']  run=https://github.com/iamdrewfortini/DiatonicVisuals-SharePoint-IA/actions/runs/17699321327
-   4.53m  Dependabot  labels=['ubuntu-latest']  run=https://github.com/iamdrewfortini/DiatonicVisuals-SharePoint-IA/actions/runs/18849004731

## Recommendations
- Add concurrency + cancel-in-progress to long-lived workflows (prevents duplicate runs)
- Add on:push paths filters to skip docs-only or non-code changes
- Consider scheduled workflows cadence (weekly/monthly instead of daily)
- Increase cache hit rates (setup-node/setup-python + actions/cache with lockfiles)
- Timeouts: set step/job-level timeouts to prevent runaway costs
- Reduce matrix size or shard by priority (nightly full matrix, PRs minimal)
