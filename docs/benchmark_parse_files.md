# Overview

This script is responsible for parsing formal Lean (.lean) files and informal LaTeX (.tex) files from the benchmark dataset. It extracts theorem statements, proofs, and associated metadata, then processes and saves this data into JSONL files for testing and validation sets. Its main role is to prepare the benchmark data for further use, likely in training or evaluating models for theorem proving or translation between formal and informal mathematics.

# Key Components

## Function `get_formal_dict(formal_dir=FORMAL_DIR)`
- **Description:** Reads all `.lean` files in the specified directory, extracts formal theorem statements using regular expressions, and stores them in a dictionary. The keys of the dictionary are identifiers generated from the file name and an `exercise` tag within the theorem.
- **Parameters:**
    - `formal_dir (str)`: The directory path containing the formal `.lean` files. Defaults to `FORMAL_DIR`.
- **Returns:** `dict`: A dictionary where keys are unique identifiers (e.g., `Artin|exercise_1_1`) and values are the extracted formal theorem statements.

## Function `get_informal_dict(informal_dir=INFORMAL_DIR)`
- **Description:** Reads all `.tex` files in the specified directory, extracts informal statements (natural language) and their corresponding proofs. It uses regular expressions to identify paragraphs that represent informal statements and then looks for associated proof environments.
- **Parameters:**
    - `informal_dir (str)`: The directory path containing the informal `.tex` files. Defaults to `INFORMAL_DIR`.
- **Returns:** `dict`: A dictionary where keys are unique identifiers (e.g., `Artin|exercise_1_1`) and values are dictionaries containing `nl_statement` and `nl_proof`.

## Function `header_of_author(source_name)`
- **Description:** Reads a `.lean` file corresponding to the `source_name` and extracts the header content (imports and other definitions) that appears before the first theorem definition. This function is decorated with `@cache` to memoize results.
- **Parameters:**
    - `source_name (str)`: The base name of the `.lean` file (e.g., `Artin`).
- **Returns:** `str`: The header content of the specified Lean file.

## Function `header_of_id(eyed)`
- **Description:** A utility function that extracts the source name (author) from a given identifier string and then calls `header_of_author` to get the header for that source.
- **Parameters:**
    - `eyed (str)`: The unique identifier (e.g., `Artin|exercise_1_1`).
- **Returns:** `str`: The header content of the Lean file corresponding to the identifier.

## Function `main()`
- **Description:** The main execution function of the script. It orchestrates the parsing of formal and informal files, merges the data based on common identifiers, filters the data into test and validation sets based on predefined ID lists, and saves these sets into JSONL files.
- **Parameters:** None
- **Returns:** None (writes files to disk)

# Important Variables/Constants

- `FORMAL_DIR (str)`: Path to the directory containing formal `.lean` files. Default: `"benchmark_to_publish/formal"`.
- `INFORMAL_DIR (str)`: Path to the directory containing informal `.tex` files. Default: `"benchmark_to_publish/informal"`.
- `TEST_SAVE_PATH (str)`: File path where the test dataset (in JSONL format) will be saved. Default: `"test.jsonl"`.
- `VALID_SAVE_PATH (str)`: File path where the validation dataset (in JSONL format) will be saved. Default: `"valid.jsonl"`.

# Usage Examples

This script is intended to be run directly from the command line:

```bash
python benchmark/parse_files.py
```
It will then process the files located in the `FORMAL_DIR` and `INFORMAL_DIR` and generate `test.jsonl` and `valid.jsonl` in the root of the `benchmark` directory.

# Dependencies and Interactions

- **Internal Dependencies:**
    - Relies on the directory structure defined by `FORMAL_DIR` and `INFORMAL_DIR`.
    - Reads lists of IDs from files named `test_ids` and `valid_ids` (expected to be in the same directory as the script, or the root of the benchmark directory).
- **External Libraries:**
    - `os`: For interacting with the file system (listing files, joining paths).
    - `re`: For regular expression matching to parse file contents.
    - `json`: Used by `ndjson` for JSON operations.
    - `ndjson`: For dumping data into JSONL format.
    - `functools.cache`: For memoizing the `header_of_author` function.
- **Interactions:**
    - Produces `test.jsonl` and `valid.jsonl` files which are likely consumed by other scripts for model training, evaluation, or benchmarking.
    - The script assumes a specific format for `.lean` and `.tex` files to correctly extract information.
```
