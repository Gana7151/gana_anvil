#!/bin/bash
set -e

cd /app

# Create test directory preserving original structure
mkdir -p tasks/task-10

cat > tasks/task-10/task_tests.py << 'ANVIL_TEST_CODE'
import sys
sys.path.insert(0, '/app/simple-api')
from app import get_response
def test_how_accurate():
    r = get_response("how accurate is your fraud detection model")
    assert "train" in r.lower() or "precision" in r.lower()
def test_accuracy_keyword():
    r = get_response("what is the accuracy of the system")
    assert "train" in r.lower() or "precision" in r.lower()
def test_fraud_detection_model():
    r = get_response("tell me about the fraud detection model")
    assert "train" in r.lower() or "precision" in r.lower()
def test_not_default():
    r = get_response("how accurate is the system")
    assert r != "Sorry, I don't have an answer for that right now."
def test_case_insensitive():
    r = get_response("ACCURACY of the model")
    assert "train" in r.lower() or "precision" in r.lower()
def test_unrelated_returns_default():
    r = get_response("can I transfer money")
    assert r == "Sorry, I don't have an answer for that right now."
ANVIL_TEST_CODE

python3 -m pytest -v tasks/task-10/task_tests.py 2>&1 || true
