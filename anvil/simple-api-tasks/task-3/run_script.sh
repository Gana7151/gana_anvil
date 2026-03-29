#!/bin/bash
set -e

cd /app

# Create test directory preserving original structure
mkdir -p tasks/task-3

cat > tasks/task-3/task_tests.py << 'ANVIL_TEST_CODE'
import sys
sys.path.insert(0, '/app/simple-api')
from app import get_response
def test_another_country():
    r = get_response("transaction from another country")
    assert "geo" in r.lower() or "flag" in r.lower()
def test_different_country():
    r = get_response("someone used my card in a different country")
    assert "geo" in r.lower() or "flag" in r.lower()
def test_foreign_transaction():
    r = get_response("I see a foreign transaction on my account")
    assert "geo" in r.lower() or "flag" in r.lower()
def test_not_default():
    r = get_response("foreign transaction")
    assert r != "Sorry, I don't have an answer for that right now."
def test_case_insensitive():
    r = get_response("ANOTHER COUNTRY transaction")
    assert "geo" in r.lower() or "flag" in r.lower()
def test_unrelated_returns_default():
    r = get_response("how do I reset my password")
    assert r == "Sorry, I don't have an answer for that right now."
ANVIL_TEST_CODE

python3 -m pytest -v tasks/task-3/task_tests.py 2>&1 || true
