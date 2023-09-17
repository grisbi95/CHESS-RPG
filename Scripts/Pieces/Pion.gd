extends Node3D

var initial_position : Vector3
var move_speed : float = 2.0  # Vitesse de déplacement du pion
var attack_damage : int = 100   # Dégâts de l'attaque du pion
var max_health : int = 100     # Points de vie maximum du pion
var current_health : int       # Points de vie actuels du pion

func _ready():
	# Récupérez la position initiale du pion lors du démarrage du jeu
	initial_position = translation
	current_health = max_health

func move(direction: Vector3) -> void:
	# Déplacez le pion dans la direction spécifiée en fonction de sa vitesse de déplacement
	translation += direction.normalized() * move_speed * delta

func attack(target: Pion) -> void:
	# Effectuez une attaque de base contre une unité cible (adjacente)
	if target != null:
		target.take_damage(attack_damage)

func take_damage(damage: int) -> void:
	# Réduisez les points de vie du pion en fonction des dégâts reçus
	current_health -= damage

	# Vérifiez si le pion est éliminé (PV <= 0)
	if current_health <= 0:
		# Gérez ici ce qui se passe lorsque le pion est éliminé (par exemple, le retirer du jeu).
		queue_free()  # Retirez le pion de la scène.

func reset_position() -> void:
	# Réinitialisez la position du pion à sa position initiale
	translation = initial_position
	current_health = max_health
