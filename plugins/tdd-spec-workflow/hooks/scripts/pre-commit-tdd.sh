#!/bin/bash
# pre-commit-tdd.sh
# Block commits if tests fail or coverage < 80%

set -e

echo "🧪 Running TDD pre-commit checks..."

# Run pytest
if ! python -m pytest --tb=short -q 2>/dev/null; then
    echo "❌ BLOCKED: Tests are failing"
    echo "Run 'pytest -v' to see failures"
    exit 2
fi

# Check coverage
if python -m pytest --cov=src --cov-report=json -q 2>/dev/null; then
    if [ -f "coverage.json" ]; then
        COVERAGE=$(python -c "import json; print(json.load(open('coverage.json'))['totals']['percent_covered'])")
        if (( $(echo "$COVERAGE < 80" | bc -l) )); then
            echo "❌ BLOCKED: Coverage is ${COVERAGE}% (minimum 80%)"
            rm -f coverage.json
            exit 2
        fi
        echo "✅ Coverage: ${COVERAGE}%"
        rm -f coverage.json
    fi
fi

echo "✅ All TDD checks passed"
exit 0
