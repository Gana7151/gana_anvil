Task: Handle "report a transaction" question

Add a response in get_response() for when user wants to report a suspicious transaction.

Requirements:
1. If message contains both "report" and "transaction" (case-insensitive), return a response
2. The response must mention "support" or "contact"
3. All other messages still return the default response