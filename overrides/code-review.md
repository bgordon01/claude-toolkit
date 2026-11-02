## Which model the sub-agents run on (Frontier)

Spawn both review sub-agents (Standards and Spec, from "Spawn both sub-agents in parallel" above) on a cheaper model: pass `model: "sonnet"` to each Agent call. This review fans out to two agents every time, and each one re-pays its whole context on every internal step, so the model they run on is where this skill's tokens go. Reading a diff against a standards list or a spec doesn't need the main model — Sonnet handles it. Keep the aggregation (step 5) on your own model; only the two spawned reviewers change.
