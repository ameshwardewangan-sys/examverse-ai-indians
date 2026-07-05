const axios = require('axios'); // API call karne ke liye

// Advanced GenAI Prompt Engineering
exports.generateCustomUniverseQuiz = async (req, res) => {
    const { examName, topic, universeTheme, difficulty } = req.body;

    try {
        // Yeh AI (Gemini/ChatGPT) ko diya jaane wala highly specific command hai
        const aiPrompt = `
            You are an expert exam setter for ${examName} in India. 
            Create a highly engaging 3-question Multiple Choice Quiz on the topic: "${topic}".
            The difficulty level must be: ${difficulty}.
            Crucial Twist: The entire language, story, and context of the questions MUST be set in the "${universeTheme}" universe. 
            Format the output STRICTLY as a JSON array of objects with keys: "question", "options" (array of 4), "correctAnswer", and "explanation".
        `;

        // Dummy Response (Asli app me yahan API call hogi: await openai.chat.completions.create(...))
        // Example logic showing how AI will respond:
        const aiGeneratedData = [
            {
                "question": "Iron Man wants to pass a new law in the Parliament to fund the Avengers. According to the Indian Constitution (Article 107), in which house can an ordinary bill be introduced?",
                "options": ["Only Lok Sabha", "Only Rajya Sabha", "Either Lok Sabha or Rajya Sabha", "Only by the President"],
                "correctAnswer": "Either Lok Sabha or Rajya Sabha",
                "explanation": "Jarvis reminds you that an ordinary bill can originate in either house of the Parliament!"
            },
            {
                "question": "Captain America is arguing about Fundamental Rights. Which Article guarantees 'Equality before Law'?",
                "options": ["Article 12", "Article 14", "Article 21", "Article 32"],
                "correctAnswer": "Article 14",
                "explanation": "Article 14 ensures everyone is equal, just like Steve Rogers treats every soldier."
            }
        ];

        res.status(200).json({
            success: true,
            theme: universeTheme,
            message: "Custom Universe Quiz Generated Successfully!",
            quizData: aiGeneratedData
        });

    } catch (error) {
        res.status(500).json({ success: false, message: "AI Engine Overloaded!" });
    }
};
