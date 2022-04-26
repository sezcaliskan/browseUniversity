<!DOCTYPE html>
<html>
    <head>
        <title>Department View</title>
    </head>
    <body>

        <?php
        include './dbconnect.php';
        $essn = $_GET["ssn"];

        $query = "SELECT iname FROM instructor,sectionn  where ssn= $essn ";
        $result = mysqli_query($conn, $query);
        $num = mysqli_num_rows($result);

        $row = mysqli_fetch_assoc($result);
        $instname = $row["iname"];

        echo "<b>Instructor: </b>", $instname;

        echo "<h4> INSTRUCTORS COURSES (teaching):</h4>";
        $query = "SELECT ssn, iname ,courseCode FROM instructor,sectionn WHERE $essn=ssn ;";
        $result = mysqli_query($conn, $query);
        $num = mysqli_num_rows($result);
        ?>

        <table border="2" cellspacing="2" cellpadding="2">
            <tr>
                <th><font face="Arial, Helvetica, sans-serif">INSTRUCTOR name</font></th>
                <th><font face="Arial, Helvetica, sans-serif">Course Code</font></th>

            </tr>

            <?php
            $i = 0;
            while ($i < $num) {
                $row = mysqli_fetch_assoc($result);


                $iname = $row["iname"];
                $courseCode = $row["courseCode"];
                ?>  
                <tr>
                    <td><font face="Arial, Helvetica, sans-serif">

                    <td><font face="Arial, Helvetica, sans-serif"><?php echo $iname; ?></font></td>
                    <td><font face="Arial, Helvetica, sans-serif"><?php echo $courseCode; ?></font></td>
                </tr>
                <?php
                $i++;
            }
            ?>

        </table>

        <?php
        echo "<h4>INSTRUCTORS PROJECTS(leading):</h4>";
        $query = "select P.pName from project P where P.leadSsn = $issn;";
        $result = mysqli_query($conn, $query);
        $num = mysqli_num_rows($result);
        ?>

        <table border="2" cellspacing="2" cellpadding="2">
            <tr>

                <th><font face="Arial, Helvetica, sans-serif">Project Name</font></th>

            </tr>

            <?php
            $i = 0;
            while ($i < $num) {

                $row = mysqli_fetch_assoc($result);


                $pname = $row["pname"];


                //
                ?>  
                <tr>
                    <td><font face="Arial, Helvetica, sans-serif">

                    <td><font face="Arial, Helvetica, sans-serif"><?php echo $pname; ?></font></td>

                </tr>
                <?php
                $i++;
            }
            ?>
        </table>

        <?php
        echo "<h4> INSTRUCTORS PROJECTS (working):</h4>";
        $query = "SELECT project.pName FROM  project, project_has_instructor WHERE  project_has_instructor.issn= $essn";
        $result = mysqli_query($conn, $query);
        $num = mysqli_num_rows($result);
        ?>

        <table border="2" cellspacing="2" cellpadding="2">
            <tr>

                <th><font face="Arial, Helvetica, sans-serif">Project Name</font></th>

            </tr>

            <?php
            $i = 0;
            while ($i < $num) {

                $row = mysqli_fetch_assoc($result);


                $pname = $row["pname"];


                //
                ?>  
                <tr>
                    <td><font face="Arial, Helvetica, sans-serif">

                    <td><font face="Arial, Helvetica, sans-serif"><?php echo $pname; ?></font></td>

                </tr>
                <?php
                $i++;
            }
            ?> </table>

        <?php
        echo "<h4> INSTRUCTOR'S STUDENTS (advising-undergraduate) </h4>";
        $query = "SELECT  student.studentid,student.dName,student.studentname FROM student,instructor WHERE $essn = student.advisorSsn , gradorUgrad=0";
        $result = mysqli_query($conn, $query);
        $num = mysqli_num_rows($result);
        ?>

        <table border="2" cellspacing="2" cellpadding="2">
            <tr>

                <th><font face="Arial, Helvetica, sans-serif">Student Name</font></th>

            </tr>

            <?php
            $i = 0;
            while ($i < $num) {

                $row = mysqli_fetch_assoc($result);


                $studentid = $row["studentid"];
                $studentname = $row["studentname"];
                $dName = $row["dName"];

                //
                ?>  
                <tr>
                    <td><font face="Arial, Helvetica, sans-serif">

                    <td><font face="Arial, Helvetica, sans-serif"><?php echo $studentid; ?></font></td>
                    <td><font face="Arial, Helvetica, sans-serif"><?php echo $studentname; ?></font></td>
                    <td><font face="Arial, Helvetica, sans-serif"><?php echo $dName; ?></font></td>
                </tr>
                <?php
                $i++;
            }
            ?>
        </table>

        <?php
        echo "<h4> INSTRUCTOR'S STUDENTS (supervising-graduate) </h4>";
        $query = "SELECT  student.studentid,student.dName,student.studentname FROM student,instructor WHERE $essn = student.advisorSsn , gradorUgrad=1";
        $result = mysqli_query($conn, $query);
        $num = mysqli_num_rows($result);
        ?>

        <table border="2" cellspacing="2" cellpadding="2">
            <tr>

                <th><font face="Arial, Helvetica, sans-serif">Student Name</font></th>

            </tr>

            <?php
            $i = 0;
            while ($i < $num) {

                $row = mysqli_fetch_assoc($result);


                $studentid = $row["studentid"];
                $studentname = $row["studentname"];
                $dName = $row["dName"];

                //
                ?>  
                <tr>
                    <td><font face="Arial, Helvetica, sans-serif">

                    <td><font face="Arial, Helvetica, sans-serif"><?php echo $studentid; ?></font></td>
                    <td><font face="Arial, Helvetica, sans-serif"><?php echo $studentname; ?></font></td>
                    <td><font face="Arial, Helvetica, sans-serif"><?php echo $dName; ?></font></td>
                </tr>
                <?php
                $i++;

                mysqli_close($conn);
            }
            ?>


            <P>
                <a href="./mainpage.html">Return to main page</a>

                </body>
                </html>


