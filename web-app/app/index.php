<html>

<head>
        <title>Apache Server - Ubuntu(Vagrant)</title>
</head>

<body>
        <h2>Welcome to my Apacher Server. Running in Ubuntu machine</h2>
        <p>Added some lines</p>
        <?php
        include './conn.php';
        echo "php is also running <br>";
        echo ("This is served by server-container: " . gethostname() . "<br>");
        $result=$conn->query("select * from my_users;");
        print_r($result);

        // echo gethostname();
        echo phpinfo();
        ?>
</body>

</html>