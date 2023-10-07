<?php
header("Content-Type: application/json");
$id = $_GET["id"];

$sql = new mysqli("localhost", "root", "", "book");

if($_SERVER['REQUEST_METHOD'] == "GET"){
    $query = "SELECT * FROM `book`" . ($id ? " WHERE id = $id" : "");
    $result = $sql->query($query);

    $answer = [];
    while($row = $result->fetch_assoc())
        array_push($answer, $row);

    echo json_encode($answer);
}
if($_SERVER['REQUEST_METHOD'] == "POST"){
    if($id){
        if($_POST["ФИО"] === null and $_POST["Компания"] === null and $_POST["Телефон"] === null and $_POST["Email"] === null and $_POST["Дата рождения"] === null and $_POST["Фото"] === null)
            die('"error"');

        $update = [];
        if($_POST["ФИО"])           array_push($update, '`name` = "'      .$_POST["ФИО"].'"');
        if($_POST["Компания"])      array_push($update, '`company` = "'   .$_POST["Компания"].'"');
        if($_POST["Телефон"])       array_push($update, '`phone` = "'     .$_POST["Телефон"].'"');
        if($_POST["Email"])         array_push($update, '`email` = "'     .$_POST["Email"].'"');
        if($_POST["Дата рождения"]) array_push($update, '`birth_date` = "'.$_POST["Дата рождения"].'"');
        if($_POST["Фото"])          array_push($update, '`photo` = "'     .$_POST["Фото"].'"');

        $query = "UPDATE `book` SET " . implode(", ", $update) . " WHERE `id` = " . $id;
        $sql->query($query);

        if($err = $sql->error_get_last)
            echo json_encode($err);
        else
            echo "updated";


    }else{
        if($_POST["ФИО"] === null or $_POST["Телефон"] === null or $_POST["Email"] === null)
            die('"error"');

        $values = ['"'.$_POST["ФИО"].'"'];

        if($_POST["Компания"]) array_push($values, '"'.$_POST["Компания"].'"'); else array_push($values, "NULL");
        
        array_push($values, '"'.$_POST["Телефон"].'"');
        array_push($values, '"'.$_POST["Email"].'"');
        
        if($_POST["Дата рождения"]) array_push($values, '"'.$_POST["Дата рождения"].'"'); else array_push($values, "NULL");
        if($_POST["Фото"])          array_push($values, '"'.$_POST["Фото"].'"');          else array_push($values, "NULL");
        
        $query = "INSERT INTO `book` VALUES (NULL, " . implode(", ", $values) . ")";
        $sql->query($query);
        
        if($err = $sql->error_get_last)
            echo json_encode($err);
        else
            echo "inserted";
    }
}
if($_SERVER['REQUEST_METHOD'] == "DELETE"){
    if(!$id)
        die("error");

    $query = "DELETE from `book` WHERE id = " . $id;
    $sql->query($query);

        if($err = $sql->error_get_last)
            echo json_encode($err);
        else
            echo "deleted";
}