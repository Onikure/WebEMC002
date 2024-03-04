<?php
$servername = "localhost";
$username = "your_username";
$password = "your_password";
$database = "wowowings";

// Create connection
$conn = new mysqli($servername, $username, $password, $database);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $email = $_POST['signup-email'];
    $password = $_POST['signup-password'];

    // Check if the email already exists
    $check_query = "SELECT * FROM users WHERE email = '$email'";
    $check_result = $conn->query($check_query);

    if ($check_result->num_rows > 0) {
        // Email already exists
        // Handle this case, like showing an error message
    } else {
        // Insert the new user into the database
        $insert_query = "INSERT INTO users (email, password) VALUES ('$email', '$password')";
        if ($conn->query($insert_query) === TRUE) {
            // User registered successfully
            // Redirect or show a success message
        } else {
            // Error occurred while registering user
            // Handle this case
        }
    }
}
?>
