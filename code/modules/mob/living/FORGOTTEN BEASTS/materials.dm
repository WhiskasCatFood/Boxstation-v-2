/datum/forgotten_beast_mat // ��������� ��� ����������� ������� ������ �� ����� �����������.
	var/name = "genericium"

	var/melee_resist = 0 	// ���������� ���� ������������� ��� DAMAGE * (1 - RESIST / 100),
	var/bullet_resist = 0	// �� ���� RESIST ���������� ���������� ����� � ���������,
	var/laser_resist = 0	// ������� ����� �������.
	var/energy_resist = 0
	var/bomb_resist = 0
	var/rad_resist = 100	// ����� �� ������� ������ �� ������� ��������, �����?

	var/to_drop = list(/obj/item/weapon/ore, 1)	// ����, ������� �������� ����� ���������� ����������.

	var/limb_color = rgb(150, 150, 150)

/datum/forgotten_beast_mat/sand
	name = "sand"

	melee_resist = 15	// ����� ����� ����������� �������,
	bullet_resist = 5	// �� ����� ������ ��� � �������
	laser_resist = 20	// ������ �����.
	energy_resist = 20

	to_drop = list(/obj/item/weapon/ore/glass, 8)

/datum/forgotten_beast_mat/metal
	name = "metal"

	melee_resist = 50	// ����������������� ��������.
	bullet_resist = 30	// �� ����� �����, �� ��������
	laser_resist = 30	// �� �����.
	energy_resist = 30
	bomb_resist = 30

	to_drop = list(/obj/item/weapon/ore/iron, 6)

/datum/forgotten_beast_mat/plasteel
	name = "plasteel"

	melee_resist = 70	// ���� �������� � �����������,
	bullet_resist = 50	// �� ��-�� ������ � �������
	laser_resist = 40	// ���� ����� ������� � �������.
	energy_resist = 40
	bomb_resist = 50

	to_drop = list(/obj/item/stack/sheet/plasteel, 10)

/datum/forgotten_beast_mat/adamantine
	name = "adamantine"

	melee_resist = 70	// �������, ������, ���������.
	bullet_resist = 70	// PRAISE THE MINERS!
	laser_resist = 70
	energy_resist = 70
	bomb_resist = 70

	to_drop = list(/obj/item/stack/sheet/mineral/adamantine, 3)

/datum/forgotten_beast_mat/bananium
	name = "bananium"

	melee_resist = 40	// ������ ���������� �������.
	bullet_resist = 40	// ����� �������, ���� ��������.
	laser_resist = 35
	energy_resist = 35
	bomb_resist = 25

	to_drop = list(/obj/item/weapon/ore/bananium, 5)

/datum/forgotten_beast_mat/diamond
	name = "diamond"

	melee_resist = 10	// ����� ������������ �������,
	bullet_resist = 5	// ����������� �������� � ����������
	laser_resist = 80	// ������ ���� ������.
	energy_resist = 80
	bomb_resist = 0

	to_drop = list(/obj/item/weapon/ore/diamond, 5)

/datum/forgotten_beast_mat/gold
	name = "gold"

	melee_resist = 25	// ������ ������, �����
	bullet_resist = 20	// �����������.
	laser_resist = 25
	energy_resist = 25
	bomb_resist = 15

	to_drop = list(/obj/item/weapon/ore/gold, 4)

/datum/forgotten_beast_mat/mythril
	name = "mythril"

	melee_resist = 70	// ����� �� �����, ��� ���
	bullet_resist = 70	// �����, ������� ����� ���
	laser_resist = 70	// ����� ��� ���������.
	energy_resist = 70
	bomb_resist = 70

	to_drop = list(/obj/item/stack/sheet/mineral/mythril, 3)

/datum/forgotten_beast_mat/plasma
	name = "plasma"

	melee_resist = 30	// ��� �������, ��� ������ ����������,
	bullet_resist = 25	// ������ ���������� ����� � ������.
	laser_resist = 10
	energy_resist = 10
	bomb_resist = 5

	to_drop = list(/obj/item/weapon/ore/plasma, 4)

/datum/forgotten_beast_mat/silver
	name = "silver"

	melee_resist = 30	// ���� ������� ������.
	bullet_resist = 20
	laser_resist = 25
	energy_resist = 25
	bomb_resist = 15

	to_drop = list(/obj/item/weapon/ore/silver, 4)

/datum/forgotten_beast_mat/uranium
	name = "uranium"

	melee_resist = 30	// ����������������� ������.
	bullet_resist = 25	// ������ �� ���� ���-�� ���������
	laser_resist = 30	// ��������. ����� �������.
	energy_resist = 30
	bomb_resist = 10
	rad_resist = 45

	to_drop = list(/obj/item/weapon/ore/uranium, 3)

/datum/forgotten_beast_mat/chitin
	name = "chitin shell"

	melee_resist = 20	// ���� �� ����������!
	bullet_resist = 15	// � �� ����, ��� �� ������ � ���� ������, �� �� ��������� ����������.
	laser_resist = 20
	energy_resist = 20
	bomb_resist = 5
	rad_resist = 20

	to_drop = list(/obj/item/stack/sheet/xenochitin, 1)
