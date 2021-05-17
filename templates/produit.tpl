{extends file="templates/layout.tpl"}
{block name=body}
  <div class="container">
    <div class="card mb-3">
      <div class="row no-gutters">
        <div class="col-md-4">
          <img src="../templates/assets/img/produits/{$product->img}" class="card-img" alt="{$product->nom}">
        </div>
        <div class="col-md-8">
          <div class="card-body">
            <h5 class="card-title">{$product->nom}</h5>
            <p class="card-text">{$product->description}</p>
            <p class="card-text">{$product->prix} €</p>
            {if ($product->id)==11}
              <p class="card-text">Pourquoi commander ? Quand on peut le télécharger sur <a href="http://pamplemoussecms.com" target="_blank">PamplemousseCMS.com</a>.</p>
            {elseif ($product->stock)==0}
              <p class="card-text">Victime de leurs succès, les stocks pour ce produit sont vides.</p>
            {else}
              <p class="card-text">Stock restant: {$product->stock}</p>
              <form action="../addp" method="post">
                <input type="hidden" name="idProduit" value="{$product->id}">
                <input type="hidden" name="stockProduit" value="{$product->stock}">
                <input type="number" name="qteProduit" class="form-control" max="{$product->stock}" value="1"><br>
                <input type="submit" class="btn btn-primary" value="Ajouter au panier">
              </form>
            {/if}
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="container">
    <h5>Dans la même categorie</h5>
    <div class="row justify-content-around">
    {foreach $othersProducts as $product}

        <div class="card mb-3" style="width: 18rem;">
          <div class="container">
            <a href="../produit/{$product['id']}"><img class="card-img-top" src="../templates/assets/img/produits/{$product['img']}" alt="Card image cap" style="height: 200px;"></a>
          </div>
          <div class="card-body">
            <h5 class="card-title">{$product['nom']}</h5>
            <p class="card-text">{$product['description']}</p>
            <a href="../produit/{$product['id']}" class="btn btn-primary">Voir</a>
          </div>
        </div>
    
    {/foreach}
    </div>
  </div>
{/block}