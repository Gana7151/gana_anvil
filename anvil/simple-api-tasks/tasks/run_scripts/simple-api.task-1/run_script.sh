#!/bin/bash
set -e

cd /app

# Create test directory preserving original structure
mkdir -p tasks/task-1

cat > tasks/task-1/task_tests.py << 'ANVIL_TEST_CODE'
import sys
sys.path.insert(0, '/app/simple-api')
from app import get_response
def test_fraud_detection_keyword():
    r = get_response("what is fraud detection")
    assert "pattern" in r.lower() or "rule" in r.lower()
def test_fraud_detection_how():
    r = get_response("how does fraud detection work")
    assert len(r) > 10
def test_case_insensitive():
    r = get_response("What Is Fraud Detection")
    assert "pattern" in r.lower() or "rule" in r.lower()
def test_not_default():
    r = get_response("what is fraud detection")
    assert r != "Sorry, I don't have an answer for that right now."
def test_unrelated_returns_default():
    r = get_response("hello there")
    assert r == "Sorry, I don't have an answer for that right now."
def test_partial_no_trigger():
    r = get_response("what is fraud")
    assert r == "Sorry, I don't have an answer for that right now."
ANVIL_TEST_CODE

python3 -m pytest -v tasks/task-1/task_tests.py 2>&1 || true
