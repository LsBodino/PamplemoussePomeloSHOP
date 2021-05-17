<!doctype html>
<html lang="fr">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="../templates/assets/css/bootstrap.css">
    <script src="https://kit.fontawesome.com/8c91069ed9.js"></script>
    <link rel="stylesheet" href="../templates/assets/css/style.css">
    <title>Pamplemousse & Pomélo SHOP</title>
  </head>
  <body>
    <main>
      {include file="../templates/header.tpl"}
      <section class="container-fluid" id="content">
        {block name=body}{/block}
      </section>
      {if !empty($msgPanier) && isset($msgtype) && $msgtype == "addOk"}
          <div class="modal" tabindex="-1" role="dialog" id="msgPanier">
            <div class="modal-dialog" role="document">
              <div class="modal-content">
                <div class="modal-body">
                  <p class="alert alert-success">{$msgPanier}</p>
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-primary" data-dismiss="modal">Continuer mes achats</button>
                  <a href="../panier.php"><button type="button" class="btn btn-secondary">Aller vers mon panier</button></a>
                </div>
              </div>
            </div>
          </div>
      {/if }
      {include file="../templates/footer.tpl"}
    </main>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script
              src="https://code.jquery.com/jquery-3.4.1.min.js"
              integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
              crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>

    <script src="../templates/js/script.js"></script>
    {if !empty($msgPanier)}
    <script>
      $('#msgPanier').modal('show');
    </script>
    {/if}
  </body>
</html>