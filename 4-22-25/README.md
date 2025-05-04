## GitOps Workflow (Version Control with Git)

> ⚠️ **Important Guidelines**
- Only use **Git Bash** (not Command Prompt or PowerShell).
- **Do NOT work from OneDrive directories** — this can cause permission and syncing issues.

### 📁 Basic CLI Commands (Git Bash)

| Command       | Description                                 |
|---------------|---------------------------------------------|
| `pwd`         | Print the current working directory         |
| `ls`          | List contents of the current directory      |
| `cd`          | Change into a directory                     |
| `cd ..`       | Move up one directory level                 |
| `cd ../..`    | Move up two levels                          |
| `mkdir`       | Create a new directory                      |
| `rmdir`       | Remove an empty directory                   |
| `touch`       | Create a new file                           |
| `cp`          | Copy files or directories                   |
| `mv`          | Move or rename files/directories            |
| `rm`          | Delete files or directories                 |
| `cat`         | Display contents of a file                  |
| `nano`        | Open a file in the Nano text editor         |
| `chmod`       | Change file permissions                     |
| `chown`       | Change file owner/group                     |
| `echo`        | Output text or variables to terminal        |
| `clear`       | Clear the terminal screen                   |

> Example working directory path:

---

### 🚀 Git Workflow Options

#### ✅ Option 1: Cloning an Existing Repo

```bash
git clone https://github.com/thomas065/sample1.git
```

OR

```bash
echo "# sample1" >> README.md
git init
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin https://github.com/thomas065/<repo-name>.git
git push -u origin main
```

OR

```bash
git remote add origin https://github.com/thomas065/<repo-name>.git
git branch -M main
git push -u origin main
```

