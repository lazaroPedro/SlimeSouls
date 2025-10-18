
var enemy =  instance_place(x, y, obj_collision)
if(enemy && !array_contains(list_enemy, enemy)){
	list_enemy = array_concat(list_enemy, [enemy])
	


	with (enemy){
		life -= 500
	}
}
