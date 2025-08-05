#!/bin/bash
# test-dictionary.sh - Script for testing the French dictionary

# Ensure the dictionary exists
if [ ! -f "lib/dictionary.txt" ]; then
  echo "Dictionary not found. Downloading..."
  make lib/dictionary.txt
fi

# Function to check if a word exists in the dictionary
check_word() {
  if grep -q "^$1$" lib/dictionary.txt; then
    echo "✓ Le mot '$1' existe dans le dictionnaire."
  else
    echo "✗ Le mot '$1' n'existe PAS dans le dictionnaire."
  fi
}

# French sample words to test
echo "=== Test du dictionnaire ODS8 ==="
echo "Vérification de quelques mots français courants:"

# Common French words
check_word "MAISON"
check_word "JARDIN"
check_word "BONJOUR"
check_word "MERCI"
check_word "CHAT"
check_word "CHIEN"
check_word "FENETRE"    # Without accent (standard in Scrabble)
# Note: French Scrabble dictionaries typically use uppercase without accents

# Scrabble special words
echo ""
echo "Vérification de mots spécifiques au Scrabble:"
check_word "AA"         # Two-letter word
check_word "ZZ"         # Should fail
check_word "XI"         # Two-letter word
check_word "QUIZ"       # High-scoring word

# Count words
total_words=$(wc -l < lib/dictionary.txt)
echo ""
echo "Nombre total de mots dans le dictionnaire: $total_words"

# Allow custom word check
if [ -n "$1" ]; then
  echo ""
  echo "Vérification du mot fourni en argument:"
  check_word "${1^^}"  # Convert to uppercase
fi

echo ""
echo "Pour vérifier un mot spécifique: ./test-dictionary.sh [mot]"