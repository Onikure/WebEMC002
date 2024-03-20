<?php
session_start();

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
$email = $_POST['login-email'];
$password = $_POST['login-password'];

// Prepare and execute the SQL statement to retrieve user data from the database
$stmt = $conn->prepare("SELECT id, email, password FROM users WHERE email = ?");
$stmt->bind_param("s", $email);
$stmt->execute();
$stmt->store_result();

if ($stmt->num_rows == 1) {
    // User found, verify password
    $stmt->bind_result($id, $email, $hashedPassword);
    $stmt->fetch();

    if (password_verify($password, $hashedPassword)) {
        // Password is correct, set session variables and redirect to profile page
        $_SESSION['user_id'] = $id;
        $_SESSION['email'] = $email;
        header("Location: profile.php");
    } else {
        // Incorrect password
        echo "Incorrect password";
    }
} else {
    // User not found
    echo "User not found";
}

$stmt->close();
$conn->close();
?>
