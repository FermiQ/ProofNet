# Overview

This script evaluates a standard Hugging Face `AutoModelForCausalLM` (e.g., GPT-2, GPT-J) on a downstream task, likely related to mathematical reasoning or translation, using few-shot prompting. It loads a pre-trained model, constructs prompts by prepending a few-shot example template to instances from the "hoskinson-center/proofnet" dataset, generates completions, and then evaluates these completions using the BLEU score. Configuration is managed via a YAML file.

# Key Components

## Function `batch_loader(seq, size)`
- **Description:** A simple utility function to divide a list `seq` into smaller lists (batches) of a specified `size`.
- **Parameters:**
    - `seq (list)`: The input list to be batched.
    - `size (int)`: The desired size of each batch.
- **Returns:** `list[list]`: A list of lists, where each inner list is a batch.

## Function `call_gpt(prompts, model, tokenizer, stop)`
- **Description:** Generates text completions for a list of input prompts using the provided Hugging Face model and tokenizer. It truncates the output at a specified `stop` sequence. The number of new tokens is hardcoded to 400.
- **Parameters:**
    - `prompts (list[str])`: A list of text prompts.
    - `model (transformers.AutoModelForCausalLM)`: The Hugging Face model.
    - `tokenizer (transformers.AutoTokenizer)`: The tokenizer for the model.
    - `stop (str)`: A string sequence at which to stop generation.
- **Returns:** `list[str]`: A list of generated text strings, with prompts removed and truncated at the `stop` sequence (if found).

## Function `main()`
- **Description:** The main execution function. It handles:
    1.  Loading configuration from a YAML file.
    2.  Loading the few-shot prompt template from a specified file.
    3.  Creating the output directory.
    4.  Loading the specified Hugging Face model and tokenizer (with left-side truncation for the tokenizer).
    5.  Loading the specified split of the "hoskinson-center/proofnet" dataset.
    6.  Processing the dataset in batches:
        a.  Constructs full prompts by combining the `FEW_SHOT_PROMPT`, `BEFORE_EXAMPLE` string, the input from the dataset (`IN_KEY`), and `AFTER_EXAMPLE` string.
        b.  Calls `call_gpt` to get model generations.
        c.  Saves each original data instance along with the generated output (`OUT_KEY`) and the full prompt to a JSONL file.
    7.  After processing, it calculates the BLEU score using `utils.calc_bleu` by comparing the `OUT_KEY` with `ref_key`.
    8.  Saves the BLEU score to `metrics.json`.
    9.  Calls `utils.make_readable` to format the output.
- **Parameters:** None (reads configuration from `sys.argv[1]`).
- **Returns:** None (saves results to files).

# Important Variables/Constants

(Loaded from YAML config within `main()`)
- `hfmodel (str)`: Hugging Face model identifier (e.g., "gpt2", "EleutherAI/gpt-j-6B").
- `BATCH_SIZE (int)`: Number of samples per batch.
- `BEFORE_EXAMPLE (str)`: Text to prepend immediately before the dataset instance in the prompt.
- `AFTER_EXAMPLE (str)`: Text to append immediately after the dataset instance in the prompt.
- `IN_KEY (str)`: Key in the dataset for the input text.
- `OUT_KEY (str)`: Key to save the model's generated output.
- `ref_key (str)`: Key in the dataset for the reference text (for BLEU).
- `save_dir (str)`: Directory to save results.
- `save_file (str)`: Name of the JSONL output file.
- `few_shot_prompt_path (str)`: Path to the file containing the few-shot prompt prefix.
- `STOP (str)`: String to signal the end of generation.
- `max_tokens (int)`: (Note: `max_tokens` from config is loaded but `call_gpt` uses a hardcoded `max_new_tokens=400`).
- `split (str)`: Dataset split to use (e.g., "test", "train").
- `FEW_SHOT_PROMPT (str)`: The content read from `few_shot_prompt_path`.
- `device (str)`: Hardcoded to `"cuda"`.

# Usage Examples

Run from the command line with a YAML configuration file:
```bash
python eval/of_hfmodel.py path/to/your_hf_config.yaml
```

**Example YAML Configuration (`your_hf_config.yaml`):**
```yaml
hfmodel: "EleutherAI/gpt-j-6B"
batch_size: 4
before_example: "
### Example
Statement: "
after_example: "
Formalized Statement: "
in_key: "nl_statement"
out_key: "generated_formal_statement"
ref_key: "formal_statement"
save_dir: "results/gptj_eval"
save_file: "output.jsonl"
few_shot_prompt_path: "prompts/6shot_formalize.txt" # Path to your few-shot examples
stop: "

"
max_tokens: 150 # Note: call_gpt uses 400
split: "test"
```

# Dependencies and Interactions

- **Internal Dependencies:**
    - `utils.py`: Uses `calc_bleu` and `make_readable`. (The script defines its own `batch_loader` which might be redundant if `utils.py` also has one).
- **External Libraries:**
    - `sys`: For command-line arguments.
    - `os`: For file/directory operations.
    - `tqdm`: For progress bars.
    - `json`: For saving metrics and records.
    - `yaml`: For configuration.
    - `ndjson`: For loading results for BLEU calculation.
    - `pathlib`: For creating directories.
    - `torch`: For PyTorch and CUDA.
    - `transformers`: For `AutoTokenizer`, `AutoModelForCausalLM`.
    - `datasets`: For `load_dataset`.
- **Interactions:**
    - Reads a YAML config and a few-shot prompt file.
    - Loads a model and tokenizer from Hugging Face Model Hub.
    - Loads data from "hoskinson-center/proofnet".
    - Writes generation results to a JSONL file in `save_dir`.
    - Writes BLEU score to `metrics.json` in `save_dir`.
    - Uses `utils.make_readable` for output formatting.
```
