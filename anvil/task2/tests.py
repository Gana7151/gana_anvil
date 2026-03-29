import sys
sys.path.insert(0, '/app/simple-api')
from app import get_response
def test_high_risk_alert():
    r = get_response("I got a high risk alert on my account")
    assert "verify" in r.lower() or "support" in r.lower()
def test_high_risk_underscore():
    r = get_response("I got a high_risk alert")
    assert "verify" in r.lower() or "support" in r.lower()
def test_case_insensitive():
    r = get_response("HIGH RISK ALERT on my account")
    assert "verify" in r.lower() or "support" in r.lower()
def test_not_default():
    r = get_response("high risk alert")
    assert r != "Sorry, I don't have an answer for that right now."
def test_unrelated_returns_default():
    r = get_response("what is the weather")
    assert r == "Sorry, I don't have an answer for that right now."
def test_partial_no_trigger():
    r = get_response("high score today")
    assert r == "Sorry, I don't have an answer for that right now."