# Undo Push
Undo a git push by removing the commit and going back to the commit before it.

⚠️ warning!: **Double check before running. This action removes commit. You may lose data.**

## Usage

copy and commit this to `.github/workflows/undo-push.yml` in your default branch of your repository.
```yaml
name: Manual Undo Push Action
on: 
  workflow_dispatch:
    inputs:
      branch:
        description: 'Branch to undo commit'
        required: true
        default: 'master'

jobs:
  Undo:
    runs-on: ubuntu-latest
    steps: 
      - name: Checkout
        uses: actions/checkout@v2
        with:
           ref: ${{ github.event.inputs.branch }}
           fetch-depth: 0 
      - name: Undo Push
        uses: exions/undo-push@v1
        with:
          branch: ${{ github.event.inputs.branch }}
```

## How to setup this action

1. `Add file` > `Create new file`  
2. Name it `.github/workflows/undo-push.yml`
3. Commit changes.

## How to run this action

This action can trigger manually as needed. 
To undo your push,

1. Go to `Actions` at the top of your Github repository
2. Click on `Manual Undo Push Action` (or other name you have given) under `All workflows`
3. You will see `Run workflow`, click on it
4. Fill in the branch to undo the most recent push (⚠️ make sure it is correct)
5. Click `Run workflow`
6. Check your branch commit history
