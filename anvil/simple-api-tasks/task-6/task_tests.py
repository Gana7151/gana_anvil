import sys
sys.path.insert(0, '/app/simple-api')
from app import get_response
def test_report_transaction():
    r = get_response("how do I report a suspicious transaction")
    assert "support" in r.lower() or "contact" in r.lower()
def test_report_transaction_variant():
    r = get_response("I want to report this transaction")
    assert "support" in r.lower() or "contact" in r.lower()
def test_not_default():
    r = get_response("report a transaction")
    assert r != "Sorry, I don't have an answer for that right now."
def test_case_insensitive():
    r = get_response("REPORT my TRANSACTION")
    assert "support" in r.lower() or "contact" in r.lower()
def test_report_without_transaction_returns_default():
    r = get_response("how do I report")
    assert r == "Sorry, I don't have an answer for that right now."
def test_unrelated_returns_default():
    r = get_response("what is my balance")
    assert r == "Sorry, I don't have an answer for that right now."