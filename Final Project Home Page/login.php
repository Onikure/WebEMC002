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
    $email = $_POST['login-email'];
    $password = $_POST['login-password'];

    // Validate login credentials
    $sql = "SELECT * FROM users WHERE email = '$email' AND password = '$password'";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        // Username and password matched
        // Redirect or set session as per your requirement
        header("Location: dashboard.php");
        exit();
    } else {
        // Username and password didn't match
        // Handle invalid credentials
    }
}
?>
