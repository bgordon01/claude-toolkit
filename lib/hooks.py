#!/usr/bin/env python3
"""Merge or remove vendored hooks in ~/.claude/settings.json.

usage: hooks.py add    <settings.json> <claude_dir> <hooks.json>...
       hooks.py remove <settings.json>

Vendored hooks reference a project-level skill path
(${CLAUDE_PROJECT_DIR}/.claude/skills/...). We rewrite that to the global
skill path so the hook works in every repo. Every hook we add carries the
marker below in its statusMessage so it can be found and removed again.
"""
import json, os, shutil, sys, time

MARKER = " [design-discipline]"


def load(path):
    if not os.path.exists(path) or os.path.getsize(path) == 0:
        return {}
    with open(path) as f:
        return json.load(f)


def strip_ours(settings):
    hooks = settings.get("hooks", {})
    for event in list(hooks):
        groups = []
        for g in hooks[event]:
            g["hooks"] = [h for h in g.get("hooks", []) if not h.get("statusMessage", "").endswith(MARKER)]
            if g["hooks"]:
                groups.append(g)
        if groups:
            hooks[event] = groups
        else:
            del hooks[event]
    if not hooks:
        settings.pop("hooks", None)


def save(path, settings):
    if os.path.exists(path):
        backup = f"{path}.bak-design-discipline"
        if not os.path.exists(backup):
            shutil.copy2(path, backup)
    tmp = path + ".tmp"
    with open(tmp, "w") as f:
        json.dump(settings, f, indent=2)
        f.write("\n")
    os.replace(tmp, path)


def main():
    mode, path = sys.argv[1], sys.argv[2]
    settings = load(path)
    strip_ours(settings)
    added = 0
    if mode == "add":
        claude_dir, files = sys.argv[3], sys.argv[4:]
        for hf in files:
            src = load(hf).get("hooks", {})
            for event, groups in src.items():
                for g in groups:
                    for h in g.get("hooks", []):
                        if "command" in h:
                            h["command"] = h["command"].replace("${CLAUDE_PROJECT_DIR}/.claude", claude_dir)
                        h["statusMessage"] = h.get("statusMessage", event) + MARKER
                        added += 1
                    settings.setdefault("hooks", {}).setdefault(event, []).append(g)
    save(path, settings)
    print(added)


if __name__ == "__main__":
    main()
