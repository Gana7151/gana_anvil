Task: Handle "velocity alert" question

Add a response in get_response() for when user asks what a velocity alert is.

Requirements:
1. If message contains "velocity alert" (case-insensitive), return a response
2. The response must mention "time" or "transactions"
3. All other messages still return the default response