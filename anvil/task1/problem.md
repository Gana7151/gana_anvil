Task: Handle "what is fraud detection" question

Add a response in get_response() for when user asks what fraud detection is.

Requirements:
1. If message contains "what is fraud detection" or "how does fraud detection work" (case-insensitive), return an explanation
2. The response must mention "patterns" or "rules"
3. All other messages still return the default response
4. Return 400 if message is empty or missing