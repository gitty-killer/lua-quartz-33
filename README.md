# lua-quartz-33

A small Lua tool that computes text statistics for quartz.

## Goal
- Provide quick text metrics for quartz documents.
- Report top word frequencies for fast inspection.

## Usage
lua main.lua data/sample.txt --top 5

## Output
- lines: total line count
- words: total word count
- chars: total character count
- top words: most frequent tokens (case-insensitive)

## Notes
- Only ASCII letters and digits are treated as word characters.
