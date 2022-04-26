<!DOCTYPE html>
<html>
    <head>
        <title>All Instructors</title>
    </head>
    <body>

        <?php
        include("dbconnect.php");
        $query = "SELECT ssn, iname FROM instructor order by ssn ";
        $result = mysqli_query($conn, $query);
        $num = mysqli_num_rows($result);
        mysqli_close($conn);
        ?>

        <h4>Instructors of University</h4>
        <table border="2" cellspacing="2" cellpadding="2">
            <tr>
                <th>Instructor SSN</th>
                <th>Instructor Name</th>
            </tr>

            <?php
            $i = 0;
            while ($i < $num) {
                $row = mysqli_fetch_assoc($result);
                $essn = $row["ssn"];
                $iname = $row["iname"];
                //$dno = mysql_result($result, $i, "dnumber");
                //$dname = mysql_result($result, $i, "dname");
                ?>

                <tr>
                         <td><font face="Arial, Helvetica, sans-serif">
                        <a href="instructorView.php?ssn=<?php echo $essn; ?>"><?php echo $essn; ?></a></font></td>
                    <td><font face="Arial, Helvetica, sans-serif"><?php echo $iname; ?></font></td>
                   
                </tr>

                <?php
                $i++;
            }
            ?>

        </table>

        <P>
            <a href="./mainpage.html">Return to main page</a>

    </body>
</html>

