# Project Structure

## Directory Layout
```
project/
├── src/                    # Source code
│   ├── __init__.py
│   └── [module]/
│       ├── __init__.py
│       ├── [module].py     # Implementation
│       └── test_[module].py # Unit tests
├── e2e/                    # E2E tests (Claude for Chrome)
│   └── test_*.py
├── .spec-workflow/         # Spec-driven workflow
│   ├── steering/           # Project context
│   ├── specs/              # Feature specifications
│   ├── approvals/          # Approval records
│   └── archive/            # Completed specs
├── conftest.py             # Shared pytest fixtures
├── pyproject.toml          # Project configuration
└── README.md
```

## Naming Conventions
- Files: `snake_case.py`
- Classes: `PascalCase`
- Functions: `snake_case`
- Constants: `UPPER_SNAKE_CASE`
- Test files: `test_*.py` (same directory as source)

## Import Order
1. Standard library
2. Third-party packages
3. Local imports

## Module Structure
Each module should have:
- `__init__.py` - Public exports
- `module.py` - Implementation
- `test_module.py` - Unit tests
- `types.py` - Type definitions (if needed)

## API Design
- [REST/GraphQL/etc conventions]
- [Endpoint naming]
- [Error handling]

## Database
- [Schema conventions]
- [Migration strategy]
- [Naming conventions]
