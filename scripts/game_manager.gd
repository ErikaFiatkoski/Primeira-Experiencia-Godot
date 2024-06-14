extends Node

@export var object_templates: Array[PackedScene] #exporta a variavel para o menu Inspector, na lateral direita do editor.



func _input(event: InputEvent) -> void:
	#teste se o evento foi um clique 
	if event is InputEventMouseButton:
		if event.button_index == 1: #testa se foi clique com o botão esquerdo (button_index = 1
			if event.pressed: #testa se o botao foi pressionado
				spawn_object(event.position)


func spawn_object(position: Vector2) -> void:
	var index: int = randi_range(0, object_templates.size() -1) #Salvamos na variavel index um valor aleatorio (dentro do parametro passado), que é uma das posições do array object_templates 
	var object_template = object_templates[index] #Armazenamos na variável object_template o valor armazenado na posição sorteada do array
	var object: RigidBody2D = object_template.instantiate() #Através do método instantiate(), criamos uma copia do objeto armazenado em object_template, e o armazenamos na variavel object
	object.position = position #alteramos a posição do objeto criado para o local onde clicamos com o botão esquerdo do mouse (posição essa que foi passada como parametro no metodo).
	add_child(object) #atravez do método add_clild(), criamos um novo objeto no mundo, na posição selecionada.
	
