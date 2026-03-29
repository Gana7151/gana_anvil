Task: Handle "risk score" question

Add a response in get_response() for when user asks about a high risk score.

Requirements:
1. If message contains "risk score" AND either "0.9" or "high" (case-insensitive), return a response
2. The response must mention "block" or "critical"
3. All other messages still return the default response