# Content Validation Rules

## Before Creating Any File with Diagrams

### Mermaid Diagrams
1. Use alphanumeric + underscore only for node IDs
2. Escape special characters in labels: `"` → `\"` and `'` → `\'`
3. Validate flowchart syntax (node connections must be valid)
4. Always include a text alternative below the diagram

### General
- Validate embedded code blocks (JSON, YAML, Mermaid)
- Ensure markdown syntax is correct
- If validation fails, use text-based fallback and continue workflow
