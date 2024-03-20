<?php
// Database configuration
$dbHost = 'localhost';
$dbUsername = 'your_db_username';
$dbPassword = 'your_db_password';
$dbName = 'your_db_name';

// Connect to the database
$conn = new mysqli($dbHost, $dbUsername, $dbPassword, $dbName);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Retrieve form data
$email = $_POST['signup-email'];
$password = $_POST['signup-password'];

// Hash the password
$hashedPassword = password_hash($password, PASSWORD_DEFAULT);

// Prepare and execute the SQL statement to insert user data into the database
$stmt = $conn->prepare("INSERT INTO users (email, password) VALUES (?, ?)");
$stmt->bind_param("ss", $email, $hashedPassword);

if ($stmt->execute()) {
    // Registration successful
    echo "Registration successful";
} else {
    // Registration failed
    echo "Error: " . $conn->error;
}

$stmt->close();
$conn->close();
?>
