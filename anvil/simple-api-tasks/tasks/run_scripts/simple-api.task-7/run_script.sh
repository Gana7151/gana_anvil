#!/bin/bash
set -e

cd /app

# Create test directory preserving original structure
mkdir -p tasks/task-7

cat > tasks/task-7/task_tests.py << 'ANVIL_TEST_CODE'
import sys
sys.path.insert(0, '/app/simple-api')
from app import get_response
def test_velocity_alert():
    r = get_response("what is a velocity alert")
    assert "time" in r.lower() or "transaction" in r.lower()
def test_velocity_alert_variant():
    r = get_response("I received a velocity alert")
    assert "time" in r.lower() or "transaction" in r.lower()
def test_not_default():
    r = get_response("velocity alert")
    assert r != "Sorry, I don't have an answer for that right now."
def test_case_insensitive():
    r = get_response("VELOCITY ALERT on my account")
    assert "time" in r.lower() or "transaction" in r.lower()
def test_velocity_alone_returns_default():
    r = get_response("what is velocity")
    assert r == "Sorry, I don't have an answer for that right now."
def test_unrelated_returns_default():
    r = get_response("how do I change my pin")
    assert r == "Sorry, I don't have an answer for that right now."
ANVIL_TEST_CODE

python3 -m pytest -v tasks/task-7/task_tests.py 2>&1 || true
