#!/bin/bash
# check-test-exists.sh
# Warn if implementation file has no corresponding test

FILE="$1"
[ -z "$FILE" ] && exit 0

# Skip test files
[[ "$FILE" == *test_*.py || "$FILE" == *_test.py ]] && exit 0

# Skip non-Python files
[[ "$FILE" != *.py ]] && exit 0

# Skip non-src files
[[ "$FILE" != src/* ]] && exit 0

# Skip __init__.py and conftest.py
[[ "$FILE" == *__init__.py || "$FILE" == *conftest.py ]] && exit 0

# Check for test file
DIR=$(dirname "$FILE")
BASENAME=$(basename "$FILE" .py)
TEST_FILE="$DIR/test_$BASENAME.py"

if [ ! -f "$TEST_FILE" ]; then
    echo "⚠️  TDD Warning: No test file for $FILE"
    echo "   Expected: $TEST_FILE"
    echo "   Write tests first! (Red-Green-Refactor)"
fi

exit 0
