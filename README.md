# APEMAN (Manual Precursor to APE)

## What is APEMAN?

APEMAN is a manual prompt engineering project meant to kick off a large APE (automated prompt
engineering) feature of micromanager. Visit codecartel.codes to learn more about this project.

## Goals of APEMAN

Starting with eslint, python black, html beautifier, and all of their dependencies and plugins...

manually experiement with writing a prompt, that produces an output from any LLM, that successfully...

1. installs
2. configures
3. executes
4. consumes

a qa tool, configured to it's highest code quality standards.

The prompt must serve as a template with variables that can be filled in automatically, to produce the same result for other qa tools.

The result is a functional bash script, produced from a generic template with variables filled in from a spreadsheet of qa tools.

## Relevent Concepts

* prompt engineering
* constrained decoding
* context free grammar

## Components

1. Station Template: contains train track psuedocode, contains variables filled in by qa tool data, installs/configures/executes/consumes, fed to llm, converts to bash
2. Mocker: fills in the station template variables in a loop using the qa tools spreadsheet
3. QA Tools Spreadsheet: https://docs.google.com/spreadsheets/d/1Dxn2uU1fWKs1bM2IXsPlW7wvqSB7h0KWWtJ4weM0BHI/edit?gid=0#gid=0

# Notes
## APEMAN
* start with station template
* Use Mocker to replace the station template
    ```bash
    $parent_tool (in the case the $tool is a plugin) Dependencies
    $tool  Define use_ vs run_
    $dependency_check(s)  Language installed, parent_tool, installer, (pipx, npm, curl, etc), etc
        early exit (before installation if statement)
    $installation_command
        git clone
        composer command
        npm
        pecl
        apt-get
        pip3
        pipx
        curl
        brew
    $dockerized yes|no "Yes" if the tool is installed when building the Docker image/container
    $installation_test_command    The short command that determines if the tool is installed
    $code_base_location Downloaded code that can be grepped for configurations
        Automate this using find_files ?
    $config_path  The location of the configuration file
    $configuration_test_command   ?
    ```
* Is the configuration file a dependency? How do we handle that? Chicken/egg init required? Early exit if the config file is missing
    ```bash
	$stderr_path	The stack trace? output when the tool malfunctions
	$stderr_test

	$stdout_path   The (JSON/XML) output from scanning the file
	$stdout_test
	
	$contributors  Scrape the number of contributors (for a vanity metric to support authority)

	generate different prompts for the SDLCs ???
		Do we run this as a singular prompt, OR as 5 individual prompts or BOTH
		How do we ORGANIZE the prompt git repo so it defines the order of installations?
			Directory depth   Subdirectories will be processed after parent directories
			Using increments in Mocker ?

	Do we create a XX?_MM_Prompt.md file with these flags set (as environment variables)?
    ```
* Automated checks
	Figure out how to switch to /opt rather than /usr/local/etc and use_ instead of run_
	Define MM functionalities vs Mocker/APE tool installation functionality? (or just not do the latter)
	Is the code in a function?
	Is TRAIN[dockerized] used?
	snake_case We can enforce this for the MM wrapper functions
		prettier, shfmt, shellcheck

	Run XML/JSON/YML/ENV file checkers on the configuration files

	Does the XX_test function convert to valid code (or throw a stderr)?
	Does each XX_test function pass?

	How does folder creation work? Mocker?

	Some prompts can be more detailed
		We CAN have a series of prompts to build up a station 
(function/section by function) and concatenate the code into one function last
* Mocker should prioritize if statements (for dependencies) (micro optimization)
----------------

as we're making list of tools, they need to go into the tool spreadsheet
inflexible on process
ape must be used for process
Mock MM Tools spreadsheet for "Mocker"
writing mocker simple bash script
export spreadsheet to csv
loop through and automatically create folders based on column A
mock a run function using column B and H
want to write a script that will mock out the tools
dockerized = no, means library gets installed during docker build
dockerized = no means hey we're building container, has not be dockerized YET, need to apt get intall when we are building the ontianer, once it is build is when we install some tools

Our goal is to prompt MicroManager to complete the following
functionalities AUTOMATICALLY.

By automating these tasks, we will . . .
. learn how to use MicroManager
. learn MicroManager's limitations
. dramatically reduce the emotional energy spent completing these tasks
. reduce the development time
. increase the probability of succeeding at completing these tasks on other
software

At this point, we could damn near *outsource* all of this as a "prompt
engineering" project.
We should be able to use MicroManager's brute force procedure to do all of
these tasks.

Use automated prompt engineering
    Prompting
        Curate and optimize prompts

https://www.reddit.com/r/PromptEngineering/comments/1ef1zs9/you_should_be_a=
b_testing_your_prompts/
    Installing
        Finish run_ (or use_) template functions that are 50%+ drafted
    Configuring
        Scrape the configuration parameters (using Aider, Chromium,
Playwrite)
        Feed the configuration parameters to MicroManager
        This relies on Prompting (because configuration files may be large)
    Testing
        Write unit tests
        Run unit tests
        Write mutation tests
        Run mutation tests
    Running
        This relies solely on Testing
    Debugging
        Parse stack trace log files
        Get the file paths of the related files
        Feed the related files into MicroManager

https://github.com/biobootloader/wolverine/blob/main/wolverine/wolverine.py
    Maintaining
        Automated in the default design of MicroManager
        Relies on the Installing, Configuring, and Debugging functionality
    Securing
        Vulnerability scanning
        Dependency scanning
        This depends on Installing, Configuring, Running, and Debugging QA
tools
        PCI, HIPPA, SO:27001, SOC2, etc compliance (relies on QA tools)
    API integration
        We is just gonna need API integration
        This depends on all of the above tasks
        Write integration tests
        Run integration tests3
    Refactoring
        Relies on Prompting, Testing, Debugging, Maintaining, Securing
    Porting
        Convert the code from one programming language to another
        Relies on refactoring

for now mm will only support the latest version of the language
py 2.7 not supported, only support py 3.12
any py 3/2 code will automatically be upgraded
it's a rule to prevent maintaining multiple versions of each language
if client/project can't accept this rule they are out, scope needs to remain low

we only accept tools that can be run in the background, fully automated, and without any developer interaction
one configuration in the beginning
everyone uses the same very strict configuration

HOW do we "Use find_files to grep the code base for the configurations"?
        Configure find_files automatically
            Avoid CHANGELOG.md
            Avoid files with "deprecated"?

        How do we verify the configuration
    Use the --help / man pages to get the configurations

    stack trace / ! run_command will write stderr errors

# Definitions 
## installation_command 
## installed_command 
## dependency_command

# apeman
GOALS: 
 - promote apeman on reddit, independent from mm

Tell the Story ?

WHO:
    Drew Brown / CodeCartel.Codes

WHAT:
    APE
    MicroManager
    SDLC Activities 
    QA tools

WHEN:
    Optimization
    test_

WHERE:
    Local LLM

HOW:
    Prompts
        TrainTrack
        Pseudocode
        Code
    token size
    Sequencing???
    Brute Force
    Wolverine

WHY:
    MAN vs APE
    Perfectism

Girish Kumar <finetune@cgft.io> "automating sdlc"

Prompt Processing Priority
The Developer can pre-configure files_to_process.txt
The Developer can set the specific order of the files
MicroManager will use the pre-configured file if it exists
MicroManager will NOT run create_file_lists if it exists
When the files_to_process are inserted in the database,
an autoincrement column will set the priority of the files
This way, the file_lists table can be processed in order!

Group
$group The grouping/language of the tool string

--------------------------

Automatic Prompt Optimization (APO)

https://www.patched.codes/
https://github.com/apps/sourcery-ai
https://github.com/sourcery-ai/sourcery

Qwen2.5-Coder and DeepSeek-Coder-V2

A/B prompt engineering
    prompt
    test_type
    run_test - to reach a goal or improve a metric
        test parameters
    test_command
    test_answer
    test_result (pass fail? percentage)
    time
    tokens
    chain
    datetime
    tags (in prompts)
        which test to run 
        variant
            control, treatment
            tries
        git commit
        SDLC task (completion, debugging, configure)
    remember that the accuracy of any correlation depends on the sample size. 
    conversion rate
    p-value

    rank
    avoid duplicates 
    max_variants
    max_tokens

    tempurature

    filename (based on rank?)
    model
    template

    get configurations 
        from code
        from the Internet

    handle hallucinations

        grep_configuration?_string
            library_path?
            CAUTION: False positives due to the CHANGELOG.md (so use find_files.sh)
                Look for "deprecated" ?
            CAUTION: False positives due to our configuration file

            $ grep -r Generic.WhiteSpace.LanguageConstructSpacing ./*
                ./CHANGELOG.md:    - Generic.WhiteSpace.LanguageConstructSpacing
                ./CHANGELOG.md:    - The Generic.WhiteSpace.LanguageConstructSpacing sniff was not previously available for PEAR installs
                ./CHANGELOG.md:    - The sniff has been moved to the Generic standard, with a new code of Generic.WhiteSpace.LanguageConstructSpacing
                ./src/Standards/Squiz/ruleset.xml:    <rule ref="Generic.WhiteSpace.LanguageConstructSpacing"/>
                ./src/Standards/Squiz/Sniffs/WhiteSpace/LanguageConstructSpacingSniff.php: * @deprecated 3.3.0 Use the Generic.WhiteSpace.LanguageConstructSpacing sniff instead.

            Shellcheck is installed using apt-get
                Should we avoid apt-get installations
                    so that we download the source 
                        so that we can find_files the configurations
                No; Install in the easiest way, but still download the source
        
        Use "idunno" prompt to allow the LLM to not know
            https://techxplore.com/news/2024-11-llms-accurate.html
            https://arxiv.org/abs/2411.00412

        browse configurations

        output error (file_flaws table)

        stacktrace error (file_flaws table?)

        run man or --help ?



vLLM or Aphrodite 

https://kristaopsahlong.com
https://www.linkedin.com/in/krista-opsahl-ong-86b096103

AdalFlow
    AdalFlow has two fundamental, but powerful, base classes: Component for the pipeline and DataClass for data interaction with LLMs. The result is a library with minimal abstraction, providing developers with maximum customizability.

    You have full control over the prompt template, the model you use, and the output parsing for your task pipeline.
    https://github.com/SylphAI-Inc/AdalFlow

MIPRO
    https://www.youtube.com/watch?v=DVkM5dB3Oqs
    The advanced Optimizers like MIPRO do more complicated training 
    that involves generating new prompt versions based on your data. 
    https://github.com/stanfordnlp/dspy/blob/main/dspy/teleprompt/mipro_optimizer.py


DSPy stands for Declarative Self-improving Python
    DSPy is the open-source framework for building high-quality, modular AI systems by programming—rather than prompting—language models. It provides abstractions and algorithms for optimizing the prompts and weights in LM programs, ranging from simple classifiers to sophisticated RAG pipelines and Agent loops.

    Instead of writing brittle LM-specific prompts, you write compositional code and use DSPy optimizers to teach different models like GPT-4o or Llama-3.2 to deliver higher quality outputs or avoid specific failure patterns. In essence, DSPy optimizers then compile your high-level code into low-level computations, prompts, or weight updates that align your LM with your program’s structure and metrics.
    https://github.com/stanfordnlp/dspy
    https://discord.gg/XCGy2WDCQB

    https://www.reddit.com/r/LocalLLaMA/comments/1cplfph/who_is_using_dspy/

    noprompt
    You don’t need any of these frameworks. Keep your life simple and use function composition and solve your own problems not problems these frameworks think you have. I have been working with LLMs for almost two years now, programming for almost 2 decades, and this is my conclusion.
    - https://www.reddit.com/r/LocalLLaMA/comments/1cplfph/comment/l3llhpk/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button


    noprompt
    Sorry for the late reply. Yes, I checked it out a couple weeks ago after hearing about it somewhere. Nodded my head in agreement with the problems mentioned in the README. Read over the docs and thought their cure was worse than the disease.

    Personally, I don’t see the benefit of picking up their abstractions when it will almost certainly turn out to be a net loss of time that I could’ve spent solving my specific problem with the specific code I need. Same can be said for LangChain while I’m on this topic.

    The main issue I have with all these frameworks is that they don’t give me better semantics. I’m just getting the same things I already have but with new names and more parameters.

    The second issue I have is that they actually make software development harder in this space. If some team in the company is using one of these frameworks with a model my team has tuned, I have to pick it up just to understand to their complaints. Most of the time these teams are picking up these frameworks because they haven’t been trained on how to work with LLMs from the ground up. They don’t understand why models respond differently, they don’t understand embeddings, etc. They’re following the hype/stars argument from authority without understanding the technical choice they’re making and the social problems they’re creating.

    So, yeah, I’ve taken an honest look and honestly think that, on the balance, stuff like DSPy is a net negative contribution.
    https://www.reddit.com/r/LocalLLaMA/comments/1cplfph/comment/l3o49j7/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button


GrowthBook 
    https://www.prompthub.us/features/prompt-versioning
    https://github.com/posthog/posthog
    https://mojito.mx
        https://github.com/mint-metrics/mojito
        Build, test & launch experiments with git
https://github.com/GoogleCloudPlatform/generative-ai/blob/main/gemini/prompts/prompt_optimizer/vertex_ai_prompt_optimizer_ui.ipynb
https://www.google.com/search?client=firefox-b-1-d&q=prompt+optimizer

https://docs.rungalileo.io/galileo-ai-research/automatic-prompt-optimization
https://chatgpt.com/g/g-SsB4aTVgM-prompt-optimizer


https://cloud.google.com/blog/products/ai-machine-learning/announcing-vertex-ai-prompt-optimizer
params = {
    "project": PROJECT_ID,
    "num_steps": NUM_INST_OPTIMIZATION_STEPS,
    "system_instruction": SYSTEM_INSTRUCTION,
    "prompt_template": PROMPT_TEMPLATE,
    "target_model": TARGET_MODEL,
    "target_model_qps": TARGET_MODEL_QPS,
    "target_model_location": LOCATION,
    "source_model": SOURCE_MODEL,
    "source_model_qps": SOURCE_MODEL_QPS,
    "source_model_location": LOCATION,
    "eval_qps": EVAL_QPS,
    "eval_model_location": LOCATION,
    "optimization_mode": OPTIMIZATION_MODE,
    "num_demo_set_candidates": NUM_DEMO_OPTIMIZATION_STEPS,
    "demo_set_size": NUM_DEMO_PER_PROMPT,
    "aggregation_type": METRIC_AGGREGATION_TYPE,
    "data_limit": 50,
    "num_template_eval_per_step": NUM_TEMPLATES_PER_STEP,
    "input_data_path": input_data_path,
    "output_path": output_path,
    "response_mime_type": RESPONSE_MIME_TYPE,
    "language": TARGET_LANGUAGE,
    "placeholder_to_content": json.loads(PLACEHOLDER_TO_VALUE),
}
    - https://github.com/GoogleCloudPlatform/generative-ai/blob/main/gemini/prompts/prompt_optimizer/vertex_ai_prompt_optimizer_ui.ipynb