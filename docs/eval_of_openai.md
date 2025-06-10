# Overview

This script evaluates OpenAI language models (both completion and chat-based endpoints) on tasks likely related to mathematical reasoning or translation. It uses a few-shot prompting strategy, sends requests to the OpenAI API, processes the generated text, and computes the BLEU score against reference texts. The script is configured through a YAML file.

# Key Components

## Function `main()`
- **Description:** The primary function that manages the entire evaluation workflow:
    1.  Loads configuration settings from a YAML file specified via command-line argument.
    2.  Sets up parameters for OpenAI API calls, including endpoint, chat mode, batch size (forced to 1 for chat models).
    3.  Creates the output directory if it doesn't already exist.
    4.  Loads the few-shot prompt. This can be a plain text file or a JSON file (for chat models, structured as a list of messages).
    5.  Loads the specified split of the "hoskinson-center/proofnet" dataset.
    6.  Processes the dataset in batches (or one by one if `chat` is true):
        a.  Constructs prompts. For chat models, it appends the current user message to the `FEW_SHOT_PROMPT` list. For completion models, it concatenates `FEW_SHOT_PROMPT`, `BEFORE_EXAMPLE`, the input from the dataset (`IN_KEY`), and `AFTER_EXAMPLE`.
        b.  Calls `utils.call_api` to interact with the OpenAI API.
        c.  Retries API call with more tokens if the initial call hits the length limit.
        d.  Extracts the generated text from the API response.
        e.  Saves the original data instance, the generated output (`OUT_KEY`), and the prompt to a JSONL file.
    7.  After all instances are processed, it calculates the BLEU score using `utils.calc_bleu` by comparing `OUT_KEY` with `ref_key` from the saved JSONL file.
    8.  Saves the BLEU score to `metrics.json`.
    9.  Calls `utils.make_readable` to format the output file.
- **Parameters:** None (reads configuration from `sys.argv[1]`).
- **Returns:** None (saves results to files).

# Important Variables/Constants

(Loaded from YAML config within `main()`)
- `BEFORE_EXAMPLE (str)`: Text prepended before the actual input example in the prompt (for completion models).
- `AFTER_EXAMPLE (str)`: Text appended after the actual input example (for completion models).
- `IN_KEY (str)`: Dataset key for the input part of the prompt.
- `OUT_KEY (str)`: Key to store the model's output.
- `endpoint (str)`: OpenAI model endpoint (e.g., "code-davinci-002", "gpt-3.5-turbo"). Defaults to "code-davinci-002" if not in config.
- `chat (bool)`: Boolean indicating if the endpoint is a chat model. Defaults to `False`.
- `BATCH_SIZE (int)`: Batch size for API calls (forced to 1 if `chat` is true).
- `ref_key (str)`: Dataset key for the reference text for BLEU calculation.
- `save_dir (str)`: Directory to save output files.
- `save_file (str)`: Name of the JSONL file for results.
- `few_shot_prompt_path (str)`: Path to the file containing few-shot examples. Can be `.txt` or `.json`.
- `STOP (str)`: Stop sequence for the OpenAI API.
- `max_tokens (int)`: Maximum tokens to generate. (Retried with 375 if length limit hit).
- `split (str)`: Dataset split to use (e.g., "test").
- `FEW_SHOT_PROMPT (str | list)`: The content loaded from `few_shot_prompt_path`. String for completion, list of messages for chat.

# Usage Examples

Run from the command line with a YAML configuration file:
```bash
python eval/of_openai.py path/to/your_openai_config.yaml
```

**Example YAML Configuration for a completion model (`openai_completion_config.yaml`):**
```yaml
before_example: "
---
Statement: "
after_example: "
Formalized Statement: "
in_key: "nl_statement"
out_key: "openai_formal_statement"
endpoint: "code-davinci-002"
batch_size: 10 # Will be used if endpoint is not chat
ref_key: "formal_statement"
save_dir: "results/openai_davinci_eval"
save_file: "output.jsonl"
few_shot_prompt_path: "prompts/6shot_formalize.txt"
stop: "

"
max_tokens: 150
split: "test"
```

**Example YAML Configuration for a chat model (`openai_chat_config.yaml`):**
```yaml
in_key: "nl_statement" # User message content
out_key: "openai_chat_formal_statement"
endpoint: "gpt-3.5-turbo"
chat: true # Important for chat models
ref_key: "formal_statement"
save_dir: "results/openai_chat_eval"
save_file: "output.jsonl"
few_shot_prompt_path: "prompts/chat_formalize_prompt.json" # JSON file with message history
stop: null # Or specific stop sequence
max_tokens: 200
split: "test"
# Note: BATCH_SIZE is 1 for chat, BEFORE_EXAMPLE and AFTER_EXAMPLE are not used for chat
```

# Dependencies and Interactions

- **Internal Dependencies:**
    - `utils.py`: Uses `call_api` (critical for OpenAI interaction), `calc_bleu`, `make_readable`, and `batch_loader`.
- **External Libraries:**
    - `sys`: For command-line arguments.
    - `os`: For file/directory operations.
    - `tqdm`: For progress bars.
    - `json`: For loading/saving JSON data (including few-shot prompts for chat).
    - `yaml`: For configuration loading.
    - `ndjson`: For loading results for BLEU calculation.
    - `pathlib`: For creating directories.
    - `datasets`: For `load_dataset` ("hoskinson-center/proofnet").
- **Interactions:**
    - Reads a YAML configuration file and a few-shot prompt file.
    - Interacts with the OpenAI API via `utils.call_api`. Requires OpenAI API key to be set up in the environment.
    - Loads data from the "hoskinson-center/proofnet" dataset.
    - Writes generated outputs and prompts to a JSONL file in `save_dir`.
    - Writes evaluation metrics (BLEU score) to `metrics.json` in `save_dir`.
```
