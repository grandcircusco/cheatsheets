# Some quick bash shell commands

Tip: Remember folders used to be called directories! Learn both words

Tip: Know where your home directory is. On Windows it's /c/Users/fred (replace fred with your username)

Tip: Your home directory has a shorthand, the tilde character, ~ (usually the upper-leftmost key on the keyboard)

Tip: Create a main development folder somewhere on your computer that is NOT in your OneDrive area! Memorize this folder name so you can quickly get to it.

## cd command - Change directory

cd stands for "change directory"

Go straight to a directory:
```bash
cd /c/Users/fred
```

Go to the "root" directory, the very top:
```bash
cd /
```

Go to your home directory using the shortcut:
```bash
cd ~
```

Go to a directory inside your home directory:

```bash
cd ~/Downloads
```

Note: Typing cd without any parameters will take you to your home directory!

```bash
cd
```

Go to the last directory you were in:

```bash
cd -
```

Go up one directory:

```bash
cd ..
```

# mkdir command - Make Directory

This is one of the few bash commands that isn't two letters!


# ls command - Show directory listing

```bash
ls
```

By default "hidden" files (files that start with a dot) don't show up. To show all files, including hidden files, tack on -a:

```bash
ls -a
```

To show the listing in a long format that includes file sizes and dates, add on -l:

```bash
ls -l
```

To show the listing long format including hidden files, add l and a together:

```bash
ls -la
```

