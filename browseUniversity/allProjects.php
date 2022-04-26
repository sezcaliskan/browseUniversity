<!DOCTYPE html>
<html>
    <head>
        <title>All Departments</title>
    </head>
    <body>

        <?php
        include("dbconnect.php");
        $query = "SELECT leadSsn,pName,subject,budget,startDate,enddate, controllingDName FROM project order by pName";
         $result = mysqli_query($conn, $query);
        $num = mysqli_num_rows($result);
        mysqli_close($conn);
        ?>

        <h4>Instructors of University</h4>
        <table border="2" cellspacing="2" cellpadding="2">
            <tr>
                <th>pro leadssn</th>
                <th>pro name </th>
                <th>pro subject </th>
                <th>pro budget</th>
                 <th>pro startdate</th>
                  <th>pro enddate</th>
                   <th>pro contdep</th>
            </tr>

            <?php
            $i = 0;
            while ($i < $num) {
                $row = mysqli_fetch_assoc($result);
                $leadssn = $row["leadSsn"];
                $pName = $row["pName"];
                $subject = $row["subject"];
                $budget = $row["budget"];
                 $startDate = $row["startDate"];
                $enddate = $row["enddate"];
                $controllingDName = $row["controllingDName"];
                //$dno = mysql_result($result, $i, "dnumber");
                //$dname = mysql_result($result, $i, "dname");
                ?>

                <tr>
                         <td><font face="Arial, Helvetica, sans-serif">
                        <a href="departmentView.php?leadSsn=<?php echo $leadssn; ?>"><?php echo $leadssn; ?></a></font></td>
                    <td><font face="Arial, Helvetica, sans-serif"><?php echo $pName; ?></font></td>
                     <td><font face="Arial, Helvetica, sans-serif"><?php echo $subject; ?></font></td>
                       <td><font face="Arial, Helvetica, sans-serif"><?php echo $budget; ?></font></td>
                        <td><font face="Arial, Helvetica, sans-serif"><?php echo $startDate; ?></font></td>
                     <td><font face="Arial, Helvetica, sans-serif"><?php echo $enddate; ?></font></td>
                       <td><font face="Arial, Helvetica, sans-serif"><?php echo $controllingDName; ?></font></td>
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


