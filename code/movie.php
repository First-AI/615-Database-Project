<html>
<head>
    <title>Movie Database</title>
</head>
<body>

<?php
// display errors
ini_set('error_reporting', E_ALL);
ini_set('display_errors', true);


// ********* Remember to use your MySQL username and password here ********* //
$db = mysql_connect("dbase.cs.jhu.edu", "19_fzhang43", "gexzesxfzs");

// **** Remember to use the name of your database here **** //
mysql_select_db("cs415_fall_19_fzhang43", $db);

if (!$db) {
    echo "Connection failed!";
} else {

    $checkbox1 = $_POST['checkbox1'];
    if (empty($checkbox1) or in_array("All", $checkbox1)){
        $dropview1 ="DROP VIEW IF EXISTS temp1;";
        $drop1= mysql_query($dropview1) or die(mysql_error());
        $query1 = "CREATE VIEW temp1 AS SELECT ID, Genres, Title, Spoken_languages as Language, Release_Date FROM MovieDetails;";
        $dave1= mysql_query($query1) or die(mysql_error());
    } else{
        $Genres = "";
        for ($i = 0; $i < count($checkbox1); ++$i) {
            $Genres = $Genres . " Genres LIKE '%$checkbox1[$i]%' AND ";
        }

        $Genres_condition = preg_replace('/\W\w+\s*(\W*)$/', '$1', $Genres);

        $dropview1 ="DROP VIEW IF EXISTS temp1;";
        $drop1= mysql_query($dropview1) or die(mysql_error());
        $query1 = "CREATE VIEW temp1 AS SELECT ID, Genres, Title, Spoken_languages as Language, Release_Date FROM MovieDetails WHERE" . $Genres_condition;
        $dave1= mysql_query($query1) or die(mysql_error());
    }

    // Read language from the html form
    $language = $_POST['language'];
    if ($language=="All"){
        $dropview2 ="DROP VIEW IF EXISTS temp2;";
        $drop2= mysql_query($dropview2) or die(mysql_error());
        $query2 = "CREATE VIEW temp2 AS SELECT * FROM temp1;";
        $dave2= mysql_query($query2) or die(mysql_error());
    }else{
        $dropview2 ="DROP VIEW IF EXISTS temp2;";
        $drop2= mysql_query($dropview2) or die(mysql_error());
        $query2 = "CREATE VIEW temp2 AS SELECT * FROM temp1 WHERE Language = '$language' ";
        $dave2= mysql_query($query2) or die(mysql_error());
    }


    // Read ratings from the html form
    $ratings = $_POST['ratings'];
    $dropview3 ="DROP VIEW IF EXISTS temp3;";
    $drop3= mysql_query($dropview3) or die(mysql_error());
    $query3 = "CREATE VIEW temp3 AS SELECT temp2.ID as ID, Title, Genres, Language, Vote_Average AS Voting, Release_Date FROM temp2 INNER JOIN Voting ON Voting.ID=temp2.ID WHERE Vote_Average > $ratings;";
    $dave3= mysql_query($query3) or die(mysql_error());

    // Read release year from the html form
    $year = $_POST['year'];
    $dropview4 ="DROP VIEW IF EXISTS temp4;";
    $drop4= mysql_query($dropview4) or die(mysql_error());
    $query4 = "CREATE VIEW temp4 AS SELECT * FROM temp3 WHERE Release_Date LIKE '%$year%';";
    $dave4= mysql_query($query4) or die(mysql_error());

    // Read director from the html form
    $director = $_POST['director'];
    if (is_null($director)){
        $dropview5 ="DROP VIEW IF EXISTS temp5;";
        $drop5= mysql_query($dropview5) or die(mysql_error());
        $query5 = "CREATE VIEW temp5 AS SELECT * FROM temp4;";
        $dave5= mysql_query($query5) or die(mysql_error());
    } else{
        $dropview5 ="DROP VIEW IF EXISTS temp5;";
        $drop5= mysql_query($dropview5) or die(mysql_error());
        $query5 = "CREATE VIEW temp5 AS SELECT Title, Genres, Language, Voting, Release_Date, Director_Name AS Director FROM temp4 INNER JOIN DirectedBy ON DirectedBy.ID = temp4.ID WHERE Director_Name LIKE '%$director%';";
        $dave5= mysql_query($query5) or die(mysql_error());
    }



    // $verification = mysql_query("SELECT * FROM Passwords WHERE CurPasswords='$password' ", $db);
    // if ($myrow = mysql_fetch_array($verification))
        // Verify password
        // echo "Verification pass!\n";

        // Print the table before update
//        $query = "SELECT * FROM Rawscores WHERE SSN = '$ssn' ";
//        $dave= mysql_query($query) or die(mysql_error());
//
//        echo "<table border=1>\n";
//        while($row = mysql_fetch_assoc($dave)){
//            foreach($row as $cname => $cvalue){
//                print "<tr><td>$cname:  $cvalue</td><td>\t";
//            }
//            print "\r\n";
//        }
//        echo "</table>\n";
//
//
//
//        // print the table after update
//        $query = "SELECT * FROM Rawscores WHERE SSN = '$ssn' ";
//        $dave= mysql_query($query) or die(mysql_error());
//        echo "\n\n";
//        echo "After update\n";
//        echo "<table border=1>\n";
//        while($row = mysql_fetch_assoc($dave)){
//            foreach($row as $cname => $cvalue){
//                print "<tr><td>$cname:  $cvalue</td><td>\t";
//            }
//            print "\r\n";
//        }
//        echo "</table>\n";

}
?>

</body>
</html>

