import sys
sys.path.insert(0, '/app/simple-api')
from app import get_response
def test_blocked():
    r = get_response("what happens after a transaction gets blocked")
    assert "review" in r.lower() or "team" in r.lower()
def test_transaction_blocked():
    r = get_response("my transaction was blocked")
    assert "review" in r.lower() or "team" in r.lower()
def test_not_default():
    r = get_response("transaction blocked")
    assert r != "Sorry, I don't have an answer for that right now."
def test_case_insensitive():
    r = get_response("BLOCKED transaction on my card")
    assert "review" in r.lower() or "team" in r.lower()
def test_unrelated_returns_default():
    r = get_response("when does my card expire")
    assert r == "Sorry, I don't have an answer for that right now."
def test_block_partial_returns_default():
    r = get_response("I want to block spam emails")
    assert r == "Sorry, I don't have an answer for that right now."