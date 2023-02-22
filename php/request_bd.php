<?
$dat=$_REQUEST['dat'];

try {
    $conn = new PDO("mysql:host=localhost;dbname=product_bd", "root", "");
    $sql = "SELECT * FROM delivery where date=' $dat '";
    $result = $conn->query($sql);
    foreach($result as $row){
        header('Content-Type: application/json; charset=utf-8');
        echo json_encode($row);
    }
  
}
catch (PDOException $e) {
    echo "Database error: " . $e->getMessage();
}


?>