# XScrabble-FR Development Notes

This file contains helpful information about the repository setup, build process, and release workflow for the xscrabble-fr project. These notes are meant for maintainers and can be referred to when making changes or creating new releases.

## Repository Setup

The repository was initialized with:

```bash
# Initialize repository and set main branch
git init
git branch -m main

# Add initial files
git add .

# Create initial commit with conventional commits format
git commit --no-gpg-sign -m "feat: initial setup of xscrabble-fr with ODS8 dictionary"
```

## GitHub Repository Creation

The GitHub repository was created and configured with:

```bash
# Create GitHub repository and push initial commit
gh repo create xscrabble-fr --public \
    --description "French adaptation of XScrabble with ODS8 dictionary and full French UI for X-Window systems" \
    --source=. --remote=origin --push

# Add topics for better discoverability
gh repo edit --add-topic "scrabble,x11,game,french,dictionary,ods8,unix,linux"
```

## Adding Collaborators

Collaborators can be added to the repository using GitHub's API:

```bash
# Add a collaborator with admin permissions
gh api --method PUT repos/{owner}/xscrabble-fr/collaborators/{username} -f permission=admin
```

## Building the Dictionary

The French Scrabble dictionary is downloaded from a GitHub repository and compressed:

```bash
# Download the dictionary if it doesn't exist
make fetch-dictionary

# Create the compressed dictionary
make lib/ODS8.gz
```

## Creating Releases

Releases can be created with GitHub's CLI tool:

```bash
# Build the release tarball
make release

# Create a GitHub release and attach the tarball
gh release create v1.0.0 \
    --title "XScrabble French v1.0.0" \
    --notes "Initial release of the French language pack for XScrabble with ODS8 dictionary" \
    release/xscrabble_fr.tar.gz
```

## Directory Structure

The release tarball follows this structure:

```
xscrabble_fr/
├── app-defaults/
│   └── XScrabble_fr       # X11 resource file with French UI elements
└── lib/
    ├── ODS8.gz            # Compressed French Scrabble dictionary
    └── scrabble_rules     # French game rules
```

## Makefile Targets

The Makefile includes these useful targets:

- `all` - Build all components
- `lib/ODS8.gz` - Create the compressed dictionary
- `fetch-dictionary` - Download the dictionary source
- `update-gitignore` - Update .gitignore file
- `release` - Create the distribution tarball
- `check-release` - Check if release is up to date
- `clean` - Remove all generated files

Run `make help` to see all available targets.

## Testing the Dictionary

The test-dictionary.sh script can be used to verify the dictionary:

```bash
# Run basic tests on the dictionary
./test-dictionary.sh

# Check if a specific word exists
./test-dictionary.sh <word>
```

## Release Process

1. Make changes to the code/resources as needed
2. Build and test locally with `make all` and `./test-dictionary.sh`
3. Check if release needs to be rebuilt with `make check-release`
4. Create a release tarball with `make release`
5. Create a GitHub release with `gh release create`