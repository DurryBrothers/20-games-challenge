extends Control


@onready var player_one_score_label: Label = $MarginContainer/PlayerOneScore
@onready var player_two_score_label: Label = $MarginContainer/PlayerTwoScore


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalManager.update_score.connect(_update_score)
	set_score(player_one_score_label, GameManager.player_one_score)
	set_score(player_two_score_label, GameManager.player_two_score)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func set_score(score_label: Label, score: int) -> void:
	score_label.text = str(score)


func _update_score() -> void:
	set_score(player_one_score_label, GameManager.player_one_score)
	set_score(player_two_score_label, GameManager.player_two_score)
