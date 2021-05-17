{extends file="templates/layout.tpl"}
{block name=body}
    <div class="row">
        {foreach $Produits as $product}
          <div class="col-3">
            <div class="card" style="width: 18rem;">
              <div class="card-body">
                <h5 class="card-title">{$product['nom']}</h5>
                <a href="../produit/{$product['id']}"><img class="card-img-top" src="../templates/assets/img/produits/{$product['img']}"></a>
                <p class="card-text">{$product['description']}</p>
                <a href="../produit/{$product['id']}" class="btn btn-primary">Voir</a>
              </div>
            </div>
            </div>
        {/foreach}
    </div>
{/block}