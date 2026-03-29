#!/bin/bash
set -e

cd /app

# Create test directory preserving original structure
mkdir -p tasks/task-8

cat > tasks/task-8/task_tests.py << 'ANVIL_TEST_CODE'
import sys
sys.path.insert(0, '/app/simple-api')
from app import get_response
def test_travel_abroad():
    r = get_response("is it normal to get flagged when I travel abroad")
    assert "geo" in r.lower() or "bank" in r.lower() or "notify" in r.lower()
def test_travel_keyword():
    r = get_response("I am going to travel next week")
    assert "geo" in r.lower() or "bank" in r.lower() or "notify" in r.lower()
def test_abroad_keyword():
    r = get_response("my card got blocked abroad")
    assert "geo" in r.lower() or "bank" in r.lower() or "notify" in r.lower()
def test_not_default():
    r = get_response("travel abroad")
    assert r != "Sorry, I don't have an answer for that right now."
def test_case_insensitive():
    r = get_response("TRAVEL to another country")
    assert "geo" in r.lower() or "bank" in r.lower() or "notify" in r.lower()
def test_unrelated_returns_default():
    r = get_response("what is my credit limit")
    assert r == "Sorry, I don't have an answer for that right now."
ANVIL_TEST_CODE

python3 -m pytest -v tasks/task-8/task_tests.py 2>&1 || true
