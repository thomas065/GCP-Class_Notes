# Git Commands Notes

## Repository
A repository is essentially a centralized storage location for all the files and the history of changes to those files for a particular project. It allows tracking modifications over time and facilitates collaboration among multiple developers.

## Git Clone
When you use `git clone`, you're essentially doing three things:
1. **Downloading all files** from the repository (code, documentation, etc.).
2. **Copying the entire history of changes**—this means you get all previous commits, not just the latest version.
3. **Setting up a connection** to the original repository, so you can easily pull updates or push changes (if you have permission).

### Command:
```bash
git clone <repository-url>
```