extends Control

# Message to be displayed
var text = "Lorem ipsum dolor sit amet consectetur adipisicing elit. Unde sequi consequatur quidem, optio sed, perferendis amet fugit rem illo fuga incidunt voluptatem quaerat! Laudantium culpa ipsum recusandae. Inventore, delectus numquam?"

# Execute when arraving at the scene tree
func _ready():
	_load_text(text)

# Função que carrega as mensagens.
func _load_text(exibition_text):
	$CenterContainer/VBoxContainer/Text.text = exibition_text
	$CenterContainer/VBoxContainer/Text.percent_visible = 0
	$Tween.interpolate_property($CenterContainer/VBoxContainer/Text, "percent_visible", 0, 1, 1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$Tween.start()
	
# Quando o Tween terminar de exibir a animação, vai emitir um sinal
# que mudará a variavel finished para true. Quando isso ocorrer, o
# cursor indicador aparecerá na tela.

func _on_Tween_tween_completed(_object, _key):
	pass
