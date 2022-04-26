<!DOCTYPE html>
<html>
    <head>
        <title>All Departments</title>
    </head>
    <body>

        <?php
        include("dbconnect.php");
        $query = "SELECT dName,budget,headSsn,buildingName FROM department order by dName ";
        $result = mysqli_query($conn, $query);
        $num = mysqli_num_rows($result);
        mysqli_close($conn);
        ?>

        <h4>Instructors of University</h4>
        <table border="2" cellspacing="2" cellpadding="2">
            <tr>
                <th>dep name</th>
                <th>dep budget </th>
                <th>dep headssn </th>
                <th>dep building</th>
            </tr>

            <?php
            $i = 0;
            while ($i < $num) {
                $row = mysqli_fetch_assoc($result);
                $dname = $row["dName"];
                $budget = $row["budget"];
                $headSsn = $row["headSsn"];
                $buildingName = $row["buildingName"];
                //$dno = mysql_result($result, $i, "dnumber");
                //$dname = mysql_result($result, $i, "dname");
                ?>

                <tr>
                         <td><font face="Arial, Helvetica, sans-serif">
                        <a href="departmentView.php?dName=<?php echo $dname; ?>"><?php echo $dname; ?></a></font></td>
                    <td><font face="Arial, Helvetica, sans-serif"><?php echo $budget; ?></font></td>
                     <td><font face="Arial, Helvetica, sans-serif"><?php echo $headSsn; ?></font></td>
                       <td><font face="Arial, Helvetica, sans-serif"><?php echo $buildingName; ?></font></td>
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


