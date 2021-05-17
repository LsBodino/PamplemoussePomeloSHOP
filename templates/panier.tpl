{extends file="templates/layout.tpl"}
{block name=body}
  <section class="row">
    <div class="col-8">
      <table class="table table-striped table-hover">
        <thead class="">
          <tr class="bg-danger text-white">
            <th scope="col">Produit</th>
            <th scope="col">Prix Solo</th>
            <th scope="col">Quantité</th>
            <th scope="col">Prix HT</th>
            <th scope="col">&nbsp;</th>
          </tr>
        </thead>
        <tbody>
          {foreach $panier as $produits}
          <tr>
            <td>
              <div class="row">
                <div class="col-3"><a href="produit/{$produits[0]->id}"><img src="templates/assets/img/produits/{$produits[0]->img}" alt="{$produits[0]->nom}" class="imgPanier"></a></div>
                <div class="col-3"><a href="produit/{$produits[0]->id}">{$produits[0]->nom}</a></div> 
              </div>
            </td>
            <td>{number_format($produits[0]->prix, 2, ',', ' ')} €</td>
            <td>
            <form action="updp" method="POST">
              <input type="hidden" name="idProduit" value="{$produits[0]->id}">
              <input type="number" name="qteProduit" value="{$produits[1]}" min="0" max="{$produits[0]->stock}" class="form-control updateQte">
            </form>
            </td>
            <td>{number_format($produits[1]*$produits[0]->prix, 2, ',', ' ')} €</td>
            <td><a href="delp?id={$produits[0]->id}"><button type="button" class="btn btn-outline-danger" ><i class="fas fa-trash-alt"></i></button></a></td>
          </tr>
          {/foreach}
          {if count($panier)==0}
            <td>Votre panier est vide, ce qui fait de vous une très mauvaise personne, car vous ne rémunerez pas les agriculteurs de Pamplemousses.</td>
          {/if}
        </tbody>
      </table>
      <a href="index" class="btn btn-primary">Continuer mes achats</a>
    </div>
    <div class="col-4">
      <div class="card">
        <div class="card-header text-white bg-danger font-weight-bold">
          Totaux
        </div>
        <div class="card-body">
          <div class="alert alert-primary">Total HT : {number_format($pu, 2, ',', ' ')} €</div>
          <div class="alert alert-warning">TVA : 0%</div>
          <div class="alert alert-danger font-weight-bold">Total TTC : {number_format($pu, 2, ',', ' ')} €</div>
        </div>
      </div>
      {if count($panier)>0}
        {if !$login}
          <a class="nav-link" href="#" data-toggle="modal" data-target="#formLogin" id="boutonPayer"><input type="button" class="btn btn-primary" value="Se connecter"></a>
        {else}
          <a class="nav-link" href="money"><input type="button" class="btn btn-primary" value="Rémunérer les agriculteurs de Pamplemousses"></a>
        {/if}
      
      {/if}
    </div>
  </section>
  
{/block}