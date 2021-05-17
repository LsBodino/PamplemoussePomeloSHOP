{extends file="templates/layout.tpl"}

{block name=body}
  <div class="container">
    <div class="alert alert-warning" role="alert">
      Bienvenue sur Pamplemousse & Pomélo SHOP. <strong>PROMO: Pamplemousse classique à seulement 154e l'unité !</strong>
    </div>
    <section class="row justify-content-around">
      {foreach $categories as $categorie}
        <div class="card mb-3" style="width: 18rem;">
          <div class="container">
            <a href="categorie/{$categorie['id']}"><img class="card-img-top" src="templates/assets/img/cat/{$categorie['img']}"></a>
          </div>
          <div class="card-body">
            <a href="categorie/{$categorie['id']}" class="btn btn-primary btn-block">{$categorie['nom']}</a>
          </div>
        </div>
      {/foreach}
    </section>
    <section id="annonces">

    </section>
  </div>
{/block}