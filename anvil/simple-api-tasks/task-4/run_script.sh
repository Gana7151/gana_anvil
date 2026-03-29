#!/bin/bash
set -e

cd /app

# Create test directory preserving original structure
mkdir -p tasks/task-4

cat > tasks/task-4/task_tests.py << 'ANVIL_TEST_CODE'
import sys
sys.path.insert(0, '/app/simple-api')
from app import get_response
def test_risk_score_09():
    r = get_response("what does a risk score of 0.9 mean")
    assert "block" in r.lower() or "critical" in r.lower()
def test_risk_score_high():
    r = get_response("I have a high risk score")
    assert "block" in r.lower() or "critical" in r.lower()
def test_not_default():
    r = get_response("risk score 0.9")
    assert r != "Sorry, I don't have an answer for that right now."
def test_case_insensitive():
    r = get_response("RISK SCORE is HIGH")
    assert "block" in r.lower() or "critical" in r.lower()
def test_risk_score_alone_returns_default():
    r = get_response("what is a risk score")
    assert r == "Sorry, I don't have an answer for that right now."
def test_unrelated_returns_default():
    r = get_response("how do I login")
    assert r == "Sorry, I don't have an answer for that right now."
ANVIL_TEST_CODE

python3 -m pytest -v tasks/task-4/task_tests.py 2>&1 || true
