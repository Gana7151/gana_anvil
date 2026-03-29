from flask import Flask, jsonify, request
app = Flask(__name__)
chat_history = []
def get_response(message):
    return "Sorry, I don't have an answer for that right now."
@app.route("/chat", methods=["POST"])
def chat():
    data = request.get_json()
    if not data or not data.get("message", "").strip():
        return jsonify({"error": "message can't be empty"}), 400
    message = data["message"]
    response = get_response(message)
    chat_history.append({"message": message, "response": response})
    return jsonify({"response": response})
@app.route("/history", methods=["GET"])
def history():
    return jsonify(chat_history)
if __name__ == "__main__":
    app.run(debug=True)