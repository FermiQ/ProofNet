# Overview

This script evaluates a fine-tuned Hugging Face `AutoModelForCausalLM` model. It takes a dataset (specifically "hoskinson-center/proofnet" in this version), generates text outputs from the model based on constructed prompts, and then calculates the BLEU score by comparing the generated text to reference texts. The script is configured via a YAML file.

# Key Components

## Function `call_gpt(prompts, model, tokenizer, max_tokens, stop)`
- **Description:** Generates text completions for a list of input prompts using the provided Hugging Face model and tokenizer. It truncates the output at a specified `stop` sequence.
- **Parameters:**
    - `prompts (list[str])`: A list of text prompts to feed to the model.
    - `model (transformers.AutoModelForCausalLM)`: The pre-trained or fine-tuned Hugging Face model.
    - `tokenizer (transformers.AutoTokenizer)`: The tokenizer associated with the model.
    - `max_tokens (int)`: The maximum number of new tokens to generate.
    - `stop (str)`: A string sequence at which to stop generation for each prompt.
- **Returns:** `list[str]`: A list of generated text strings, with prompts removed and truncated at the `stop` sequence.

## Function `main()`
- **Description:** The main function that orchestrates the evaluation process. It performs these steps:
    1.  Loads configuration from a YAML file (passed as a command-line argument).
    2.  Creates the output directory if it doesn't exist.
    3.  Loads the specified fine-tuned model and its tokenizer.
    4.  Loads the "hoskinson-center/proofnet" test dataset.
    5.  Processes the data in batches:
        a.  Constructs prompts by taking a specified input key (`IN_KEY`) from the dataset and appending "<SEP>theorem".
        b.  Calls `call_gpt` to get model generations.
        c.  Saves each input, output, and prompt to a JSONL file.
    6.  After processing all batches, it re-loads the saved JSONL data.
    7.  Calculates the BLEU score using `utils.calc_bleu` by comparing the generated output (`OUT_KEY`) with a reference key (`ref_key`).
    8.  Saves the BLEU score to `metrics.json` in the save directory.
    9.  Calls `utils.make_readable` to format the output.
- **Parameters:** None (reads configuration from `sys.argv[1]`).
- **Returns:** None (saves results to files).

# Important Variables/Constants

(Loaded from YAML config within `main()`)
- `BATCH_SIZE (int)`: Number of samples to process in each batch.
- `IN_KEY (str)`: The key in the input dataset to use for constructing the prompt.
- `OUT_KEY (str)`: The key under which the model's generated output will be saved in the results.
- `save_dir (str)`: Directory path to save the output files (JSONL results, metrics).
- `save_file (str)`: Name of the JSONL file to save individual generation results.
- `max_tokens (int)`: Maximum number of new tokens for the model to generate.
- `model_path (str)`: Path to the fine-tuned model checkpoint.
- `hfmodel (str)`: Hugging Face model identifier for loading the tokenizer (and potentially the base model if `model_path` is a fine-tune on top of it).
- `ref_key (str)`: The key in the input dataset that contains the reference text for BLEU score calculation.
- `STOP (str)`: The string sequence used to truncate the model's output.
- `split (str)`: Specifies the dataset split to use (e.g., "test"). Although "hoskinson-center/proofnet" is hardcoded to use its "test" split in this script.
- `device (str)`: Hardcoded to `"cuda"`. The device for model inference.

# Usage Examples

The script is executed from the command line, providing a YAML configuration file as an argument:

```bash
python eval/of_finetuned.py path/to/your_config.yaml
```

**Example YAML Configuration (`your_config.yaml`):**
```yaml
batch_size: 8
in_key: "nl_statement" # Example: use natural language statement as input
out_key: "generated_formal_statement"
save_dir: "results/my_finetuned_model_eval"
save_file: "output.jsonl"
max_tokens: 150
model: "path/to/my/finetuned_model_checkpoint"
hfmodel: "gpt2" # Base model type for tokenizer
ref_key: "formal_statement" # Example: reference formal statement
stop: "

" # Stop generation at double newline
split: "test"
```

# Dependencies and Interactions

- **Internal Dependencies:**
    - `utils.py`: Uses `calc_bleu` for calculating BLEU score and `make_readable` for formatting output, and `batch_loader` for creating batches from the dataset.
- **External Libraries:**
    - `sys`: For command-line arguments.
    - `os`: For file and directory operations.
    - `tqdm`: For progress bars.
    - `json`: For saving metrics and individual records.
    - `yaml`: For loading configuration.
    - `ndjson`: For loading the full results file before BLEU calculation.
    - `pathlib`: For creating directories.
    - `torch`: For PyTorch model operations and CUDA management.
    - `transformers`: For `AutoTokenizer` and `AutoModelForCausalLM`.
    - `datasets`: For `load_dataset`.
- **Interactions:**
    - Reads a YAML configuration file.
    - Loads a fine-tuned model from a specified path and a tokenizer from Hugging Face.
    - Loads the "hoskinson-center/proofnet" dataset.
    - Writes generated outputs to a JSONL file (`save_dir/save_file`).
    - Writes evaluation metrics (BLEU score) to `metrics.json` in `save_dir`.
    - The `make_readable` function likely produces a human-readable version of the outputs.
```
