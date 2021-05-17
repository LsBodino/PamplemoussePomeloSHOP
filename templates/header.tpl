	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
	  <a class="navbar-brand" href="#"><img src="../templates/assets/img/favicon.ico" id="logo"></a>
	  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
	    <span class="navbar-toggler-icon"></span>
	  </button>

	  <div class="collapse navbar-collapse" id="navbarSupportedContent">
	    <ul class="navbar-nav mr-auto">
	      <li class="nav-item">
	        <a class="nav-link active" href="../index">Accueil</a>
	      </li>
	      <li class="nav-item dropdown">
	        <a class="nav-link dropdown-toggle" href="../categorie" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	          Catégories
	        </a>
	        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
	        	{foreach $categories as $categorie}
	          <a class="dropdown-item" href="../categorie/{$categorie['id']}">{$categorie['nom']}</a>
	          {/foreach}
	        </div>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="../panier">Panier</a>
	      </li>
	      <li class="nav-item">
	      	{if !$login}
	      		<a class="nav-link" href="#" data-toggle="modal" data-target="#formLogin">Connexion</a>
	      	{else}
	      		<a class="nav-link" href="../space">Mon compte</a>
	      	{/if}
	      </li>
	      {if $login}
	      <li class="nav-item">
	      		<a class="nav-link" href="../logout">Déconnexion</a>
	      </li>
	      {/if}
	    </ul>
	  </div>
	</nav>
	{if !$login}
		{include file="../templates/login.tpl"}
	{/if}
	