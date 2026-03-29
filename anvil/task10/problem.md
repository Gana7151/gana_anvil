Task: Handle "how accurate is the model" question

Add a response in get_response() for when user asks about the accuracy of the fraud detection model.

Requirements:
1. If message contains "how accurate", "accuracy", or "fraud detection model" (case-insensitive), return a response
2. The response must mention "train" or "precision"
3. All other messages still return the default response