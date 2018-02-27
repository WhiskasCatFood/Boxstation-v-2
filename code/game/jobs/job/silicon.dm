/*
AI
*/
/datum/job/ai
	title = "AI"
	r_title = "������������ ���������"
	flag = AI
	department_flag = ENGSEC
	faction = "Station"
	total_positions = 0
	spawn_positions = 1
	selection_color = "#ccffcc"
	supervisors = "����� �������"
	req_admin_notify = 1
	minimal_player_age = 30

/datum/job/ai/equip(var/mob/living/carbon/human/H)
	if(!H)	return 0

/datum/job/ai/config_check()
	return 1

/*
Cyborg
*/
/datum/job/cyborg
	title = "Cyborg"
	r_title = "������"
	flag = CYBORG
	department_flag = ENGSEC
	faction = "Station"
	total_positions = 0
	spawn_positions = 1
	supervisors = "����� ������� � �Ș"//Nodrak
	selection_color = "#ddffdd"
	minimal_player_age = 21

/datum/job/cyborg/equip(var/mob/living/carbon/human/H)
	if(!H)	return 0
	return H.Robotize()
