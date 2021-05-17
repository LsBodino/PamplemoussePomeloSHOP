<!-- Modal -->
<div class="modal" id="formLogin" tabindex="-1" role="dialog" aria-labelledby="LoginTitre" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="LoginTitre">Espace Membre</h5>
        <button type="button" class="btn-close" data-dismiss="modal">
        </button>
      </div>
      <div class="modal-body">
        <div class="row">
          <aside class="col-sm-6">
            <div class="card">
              <article class="card-body">
                <h4 class="card-title text-center mb-4 mt-1">Connexion</h4>
                <hr>
                <form method="post" action="../login.php">
                  <input type="hidden" name="actionLogin" id="actionLogin" value="">
                  <div class="form-group">
                    <div class="form-floating mb-3">
                      <input name="email" class="form-control" id="email" type="email">
                      <label for="email">Adresse mail</label>
                    </div>
                  </div><br>
                  <div class="form-group">
                    <div class="form-floating mb-3">
                      <input name="pass" class="form-control" id="mdp" type="password">
                      <label for="mdp">Mot de passe</label>
                    </div>
                  </div><br>  
                  <div class="form-group">
                    <button type="submit" class="btn btn-primary btn-block"> Se connecter  </button>
                  </div> <!-- form-group// -->                          
                </form>
              </article>
            </div> <!-- card.// -->
          </aside> <!-- col.// -->
          <aside class="col-sm-6">
            <div class="card">
              <article class="card-body">
                <h4 class="card-title text-center mb-4 mt-1">Inscription</h4>
                <hr>
                <form method="post" action="../register.php">
                <input type="hidden" name="actionRegister" id="actionRegister" value="">
                  <div class="form-group">
                    <div class="form-floating mb-3">
                      <input name="username" class="form-control" id="username" type="text">
                      <label for="username">Nom d'utilisateur</label>
                    </div>
                  </div><br>
                  <div class="form-group">
                    <div class="form-floating mb-3">
                      <input name="email" class="form-control" id="email2" type="email">
                      <label for="email2">Adresse mail</label>
                    </div>
                  </div><br>
                  <div class="form-group">
                    <div class="form-floating mb-3">
                      <input name="pass" class="form-control" id="mdp2" type="password">
                      <label for="mdp2">Mot de passe</label>
                    </div>
                  </div><br>
                  <div class="form-group">
                    <button type="submit" class="btn btn-primary btn-block"> S'inscrire  </button>
                  </div> 
                </form>
              </article>
            </div> <!-- card.// -->
          </aside> <!-- col.// -->
        </div> <!-- row.// -->
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Fermer</button>
      </div>  
    </div>
  </div>
</div>