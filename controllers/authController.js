const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
// Model import karein (User.js)

// 1. Secure Login
exports.loginUser = async (req, res) => {
    const { email, password } = req.body;
    // Database check (conceptual logic)
    // const user = await User.findOne({ email });
    // const isMatch = await bcrypt.compare(password, user.password);

    // Agar successful raha:
    const token = jwt.sign({ userId: '12345', role: 'student' }, 'SUPER_SECRET_KEY', { expiresIn: '7d' });
    
    res.status(200).json({
        success: true,
        message: "Login Successful. Welcome to ExamVerse!",
        token: token,
    });
};

// 2. Forget Password (OTP via Email/SMS)
exports.forgotPassword = async (req, res) => {
    const { email } = req.body;
    // OTP generate code here (e.g., 6-digit random number)
    const otp = Math.floor(100000 + Math.random() * 900000);
    
    // Send email/SMS using 3rd party API (like SendGrid or Twilio)
    res.status(200).json({
        success: true,
        message: `OTP sent successfully to ${email}`,
        tempOTP: otp // For testing purpose only
    });
};

// 3. Logout (Client-side token destroy logic)
exports.logoutUser = (req, res) => {
    res.status(200).json({ success: true, message: "Logged out securely." });
};
