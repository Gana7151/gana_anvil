import sys
sys.path.insert(0, '/app/simple-api')
from app import get_response
def test_10_times():
    r = get_response("my card was used 10 times in 5 minutes")
    assert "velocity" in r.lower() or "rapid" in r.lower()
def test_multiple_times():
    r = get_response("transaction happened multiple times")
    assert "velocity" in r.lower() or "rapid" in r.lower()
def test_not_default():
    r = get_response("used 10 times")
    assert r != "Sorry, I don't have an answer for that right now."
def test_case_insensitive():
    r = get_response("MULTIPLE TIMES in one hour")
    assert "velocity" in r.lower() or "rapid" in r.lower()
def test_unrelated_returns_default():
    r = get_response("I need help with my account")
    assert r == "Sorry, I don't have an answer for that right now."
def test_single_transaction_returns_default():
    r = get_response("I made one transaction yesterday")
    assert r == "Sorry, I don't have an answer for that right now."