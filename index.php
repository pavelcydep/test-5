<!doctype html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Тестовое задание</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
  <link href="./assets/css/style.css">
</head>

<body>
  <div class="container">
    <form>
      <div class="mb-3">
        <label class="form-label">Количество,шт</label>
        <input type="text" class="form-control" name="product_name" id="product_name" aria-describedby="emailHelp">
        <div class="form-text">
        </div>
      </div>
      <div class="form-group">
        <label for="exampleFormControlSelect1">Дата поставки</label>
        <select class="form-select form-control" id="select">
          <?include('./php/delivery_bd.php')?>
        </select>
      </div>
      <button type="button" class="btn form-btn btn-primary">Применить</button>
    </form>

    <div class="container display-none">
      <div class="info"></div>
      <div class="info2"></div>
    </div>
  </div>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
</body>

</html>
<script type="module" src="./assets/js/script.js"></script>