
<html>
<head>
    <title>Reset Password</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>

<div class="container-fluid">
    <div class="row">
        <div class="col-md-4"></div>
        <div class="col-md-4">
            <?php
            $error = '';
            include('initialize.php');
            $con = new mySqli('localhost', 'root', '', 'book_shop_db');

            if($con->connect_error) {
                die('Could not connect to the database.');
            }

            if (isset($_GET["key"]) && isset($_GET["email"]) && isset($_GET["action"]) && ($_GET["action"] == "reset") && !isset($_POST["action"])) {
                $key = $_GET["key"];
                $email = $_GET["email"];
                $curDate = date("Y-m-d H:i:s");
                $query = mysqli_query($con, "SELECT * FROM `password_reset_temp` WHERE `key`='" . $key . "' and `email`='" . $email . "';");
                $row = mysqli_num_rows($query);
                if ($row == "") {
                    $error .= '<h2>Invalid Link</h2>';
                } else {
                    $row = mysqli_fetch_assoc($query);
                    $expDate = $row['expDate'];
                    if ($expDate >= $curDate) {
                        ?>
                        <h2>Reset Password</h2><br>
                        <form method="post" action="" name="update">

                            <input type="hidden" name="action" value="update" class="form-control"/>


                            <div class="form-group">
                                <label><strong>Enter New Password</strong></label>
                                <input type="password"  name="pass1" class="form-control" placeholder="New Password"/>
                            </div>

                            <div class="form-group">
                                <label><strong>Confirm Your Password</strong></label>
                                <input type="password"  name="pass2" class="form-control" placeholder="Confirm Password"/>
                            </div>
                            <input type="hidden" name="email" value="<?php echo $email; ?>"/>
                            <div class="form-group">
                                <input type="submit" id="reset" value="Reset Password"  class="btn btn-primary"/>
                            </div>

                        </form>
                        <?php
                    } else {
                        $error .= "<h2>Link Expired</h2>";
                    }
                }
                if ($error != "") {
                    echo "<div class='error'>" . $error . "</div><br />";
                }
            }


            if (isset($_POST["email"]) && isset($_POST["action"]) && ($_POST["action"] == "update")) {
                $error = "";
                $pass1 = mysqli_real_escape_string($con, $_POST["pass1"]);
                $pass2 = mysqli_real_escape_string($con, $_POST["pass2"]);
                $email = $_POST["email"];
                $curDate = date("Y-m-d H:i:s");
                if ($pass1 != $pass2) {
                    $error .= "<p>Password do not match, both password should be the same.<br /><br /></p>";
                }
                if ($error != "") {
                    echo $error;
                } else {

                    $pass1 = md5($pass1);
                    mysqli_query($con, "UPDATE `clients` SET `password` = '" . $pass1 . "', `date_created` = '" . $curDate . "' WHERE `email` = '" . $email . "'");

                    mysqli_query($con, "DELETE FROM `password_reset_temp` WHERE `email` = '$email'");

                    echo '<div class="error"><p>Congratulations! Your password has been updated successfully.<br> <a href="index.php">Go back to homepage</a> </p>';
                }
            }
            ?>

        </div>
        <div class="col-md-4"></div>
    </div>
</div>


</body>
</html>