{extends file="templates/layout.tpl"}
{block name=body}
  <section class="row">
    <div class="col-6">
      <h5>Paramètres</h5>
      <form action="updateuser.php" method="post">
        <div class="form-floating mb-3">
          <input type="email" id="email" name="email" class="form-control" value="{$userLogin->login}">
          <label for="email">Adresse mail *</label>
        </div>
        <div class="form-floating mb-3">
          <input type="password" id="pass1" name="pass1" class="form-control" placeholder="******">
          <label for="pass1">Mot de passe *</label>
        </div>
        <div class="form-floating mb-3">
          <input type="password" id="pass2" name="pass2" class="form-control" placeholder="******">
          <label for="pass2">Confirmation mot de passe *</label>
        </div>
          <input type="submit" class="btn btn-primary" value="Modifier">
        </div>
      </form>
    </div>
    <div class="col-6">
      <h5>Historique des commandes</h5>
      {foreach $commandes as $commande}
        <div class="row">
          <div class="col-9">{{$commande['id']}} - {{$commande['date']}}</div>
        </div>
      {/foreach}
    </div>
  </section>
{/block}