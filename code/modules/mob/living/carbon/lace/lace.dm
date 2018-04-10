//This file was auto-corrected by findeclaration.exe on 25.5.2012 20:42:32

/mob/living/carbon/lace
	var/obj/item/container = null // should be the lace..
	var/mob/container2 = null
	var/timeofhostdeath = 0
	var/emp_damage = 0//Handles a type of MMI damage
	var/alert = null
	use_me = 0 //Can't use the me verb, it's a freaking immobile brain
	icon = 'icons/obj/surgery.dmi'
	icon_state = "cortical-stack"

/mob/living/carbon/lace/New()
	container = loc
	var/datum/action/lace/laceaction = new(container)
	laceaction.Grant(src)
	..()
/mob/living/carbon/lace/after_load()

/mob/living/carbon/lace/Destroy()
	if(key)				//If there is a mob connected to this thing. Have to check key twice to avoid false death reporting.
		if(stat!=DEAD)	//If not dead.
			death(1)	//Brains can die again. AND THEY SHOULD AHA HA HA HA HA HA
		message_admins("DEAD LACE DETECTED!! [key] [src]")
		ghostize()		//Ghostize checks for key so nothing else is necessary.
	. = ..()

/mob/living/carbon/lace/say_understands(var/other)//Goddamn is this hackish, but this say code is so odd
	if (istype(other, /mob/living/silicon/ai))
		return 1
	if (istype(other, /mob/living/silicon/decoy))
		return 1
	if (istype(other, /mob/living/silicon/pai))
		return 1
	if (istype(other, /mob/living/silicon/robot))
		return 1
	if (istype(other, /mob/living/carbon/human))
		return 1
	if (istype(other, /mob/living/carbon/slime))
		return 1
	return ..()

/mob/living/carbon/lace/update_canmove()
	if(in_contents_of(/obj/mecha) || istype(loc, /obj/item/device/mmi))
		canmove = 1
		use_me = 1
	else
		canmove = 0
	return canmove

/mob/living/carbon/lace/isSynthetic()
	return istype(loc, /obj/item/device/mmi/digital)

/mob/living/carbon/lace/binarycheck()
	return isSynthetic()

/mob/living/carbon/lace/check_has_mouth()
	return 0

