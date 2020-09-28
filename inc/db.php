<?php

// TODO #1 créer un objet PDO permettant de se connecter à la base de données "videogame"
// et le stocker dans la variable $pdo
// --- START OF YOUR CODE ---

    // établir la connexion avec la BDD sur localhost (ou 127.0.0.1)
    $dsn= 'mysql:dbname=videogame;host=127.0.0.1';
    $user = 'root';
    $password = 'root';
    $options = [
      PDO::ATTR_ERRMODE => PDO::ERRMODE_WARNING
    ];

  // intanciation objet PDO dans la variable $pdo
  $pdo = new PDO($dsn, $user, $password, $options);


// --- END OF YOUR CODE ---
