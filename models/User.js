const mongoose = require('mongoose');

const userSchema = new mongoose.Schema({
    fullName: { type: String, required: true },
    email: { type: String, required: true, unique: true },
    password: { type: String, required: true }, // Hashed password
    role: { type: String, enum: ['student', 'admin'], default: 'student' },
    targetExams: [{ type: String }], // e.g., ['UPSC', 'UP Police']
    appStreak: { type: Number, default: 0 }, // Duolingo style streak
    isFaceIdEnabled: { type: Boolean, default: false }
}, { timestamps: true });

module.exports = mongoose.model('User', userSchema);
