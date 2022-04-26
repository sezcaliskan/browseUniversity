<?php
include './dbconnect.php';
$essn = $_GET["ssn"];

$query = "SELECT studentid,studentname,dName FROM student,department WHERE ssn= $essn and dName=dName ";
$result = mysqli_query($conn, $query);
$num = mysqli_num_rows($result);

$row = mysqli_fetch_assoc($result);
$essn = $row["ssn"];
$sutdentid = $row["studentid"];
$sutdentname = $row["studentname"];
$dName = $row["dName"];

echo "<b>STUDENT id: </b>", $studentid, "<br>";
echo "Student Name: ", $studentname, "<br>";
echo "STUDENTS DEPARTMENT NAME: ", $dName, "<br>";


echo "<h4>STUDENT'S ADVISOR:</h4>";
$query = "SELECT instructor.iname FROM instructor,studentWHERE  student.ssn= $essn and student.advisorSsn=instructor.ssn"; // QUERY1
$result = mysqli_query($conn, $query);
$num = mysqli_num_rows($result);

$iname = $row["iname"];
echo "<b>STUDENT's ADVISOR : </b>", $iname, "<br>";





echo "<h4>STUDENT'S COURSES :</h4>";
$query = "SELECT studentname, courseCode FROM enrollment,student WHERE  enrollment.sssn= $essn;"; // QUERY2
$result = mysqli_query($conn, $query);
$num = mysqli_num_rows($result);
?>

<table border="2" cellspacing="2" cellpadding="2">
    <tr>
        <th><font face="Arial, Helvetica, sans-serif">student name</font></th>
        <th><font face="Arial, Helvetica, sans-serif">course code</font></th>

    </tr>

    <?php
    $i = 0;
    while ($i < $num) {

        $row = mysqli_fetch_assoc($result);

        $studentname = $row["studentname"];
        $courseCode = $row["courseCode"];


        //$pnum = mysqli_result($result, $i, "pnumber");
        //$pname = mysqli_result($result, $i, "pname");
        //$ploc = mysqli_result($result, $i, "plocation");
        ?>  
        <tr>
            <td><font face="Arial, Helvetica, sans-serif">

            <td><font face="Arial, Helvetica, sans-serif"><?php echo $studentname; ?></font></td>
            <td><font face="Arial, Helvetica, sans-serif"><?php echo $courseCode; ?></font></td>
        </tr>
        <?php
        $i++;
    }
    ?>

    <?php
    echo "<h4>STUDENTS PROJECTS (if graduate):</h4>";
    $query = "SELECT instructor.iname , project.pName FROM student,project,instructor WHERE student.gradorUgrad=1 and instructor.ssn= student.advisorSsn and student.ssn= $essn"; // QUERY3
    $result = mysqli_query($conn, $query);
    $num = mysqli_num_rows($result);
    ?>

    <table border="2" cellspacing="2" cellpadding="2">
        <tr>
            <th><font face="Arial, Helvetica, sans-serif">İNSTRUCTOR NAME </font></th>
            <th><font face="Arial, Helvetica, sans-serif">PROJECT NAME</font></th>

        </tr>

<?php
$i = 0;
while ($i < $num) {

    $row = mysqli_fetch_assoc($result);

    $iname = $row["iname"];
    $pName = $row["pName"];


    //$pnum = mysqli_result($result, $i, "pnumber");
    //$pname = mysqli_result($result, $i, "pname");
    //$ploc = mysqli_result($result, $i, "plocation");
    ?>  
            <tr>
                <td><font face="Arial, Helvetica, sans-serif">

                <td><font face="Arial, Helvetica, sans-serif"><?php echo $iname; ?></font></td>
                <td><font face="Arial, Helvetica, sans-serif"><?php echo $pName; ?></font></td>
            </tr>
    <?php
    $i++;
}

mysqli_close($conn);
?>





        <P>
            <a href="./mainpage.html">Return to main page</a>

            </body>
            </html>