# Technical Decisions

## Stack
- **Language**: Python 3.11+
- **Framework**: [Your framework]
- **Database**: [Your database]
- **Testing**: pytest + Claude for Chrome (E2E)

## Development Methodology
We practice strict Test-Driven Development (TDD):

1. **Red** - Write a failing test first
2. **Green** - Write minimal code to pass
3. **Refactor** - Clean up while tests pass

## Testing Requirements
- Unit tests: pytest
- E2E tests: Claude for Chrome (browser automation)
- Coverage minimum: 80%
- All tests must pass before task completion

## Test File Conventions
- Unit tests: `test_*.py` in same directory as source
- E2E tests: `e2e/test_*.py`
- Fixtures: `conftest.py`

## Code Quality
- Type hints required (mypy strict)
- Docstrings for public functions
- Black for formatting
- Ruff for linting

## Dependencies
- [Core dependency 1]
- [Core dependency 2]

## Infrastructure
- [Hosting]
- [CI/CD]
- [Monitoring]

## Security
- [Authentication method]
- [Authorization approach]
- [Data protection]
