Task: Handle "foreign transaction" question

Add a response in get_response() for when user asks about transactions from another country.

Requirements:
1. If message contains "another country", "different country", or "foreign transaction" (case-insensitive), return a response
2. The response must mention "geo" or "flag"
3. All other messages still return the default response