

cd /app

# --- Validate git repo ---
if [ ! -d .git ]; then
    echo "[anvil] FATAL: No .git directory found in /app." >&2
    echo "[anvil] The Docker image must include the repository's git history." >&2
    exit 1
fi

git config user.email 'anvil@afterquery.com'
git config user.name 'Anvil'

# --- Validate base_commit ---
if ! git rev-parse --verify f1984d5bacc42fea79336e79ba157ef6678eb77b^{commit} >/dev/null 2>&1; then
    echo "[anvil] FATAL: base_commit f1984d5bacc42fea79336e79ba157ef6678eb77b not found in git history." >&2
    exit 1
fi

git reset --hard f1984d5bacc42fea79336e79ba157ef6678eb77b
git clean -fdx

# --- Apply patch (with fallback for agent-generated patches) ---
if [ -s /workspace/patch.diff ]; then
    if git apply -v --ignore-whitespace /workspace/patch.diff 2>&1; then
        echo "[anvil] Patch applied cleanly."
    elif patch --batch --fuzz=5 -p1 -i /workspace/patch.diff 2>&1; then
        echo "[anvil] Patch applied with fuzz (patch command fallback)."
    else
        echo "[anvil] WARNING: Patch could not be applied. Running tests on base code." >&2
    fi
fi

bash /workspace/run_script.sh tasks/task-7/task_tests.py > /workspace/stdout.log 2> /workspace/stderr.log
python3 /workspace/parser.py /workspace/stdout.log /workspace/stderr.log /workspace/output.json
