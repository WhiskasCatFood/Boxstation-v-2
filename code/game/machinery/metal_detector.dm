/obj/machinery/metal_detector
	name = "metal detector"
	desc = ""
	icon = 'icons/obj/machines/metal_detector.dmi'
	icon_state = "metal-detector"
	anchored = 0
	var/on = 0
	var/locked = 0
	density = 0
	layer = 3
	req_access = list(access_security)
	var/ignore_access = 1 // It won't check persons who have security access
	var/check_guns = 1
	var/check_grenades = 1

/obj/machinery/metal_detector/power_change()
	if(powered())
		stat &= ~NOPOWER
		update_icon()
	else
		on = 0
		stat |= NOPOWER
		update_icon()

/obj/machinery/metal_detector/attackby(obj/item/weapon/W, mob/user)
	if(emagged)
		user << "<span class='warning'>ERROR</span>"
		return
	if(locked)
		user << "<span class='warning'>Access denied.</span>"
		return
	if(on)
		user << "<span class='warning'>It must be turned off first!</span>"
		return

	if(istype(W,/obj/item/weapon/wrench))
		user << "<span class='notice'>You begin [anchored ? "un" : ""]securing [name]...</span>"
		playsound(src.loc, 'sound/items/Ratchet.ogg', 50, 1)
		if(do_after(user, 20))
			user << "<span class='notice'>You [anchored ? "un" : ""]secure [name].</span>"
			anchored = !anchored
			playsound(src.loc, 'sound/items/Deconstruct.ogg', 50, 1)
		return

	if(istype(W, /obj/item/weapon/card/emag))
		emag_act()
		return

/obj/machinery/metal_detector/attack_hand(mob/user as mob)
	if(stat & NOPOWER)
		usr << "<span class='warning'>The [src] seems unpowered.</span>"
		return
	if(!anchored)
		user << "<span class='warning'>It must be secured first!</span>"
		return
	if(emagged)
		user << "<span class='warning'>ERROR</span>"
		return

	interact(user)
	usr.set_machine(src)

/obj/machinery/metal_detector/attack_ai(mob/user as mob)
	return attack_hand(user)

/obj/machinery/metal_detector/interact(mob/user as mob)
	var/dat
	dat += "<br>Lock behaviour controls: <a href='?src=\ref[src];locked=1'>[locked ? "Yes" : "No"]</a><b><br>"

	if(!locked)
		dat += text({"
			Status: <a href='?src=\ref[src];on=1'>[on ? "On" : "Off"]</a><br>
			Ignore access: <a href='?src=\ref[src];ignore_access=1'>[ignore_access ? "Yes" : "No"]</a><br>
			Check guns: <a href='?src=\ref[src];check_guns=1'>[check_guns ? "Yes" : "No"]</a><br>
			Check grenades: <a href='?src=\ref[src];check_grenades=1'>[check_grenades ? "Yes" : "No"]</a><br>
			</tt>"})

	var/datum/browser/popup = new(user, "metal_detector", "Security Metal Detector")
	popup.set_content(dat)
	popup.open()
	return

/obj/machinery/metal_detector/Topic(href, href_list)
	..()

	if(href_list["locked"] && allowed(usr))
		locked = !locked
	else if(href_list["on"])
		on = !on
		update_icon()
	else if(href_list["ignore_access"])
		ignore_access = !ignore_access
	else if(href_list["check_guns"])
		check_guns = !check_guns
	else if(href_list["check_grenades"])
		check_grenades = !check_grenades

	updateUsrDialog()
	return

/obj/machinery/metal_detector/update_icon()
	if(anchored && on && !stat)
		icon_state = "metal-detector-working"
	else
		icon_state = "metal-detector"

/obj/machinery/metal_detector/proc/try_detect_banned(obj/item/I) //meh
	if((check_guns && istype(I,/obj/item/weapon/gun)) || (check_grenades && istype(I,/obj/item/weapon/grenade)))
		icon_state = "metal-detector-warning"
		playsound(loc, 'sound/effects/alert.ogg', 50, 1)
		spawn(15)
			update_icon()
			return 1
	else return 0

/obj/machinery/metal_detector/Crossed(var/mob/living/carbon/M)
	if(anchored && on && !(stat & NOPOWER))
		if(emagged && M)
			if (electrocute_mob(M, get_area(src), src))
				var/datum/effect/effect/system/spark_spread/s = new /datum/effect/effect/system/spark_spread
				s.set_up(5, 1, src)
				s.start()
				playsound(loc, 'sound/effects/sparks1.ogg', 100, 0)
			return

		if((M && ignore_access && !allowed(M)) || (M && !ignore_access))
			for(var/obj/item/O in M.contents)
				if(istype(O, /obj/item/weapon/storage))
					var/obj/item/weapon/storage/S = O
					for(var/obj/item/I in S.contents)
						if(try_detect_banned(I))
							return
				else
					if(try_detect_banned(O))
						return

/obj/machinery/metal_detector/emag_act()
	if(!emagged)
		emagged = 1
		playsound(loc, 'sound/effects/sparks4.ogg', 50, 1)
		var/datum/effect/effect/system/spark_spread/s = new /datum/effect/effect/system/spark_spread
		s.set_up(5, 1, src)
		s.start()
		desc += "<span class='warning'>It seems malfunctioning.</span>"
		return

/obj/machinery/metal_detector/emp_act(severity)
	return emag_act()
