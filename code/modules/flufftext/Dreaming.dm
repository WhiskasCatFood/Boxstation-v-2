mob/living/carbon/proc/dream()
	dreaming = 1
	var/list/dreams = list(
		"����", "�����������", "����������", "������&#255;", "�������", "������&#255;������", "�����",
		"����", "������ � ���� ������", "���������", "������ ����", "�������������", "�������� ������", "�����������",
		"�������", "����������&#255; ����������&#255;", "������", "��������", "���&#255;��� ���������", "���������", "�����",
		"������", "�������������", "������", "����&#255;", "������ ������", "������������", "��������", "���������",
		"����������&#255; ������&#255;", "���������������", "�����", "����� �����", "�����&#255; ������", "��� ��� �����������"
		)
	spawn(0)
		for(var/i = rand(1,4),i > 0, i--)
			var/dream_image = pick(dreams)
			dreams -= dream_image
			src << "<span class='notice'><i>... [dream_image] ...</i></span>"
			sleep(rand(40,70))
			if(paralysis <= 0)
				dreaming = 0
				return 0
		dreaming = 0
		return 1

mob/living/carbon/proc/handle_dreams()
	if(prob(5) && !dreaming) dream()

mob/living/carbon/var/dreaming = 0