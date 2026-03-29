Task: Handle "high risk alert" question

Add a response in get_response() for when user asks about a high risk alert.

Requirements:
1. If message contains "high risk alert" or "high_risk alert" (case-insensitive), return a response
2. The response must mention "verify" or "support"
3. All other messages still return the default response
4. Return 400 if message is empty or missing