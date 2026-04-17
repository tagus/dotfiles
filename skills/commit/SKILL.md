---
name: commit
description: >-
  Write repository-appropriate git commit messages and create the commit when requested.
---

# Commit

Use this skill to write commit messages that match the current repository's history instead of forcing one fixed style across projects.

When the user's intent is to commit, do the full job: inspect the change, draft the message, and create the commit with a non-interactive `git commit`.

## Workflow

1. Inspect the change before drafting the message.
   Use `git status --short`, `git diff --cached --stat`, and `git diff --cached` when the commit is based on staged work. If nothing is staged yet, inspect the relevant modified files and summarize only the intended scope.
2. Inspect recent history before choosing the format.
   Use `git log --format='%s%n%b%n---' -n 10` or a similar sample to infer how this repository structures subjects and bodies.
3. Mirror the repository's subject pattern.
   Reuse the project's existing scope, casing, punctuation, and tone instead of inventing a new format.
4. Write a concise imperative subject unless the repo clearly uses a different style.
   Keep it short, action-oriented, and aligned with nearby commits.
5. Add a compact body when the change is user-facing, structural, risky, or not obvious from the subject alone.
   Explain:
   - what changed
   - why the change was needed
   - briefly how it was implemented when that context helps future readers
6. Keep the body short.
   Prefer 2-4 short lines or bullets. Do not repeat the subject verbatim and do not add filler.
7. Run the relevant verification before creating the commit.
   Prefer the smallest test or check that meaningfully covers the staged change, and report if you could not run it or if it failed.
8. Commit the staged work when the user is asking you to commit.
   Prefer committing exactly what is already staged. If nothing is staged, only stage files yourself when the intended scope is explicit from the request and working tree; otherwise pause and clarify.
9. Create the commit non-interactively.
   Use a temporary file or repeated `-m` flags so the final subject and body are preserved exactly. Avoid interactive editors.

## Subject Format

- Follow the repository's existing style first.
- If the repo uses scopes, reuse them.
- If the repo does not use scopes, do not force them in.
- Match the repo's tone: straightforward, technical, and compact unless the history clearly suggests otherwise.

Examples:

```text
[ui][editor] add support for moving notes
[notes] improve the move notes method to be more robust
[ui][settings] wire up settings in the app
feat(editor): add note move shortcut
fix: preserve the latest draft during page unload
```

## Body Format

Use a blank line after the subject, then add a short body.

Preferred structure:

```text
[ui][editor] add support for moving notes

Add a move action to the editor toolbar and a modal for choosing the
destination folder so notes can be reorganized without leaving the editor.

Validate move targets in the notes handler and save dirty content before
submitting the move so the latest edits are preserved.
```

If the change is tiny and fully obvious from the subject, a body can stay very short, but non-trivial changes should still include at least a quick why.

## Style Inference Tips

- Sample at least several recent commits before drafting.
- Prefer the style used by the surrounding commits on the current branch or in the touched area.
- Preserve established subject conventions like bracketed scopes, Conventional Commits, ticket prefixes, or sentence case when the repo already uses them.
- If recent commits are inconsistent, prefer the clearest local pattern and keep the body especially useful.
- Avoid overstuffed subjects. Put the extra explanation in the body instead.

## Output

- If the user asked for a commit message only, return the final commit message in plain text ready for `git commit`.
- If the user asked you to commit, run `git commit` with the drafted message, then report the created commit hash and subject back to the user.
- In either case, include the final commit message in the response so the result is easy to inspect.
