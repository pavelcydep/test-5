<?
  try {
    $conn = new PDO("mysql:host=localhost;dbname=product_bd", "root", "");
    $sql = "SELECT * FROM delivery where product_id=3";
    $result = $conn->query($sql);
  
    foreach($result as $row){
    echo "<option id=" . $row['id'] . ">" . $row['date'] . "<option>";
        }
  
}
catch (PDOException $e) {
    echo "Database error: " . $e->getMessage();
}
?>

