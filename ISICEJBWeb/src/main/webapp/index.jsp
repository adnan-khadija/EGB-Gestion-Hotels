<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestion des Hotels au Maroc</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <style>
        body {
            background-color: #FFF5E0;
            color: #141E46;
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            height: 100vh;
            overflow-x: hidden;
            position: fixed;
            width: 100%;
        }

        .header {
            background-color: #FF6969;
            color: #FFF5E0;
            padding: 1rem;
            text-align: center;
        }

        .container {
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
            background-color: #C70039;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .hotel-background {
            width: 100%;
            max-width: 100%;
            height: auto;
            border-radius: 10px;
            margin-bottom: 20px;
        }

        .btn-container {
            text-align: center;
            margin-top: 20px;
        }

        .btn-primary {
            background-color: #FF6969;
            border: none;
            padding: 10px 20px;
            color: #FFF5E0;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            border-radius: 5px;
            transition: background-color 0.3s ease;
            margin-right: 10px;
        }

        .btn-primary:hover {
            background-color: #C70039;
        }

        .btn-home {
            background-color: #C70039;
            border: none;
            padding: 10px 20px;
            color: #FFF5E0;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .btn-home:hover {
            background-color: #FF6969;
        }

        .logo {
            width: 80px; /* Ajuster la largeur du logo */
            height: auto; /* Garder l'aspect ratio */
            margin-right: 10px;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1 class="display-4">
            <img src="https://www.ucd.ac.ma/wp-content/uploads/2017/09/ensaj1.png" alt="Logo" class="logo"> Gestion Hotels
        </h1>
        <div class="btn-container">
            <a href="VilleController" class="btn btn-primary">Gestion des Villes</a>
            <a href="HotelController" class="btn btn-primary">Gestion des Hotels</a>
            <a href="#" class="btn btn-home">Acueil</a>
        </div>
    </div>
    <div class="container">
        <img src="https://media.architecturaldigest.in/wp-content/uploads/2019/10/Carousel-1-1366x768.jpg" alt="Hotel Background" class="hotel-background">
    </div>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
