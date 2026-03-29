Task: Handle "blocked transaction" question

Add a response in get_response() for when user asks what happens after a transaction is blocked.

Requirements:
1. If message contains "blocked" or "transaction blocked" (case-insensitive), return a response
2. The response must mention "review" or "team"
3. All other messages still return the default response