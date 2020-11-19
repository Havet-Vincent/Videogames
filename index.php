<?php

// Inclusion du fichier s'occupant de la connexion à la DB (TODO)

require __DIR__.'/inc/db.php'; 

// Initialisation de variables (évite les "NOTICE - variable inexistante")

$videogameList = array();
$platformList = array();
$name = '';
$editor = '';
$release_date = '';
$platform = '';

// Si le formulaire a été soumis

if (!empty($_POST)) {
    // Récupération des valeurs du formulaire dans des variables
    $name = isset($_POST['name']) ? : '';
    $editor = isset($_POST['editor']) ? : '';
    $release_date = isset($_POST['release_date']) ? : '';
    $platform = isset($_POST['platform']) ? intval($_POST['platform']) : 0;

    // si toutes les variables sont renseignées et non vides on insert dans la base les données

    if(empty($name) || empty($editor) || empty($release_date) || empty($platform)) :
        // afficher message erreur

        $error = "NON ! Pas assez de données.";

    else :
    
  
    // Insertion en DB du jeu video
    $insertQuery = "
        INSERT INTO videogame (name, editor, release_date, platform_id)
        VALUES ('{$name}', '{$editor}', '{$release_date}', {$platform})
    ";
    // TODO #3 exécuter la requête qui insère les données
    // TODO #3 une fois inséré, faire une redirection vers la page "index.php"
  
        $resultInsert = $pdo->exec($insertQuery);

        // si insertion réussie on vide $_POST et on retour vers page index
        if ($resultInsert) {
            //unset($_POST);
            header('Location: index.php');
           // exit();
        }else {
            $error = "Une erreur s'est produite pendant l'enregistrement";
        }

    endif;
}

// Liste des consoles de jeu
// TODO récupérer cette liste depuis la base de données

$platformQuery = 'SELECT `id`,`name` FROM `platform`';
$platformStatement = $pdo->query($platformQuery);

$platformList = $platformStatement->fetchAll(PDO::FETCH_KEY_PAIR);


// TODO écrire la requête SQL permettant de récupérer les jeux vidéos en base de données 

$sql = 'SELECT * FROM `videogame`';

// Si un tri a été demandé, on réécrit la requête
if (!empty($_GET['order'])) {
    // Récupération du tri choisi
    $order = trim($_GET['order']);
    if ($order == 'name') {
        // TODO #2 écrire la requête avec un tri par nom croissant

        $sql = 'SELECT * FROM `videogame` ORDER BY `name`';
    }
    else if ($order == 'editor') {
        // TODO #2 écrire la requête avec un tri par editeur croissant
        $sql = 'SELECT * FROM `videogame` ORDER BY `editor`';
    }
}
// TODO #1 exécuter la requête contenue dans $sql et récupérer les valeurs dans la variable $videogameList

    $resultatStatement = $pdo->query($sql);
    $videogameList = $resultatStatement->fetchAll(PDO::FETCH_ASSOC);


// Inclusion du fichier s'occupant d'afficher le code HTML
require __DIR__.'/view/videogame.php';
