<?php 
class database
{
	private static $_host = "localhost";
	private static $_user = "root";
	private static $_mdp = "";
	private static $_bdd = "smarty";

	public static $_conn;

	public static function createConnexion(){
		self::$_conn = new pdo("mysql:host=".self::$_host.";dbname=".self::$_bdd.";charset=UTF8", self::$_user, self::$_mdp);
	}

	public static function selectAll($table, $comportement = PDO::FETCH_ASSOC){
		$sql = "SELECT * FROM `$table`";
		$req = self::$_conn->query($sql);
		if($comportement == PDO::FETCH_CLASS){
			if($table == "commande"){
				$req->setFetchMode(PDO::FETCH_CLASS, $table);
			} else {
				$req->setFetchMode(PDO::FETCH_CLASS|PDO::FETCH_PROPS_LATE, $table);
			}
			return $req->fetchAll();
		}
		return $req->fetchAll($comportement);
	}

	public static function createCommande($user, $panier){

		try{
			self::$_conn->beginTransaction();
			$sql = "INSERT INTO `commande`(`user_id`) VALUES (:user_id)";

			$req = self::$_conn->prepare($sql);
			$req->bindValue(":user_id", $user->id);
			$req->execute();
			$idCommande = self::$_conn->lastInsertId();

			$sqlInsertProduitCommande = "INSERT INTO `produitcommande`(`produit_id`, `commande_id`, `qte`) VALUES (:produit_id, :commande_id, :qte)";
			$reqProduit = self::$_conn->prepare($sqlInsertProduitCommande);
			foreach ($panier as $produit) {
				# code...
				$reqProduit->bindValue(":produit_id", $produit[0]->id);
				$reqProduit->bindValue(":commande_id", $idCommande);
				$reqProduit->bindValue(":qte", $produit[1]);

				$reqProduit->execute();
			}
			self::$_conn->commit();
			return true;
		} catch(PDOException $e) {
			self::$_conn->rollBack();
			return false;
		}
		

	}
	static function Inscription()
	{
		$username = htmlspecialchars($_POST['username']);
		$mail = htmlspecialchars($_POST['email2']);
		$pw = password_hash($_POST['mdp2'], PASSWORD_DEFAULT);
		$usernamee = self::$_conn->prepare("SELECT * FROM user WHERE name = ?");
		$usernamee->execute(array($username));
		$usernameexist = $usernamee->rowCount();
		if($usernameexist == 0) {
			if(filter_var($mail, FILTER_VALIDATE_EMAIL)) {
				$maill = self::$_conn->prepare("SELECT * FROM user WHERE login = ?");
				$maill->execute(array($mail));
				$mailexist = $maill->rowCount();
				if($mailexist == 0) {
					$insusers = self::$_conn->prepare("INSERT INTO user(name, login, mdp) VALUES(?, ?, ?)");
					$insusers->execute(array($username, $mail, $pw));
				}else{
					exit;
				}
			}else{
				exit;
			}
		}else{
			exit;
		}
	}
	static function Update()
	{
		if(isset($_POST['email']) AND !empty($_POST['email'])){
            if(filter_var($_POST['email'], FILTER_VALIDATE_EMAIL)){
               $newmail = htmlspecialchars($_POST['email']);
               $insertmail = self::$_conn->prepare("UPDATE user SET login = ? WHERE id = ?");
               $insertmail->execute(array($newmail, $_SESSION['id']));
               header('Location: space');
            }else{
               exit;
            }
         }
         if(isset($_POST['pass1']) AND !empty($_POST['pass1']) AND isset($_POST['pass2']) AND !empty($_POST['pass2'])){
            $pw1 = $_POST['pass1'];
            $pw2 = $_POST['pass2'];
            if($pw1 == $pw2){
               $insertpw = self::$_conn->prepare("UPDATE user SET mdp = ? WHERE id = ?");
               $insertpw->execute(array(password_hash($pw1, PASSWORD_DEFAULT), $_SESSION['id']));
               header('Location: space');
            }else{
               exit;
            }
         }
	}
}