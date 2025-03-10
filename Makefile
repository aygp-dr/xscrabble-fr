# Makefile for xscrabble_fr

.PHONY: all clean fetch-dictionary update-gitignore help check-release release

# Default target: show help
.DEFAULT_GOAL := help

# Build all components
all: lib/ODS8.gz ## Build all components

# Fetch and compress the French dictionary
lib/ODS8.gz: lib/dictionary.txt ## Create compressed dictionary
	gzip -c $< > $@
	@echo "Created ODS8.gz from dictionary.txt"

# Download the dictionary source if it doesn't exist
fetch-dictionary: ## Download French dictionary source
	@if [ ! -f lib/dictionary.txt ]; then \
		mkdir -p lib; \
		echo "Downloading French ODS dictionary..."; \
		wget "https://raw.githubusercontent.com/Thecoolsim/French-Scrabble-ODS8/main/French%20ODS%20dictionary.txt" -O lib/dictionary.txt; \
		echo "Downloaded French ODS dictionary"; \
	else \
		echo "Dictionary already exists at lib/dictionary.txt"; \
	fi

# Create dictionary.txt only if it doesn't exist
lib/dictionary.txt:
	@$(MAKE) fetch-dictionary

# Ensure dictionary.txt is in .gitignore
update-gitignore: ## Update .gitignore with dictionary.txt
	@grep -q "lib/dictionary.txt" .gitignore || echo "lib/dictionary.txt" >> .gitignore
	@echo "Updated .gitignore to exclude dictionary.txt"

# Define the release artifact
release/xscrabble_fr.tar.gz: lib/ODS8.gz app-defaults/XScrabble_fr lib/scrabble_rules
	@mkdir -p release
	@# Create a clean directory structure for the release
	@mkdir -p release/tmp/xscrabble_fr/app-defaults
	@mkdir -p release/tmp/xscrabble_fr/lib
	
	@# Copy only essential files to the release structure
	@cp app-defaults/XScrabble_fr release/tmp/xscrabble_fr/app-defaults/
	@cp lib/ODS8.gz lib/scrabble_rules release/tmp/xscrabble_fr/lib/
	
	@# Create the tarball with the clean directory structure
	@cd release/tmp && tar -czvf ../xscrabble_fr.tar.gz xscrabble_fr > /dev/null
	
	@# Clean up temporary files
	@rm -rf release/tmp
	
	@echo "Created release tarball at release/xscrabble_fr.tar.gz"
	@echo "This can be extracted directly to get a clean xscrabble_fr directory"

# Create a release tarball including all necessary files
release: release/xscrabble_fr.tar.gz ## Create distribution tarball

# Check if release needs to be rebuilt
check-release: ## Check if release is up to date
	@if [ ! -f release/xscrabble_fr.tar.gz ]; then \
		echo "Release tarball does not exist - needs to be built"; \
	elif [ app-defaults/XScrabble_fr -nt release/xscrabble_fr.tar.gz ] || \
	     [ lib/ODS8.gz -nt release/xscrabble_fr.tar.gz ] || \
	     [ lib/scrabble_rules -nt release/xscrabble_fr.tar.gz ]; then \
		echo "Release is outdated - needs to be rebuilt"; \
	else \
		echo "Release is up to date"; \
	fi

# Clean all generated files
clean: ## Remove all generated files
	rm -f lib/dictionary.txt lib/ODS8.gz
	rm -rf release

# Help target
help: ## Show this help message
	@echo "Available targets:"
	@echo "  all              Build all components"
	@echo "  lib/ODS8.gz      Create compressed dictionary"
	@echo "  fetch-dictionary Download French dictionary source" 
	@echo "  update-gitignore Update .gitignore with dictionary.txt"
	@echo "  release          Create distribution tarball"
	@echo "  check-release    Check if release is up to date"
	@echo "  clean            Remove all generated files"
	@echo "  help             Show this help message"