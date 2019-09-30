# Git Cheat Sheet
For using Git in Groups

## Basics
#### To Get changes from others
```bash
git pull
```

#### To Send changes to others
```bash
git pull
## make sure it still works
git add <files>
git commit -m '<my message>'
git push
```

## VIM (Dark screen of confusion)
- Option 1: Learn to use VIM. Hint: `i` to switch to insert mode. `ESC` to switch out. (shift)`:` to enter a command.
- Option 2: Press `ESC` (shift)`:` `x` `ENTER`

## Errors you might see

### WHEN PUSHING...
#### _If others have made changes since you last pulled._

```plain
! [rejected]        master -> master (non-fast-forward)
error: failed to push some refs to 'https://github.com/dwolverton/delete-me.git'
hint: Updates were rejected because the tip of your current branch is behind
hint: its remote counterpart. Integrate the remote changes (e.g.
hint: 'git pull ...') before pushing again.
hint: See the 'Note about fast-forwards' in 'git push --help' for details.
```

##### Solution...
Pull then push again.

### WHEN PULLING...
#### _When you have uncommited changes and someone else has changed the same file._

```plain
error: Your local changes to the following files would be overwritten by merge:
	script.js
Please commit your changes or stash them before you merge.
```

##### Solution...
**Option 1:** Add, *commit*, then pull again. This works if you're ready to commit your changes.

**Option 2:**

```bash
git stash
git pull
git stash pop
```
No commit required.

-----
#### _When you pull or unstash (stash pop) and someone has changed the same file, but a different line._

```plain
Auto-merging script.js
Merge made by the 'recursive' strategy.
 script.js | 1 +
 1 file changed, 1 insertion(+)
```

This is not an error. It's added their changes to yours automatically.

-----
#### _When you pull and someone has changed the same line._

```plain
CONFLICT (content): Merge conflict in styles.css
Automatic merge failed; fix conflicts and then commit the result.
```

##### Solution...

Open the files listed with merge conflicts. Find the places that look like the following and fix them. Just change them to what you want them to be in the end. This includes deleting the "<<<", "===", and ">>>" lines.

```diff
<<<<<<< HEAD
    "Your change"
=======
    "Their change"
>>>>>>> 173f105d46d22ddbcbe349a74c47650135510e6d
```

Before long you should add, commit and perhaps push these fixes. But don't forget to test.

-----
#### _When you unstash (stash pop) and someone has changed the same line._

```plain
CONFLICT (content): Merge conflict in script.js
```

##### Solution...

Open the files listed with merge conflicts. Find the places that look like the following and fix them. Just change them to what you want them to be in the end. This includes deleting the "<<<", "===", and ">>>" lines.

```plain
<<<<<<< Updated upstream
    "Their change"
=======
    "Your change"
>>>>>>> Stashed changes
```