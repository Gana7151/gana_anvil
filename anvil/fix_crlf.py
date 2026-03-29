path = r'F:\gana_anvil\anvil\src\anvil\_vendor\swe_bench_pro\swe_bench_pro_eval.py'

with open(path, 'r', encoding='utf-8') as f:
    content = f.read()

old = '''def write_files_local(workspace_dir, files):
    for rel_path, content in files.items():
        dst = os.path.join(workspace_dir, rel_path)
        with open(dst, "w") as f:
            f.write(content)'''

new = '''def write_files_local(workspace_dir, files):
    for rel_path, content in files.items():
        dst = os.path.join(workspace_dir, rel_path)
        if isinstance(content, str):
            content = content.replace("\\r", "")
        with open(dst, "w", newline="\\n", encoding="utf-8") as f:
            f.write(content)'''

if old in content:
    content = content.replace(old, new)
    with open(path, 'w', encoding='utf-8', newline='\n') as f:
        f.write(content)
    print('Fixed successfully')
else:
    print('Pattern not found')