Task: Handle "multiple rapid transactions" question

Add a response in get_response() for when user reports card used multiple times rapidly.

Requirements:
1. If message contains "10 times" or "multiple times" (case-insensitive), return a response
2. The response must mention "velocity" or "rapid"
3. All other messages still return the default response