Task: Handle "travel abroad" question

Add a response in get_response() for when user asks about travelling and fraud alerts.

Requirements:
1. If message contains "travel" or "abroad" (case-insensitive), return a response
2. The response must mention "geo" or "bank" or "notify"
3. All other messages still return the default response