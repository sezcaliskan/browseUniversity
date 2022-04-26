<!DOCTYPE html>
<html>
    <head>
        <title>All Instructors</title>
    </head>
    <body>

        <?php
        include("dbconnect.php");
        $query = "SELECT ssn,studentid,studentname FROM student order by ssn ";
        $result = mysqli_query($conn, $query);
        $num = mysqli_num_rows($result);
        mysqli_close($conn);
        ?>

        <h4>Instructors of University</h4>
        <table border="2" cellspacing="2" cellpadding="2">
            <tr>
                <th>STUDENT SSN</th>
                <th>STUDENT ID</th>
                <th>STUDENT NAME</th>
            </tr>

            <?php
            $i = 0;
            while ($i < $num) {
                $row = mysqli_fetch_assoc($result);
                $essn = $row["ssn"];
                $studentid = $row["studentid"];
                $studentname = $row["studentname"];
               
                ?>

                <tr>
                         <td><font face="Arial, Helvetica, sans-serif">
                        <a href="studentView.php?ssn=<?php echo $essn; ?>"><?php echo $essn; ?></a></font></td>
                    <td><font face="Arial, Helvetica, sans-serif"><?php echo $studentid; ?></font></td>
                   <td><font face="Arial, Helvetica, sans-serif"><?php echo $studentname; ?></font></td>
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



