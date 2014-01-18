;===========================================================================================================================

;Decalaration, Facts, Rules
(defglobal ?*num* = 1)
(defglobal ?*counter* = 1)
(defglobal ?*citilink* = 10)
(defglobal ?*garuda* = 10)
(defglobal ?*airasia* = 10)
(defglobal ?*lion* = 10)
(defglobal ?*mandala* = 10)
(defglobal ?*sriwijaya* = 10)
(defglobal ?*selected-index* = 0)

(deftemplate citilink (declare (ordered TRUE)))
(deftemplate garuda (declare (ordered TRUE)))
(deftemplate airasia (declare (ordered TRUE)))
(deftemplate lion (declare (ordered TRUE)))
(deftemplate mandala (declare (ordered TRUE)))
(deftemplate sriwijaya (declare (ordered TRUE)))

(deftemplate mainmenu (declare (ordered FALSE)))

(deftemplate viewtix (declare (ordered FALSE)))
(deftemplate addtix (declare (ordered FALSE)))
(deftemplate updatetix (declare (ordered FALSE)))
(deftemplate deltix (declare (ordered FALSE)))

(deftemplate cetak-citilink (declare (ordered FALSE)))
(deftemplate cetak-garuda (declare (ordered FALSE)))
(deftemplate cetak-airasia (declare (ordered FALSE)))
(deftemplate cetak-lion (declare (ordered FALSE)))
(deftemplate cetak-mandala (declare (ordered FALSE)))
(deftemplate cetak-sriwijaya (declare (ordered FALSE)))
;deftem delete
(deftemplate del-inter(declare(ordered FALSE)))
(deftemplate del-dom(declare(ordered FALSE)))
(deftemplate del-int(slot id)(slot total))
(deftemplate del-do(slot id)(slot total))
(deftemplate del-int-ticket(slot id)(slot num))
(deftemplate del-do-ticket(slot id)(slot num))
(deftemplate cari-garuda (slot num))
(deftemplate cari-sriwijaya (slot num))
(deftemplate cari-citilink (slot num))
(deftemplate cari-airasia (slot num))
(deftemplate cari-lion (slot num))
(deftemplate cari-mandala (slot num))

(deffacts citilink
(citilink 10 "Economy" "30-12-2013" "Jakarta" "Semarang" 515000 20)
(citilink 9 "Economy" "29-12-2013" "Jakarta" "Pangkal Pinang" 615000 30)
(citilink 8 "Economy" "31-12-2013" "Semarang" "Pangkal Pinang" 540000 50)
(citilink 7 "Economy" "01-01-2014" "Pangkal Pinang" "Semarang" 650000 45)
(citilink 6 "Economy" "30-12-2013" "Jakarta" "Semarang" 475000 25)
(citilink 5 "Executive" "31-12-2013" "Semarang" "Pangkal Pinang" 840000 10)
(citilink 4 "Executive" "30-12-2013" "Jakarta" "Semarang" 815000 30)
(citilink 3 "Executive" "31-12-2013" "Semarang" "Jakarta" 875000 60)
(citilink 2 "Executive" "30-12-2013" "Semarang" "Pangkal Pinang" 915000 50)
(citilink 1 "Executive" "01-01-2014" "Pangkal Pinang" "Semarang" 950000 20)
)
(defrule cetak-citilink
    (cetak-citilink)
    (citilink ?id ?class ?date ?origin ?destination ?price ?seat)
    =>
    (printout t "|"?*num* ".   |"?class "   |"?date "	|"?origin "		|"?destination "	| Rp. "?price "		|"?seat " seat<s>	|"crlf)
    (++ ?*num*)
    
)
(defrule cetak-akhir-citilink
	(declare (salience -100))
    ?i <- (cetak-citilink)
    =>
    (retract ?i)
    (printout t "=================================================================================================================" crlf)
    (readline)
    (assert(mainmenu))
)
(defrule cetak-akhir-citilink2
    (declare(salience -10))
    ?i <- (cetak-citilink)
    ?j <-(deleting)
    =>
    (retract ?i)
    (retract ?j)
    (printout t "=================================================================================================================" crlf)
	(-- ?*num*)	
    (assert (del-do (id 1)(total ?*num*)))
)
(defrule cari-citilink
    ?i <- (cari-citilink (num ?num))
    ?j <- (citilink ?id ?class ?date ?origin ?destination ?price ?seat)
    =>
   	(if (= ?*counter* ?num) then
        (retract ?i)
        (retract ?j)
        (printout t "Successfully deleted")
        (readline)
        (assert (mainmenu))
    else
	    (++ ?*counter*)
    )
)

(deffacts garuda
(garuda 10 "Economy" "29-12-2013" "Jakarta" "Kuala Lumpur" 2150000 15)
(garuda 9 "Economy" "30-12-2013" "Jakarta" "Singapore" 1500000 10)
(garuda 8 "Economy" "01-01-2014" "Singapore" "Jakarta" 1800000 20)
(garuda 7 "Economy" "01-01-2014" "Kuala Lumpur" "Jakarta" 3400000 30)
(garuda 6 "Economy" "30-12-2013" "Kuala Lumpur" "Singapore" 2500000 35)
(garuda 5 "Executive" "29-12-2013" "Singapore" "Kuala Lumpur" 3000000 25)
(garuda 4 "Executive" "01-01-2014" "Kuala Lumpur" "Jakarta" 4400000 20)
(garuda 3 "Executive" "31-12-2013" "Singapore" "Jakarta" 2800000 30)
(garuda 2 "Executive" "30-12-2013" "Kuala Lumpur" "Singapore" 3500000 25)
(garuda 1 "Executive" "01-01-2014" "Jakarta" "Singapore" 2600000 15)
)
(defrule cetak-garuda
    (cetak-garuda)
    (garuda ?id ?class ?date ?origin ?destination ?price ?seat)
    =>
    (printout t "|"?*num* ".   |"?class "   |"?date "	|"?origin "		|"?destination "	| Rp. "?price "		|"?seat " seat<s>	|"crlf)
    (++ ?*num*)
)
(defrule cetak-akhir-garuda
    (declare (salience -100))
    ?i <- (cetak-garuda)
    =>
    (retract ?i)
    (printout t "=================================================================================================================" crlf)
    (readline)
    (assert(mainmenu))
)
(defrule cetak-akhir-garuda2
    (declare(salience -10))
    ?i <- (cetak-garuda)
    ?j <- (deleting)
    =>
    (retract ?i)
    (retract ?j)
    (printout t "=================================================================================================================" crlf)
	(-- ?*num*)
    (assert (del-int (id 1)(total ?*num*)))
)
(defrule cari-garuda
    ?i <- (cari-garuda (num ?num))
    ?j <- (garuda ?id ?class ?date ?origin ?destination ?price ?seat)
    =>
   	(if (= ?*counter* ?num) then
        (retract ?i)
        (retract ?j)
        (printout t "Successfully deleted")
        (readline)
        (assert (mainmenu))
    else
	    (++ ?*counter*)
    )
)

(deffacts airasia 
(airasia 10 "Economy" "30-12-2013" "Jakarta" "Semarang" 650000 15)
(airasia 9 "Economy" "31-12-2013" "Semarang" "Pangkal Pinang" 750000 10)
(airasia 8 "Economy" "01-01-2014" "Semarang" "Pangkal Pinang" 515000 20)
(airasia 7 "Economy" "29-12-2013" "Pangkal Pinang" "Jakarta" 550000 30)
(airasia 6 "Economy" "30-12-2013" "Semarang" "Jakarta" 655000 35)
(airasia 5 "Executive" "01-01-2014" "Jakarta" "Pangkal Pinang" 815000 25)
(airasia 4 "Executive" "01-01-2014" "Jakarta" "Semarang" 950000 20)
(airasia 3 "Executive" "29-12-2013" "Semarang" "Jakarta" 875000 30)
(airasia 2 "Executive" "31-12-2013" "Semarang" "Pangkal Pinang" 950000 25)
(airasia 1 "Executive" "30-12-2013" "Jakarta" "Semarang" 850000 15)
)
(defrule cetak-airasia
    (cetak-airasia)
    (airasia ?id ?class ?date ?origin ?destination ?price ?seat)
    =>
    (printout t "|"?*num* ".   |"?class "   |"?date "	|"?origin "		|"?destination "	| Rp. "?price "		|"?seat " seat<s>	|"crlf)
    (++ ?*num*)
)
(defrule cetak-akhir-airasia
	(declare (salience -100))
    ?i <- (cetak-airasia)
    =>
    (retract ?i)
    (printout t "=================================================================================================================" crlf)
    (readline)
    (assert(mainmenu))
)
(defrule cetak-akhir-airasia2
	(declare (salience -10))
    ?i <- (cetak-airasia)
    ?j <- (deleting)
    =>
    (retract ?i)
    (retract ?j)
    (printout t "=================================================================================================================" crlf)
	(-- ?*num*)	
    (assert (del-do (id 2)(total ?*num*)))
)
(defrule cari-airasia
    ?i <- (cari-airasia (num ?num))
    ?j <- (airasia ?id ?class ?date ?origin ?destination ?price ?seat)
    =>
   	(if (= ?*counter* ?num) then
        (retract ?i)
        (retract ?j)
        (printout t "Successfully deleted")
        (readline)
        (assert (mainmenu))
    else
	    (++ ?*counter*)
    )
)

(deffacts lion 
(lion 10 "Economy" "30-12-2013" "Jakarta" "Semarang" 565000 50)
(lion 9 "Economy" "30-12-2013" "Semarang" "Pangkal Pinang" 650000 20)
(lion 8 "Economy" "31-12-2013" "Semarang" "Pangkal Pinang" 475000 25)
(lion 7 "Economy" "01-01-2014" "Pangkal Pinang" "Semarang" 575000 40)
(lion 6 "Economy" "30-12-2013" "Semarang" "Jakarta" 555000 30)
(lion 5 "Executive" "31-12-2013" "Semarang" "Pangkal Pinang" 850000 60)
(lion 4 "Executive" "29-12-2013" "Jakarta" "Semarang" 915000 15)
(lion 3 "Executive" "31-12-2013" "Semarang" "Jakarta" 855000 40)
(lion 2 "Executive" "30-12-2013" "Jakarta" "Pangkal Pinang" 750000 45)
(lion 1 "Executive" "01-01-2014" "Pangkal Pinang" "Semarang" 895000 55)
)
(defrule cetak-lion
    (cetak-lion)
    (lion ?id ?class ?date ?origin ?destination ?price ?seat)
    =>
    (printout t "|"?*num* ".   |"?class "   |"?date "	|"?origin "		|"?destination "	| Rp. "?price "		|"?seat " seat<s>	|"crlf)
    (++ ?*num*)
)
(defrule cetak-akhir-lion
	(declare (salience -100))
    ?i <- (cetak-lion)
    =>
    (retract ?i)
    (printout t "=================================================================================================================" crlf)
    (readline)
    (assert(mainmenu))
)
(defrule cetak-akhir-lion2
	(declare (salience -10))
    ?i <- (cetak-lion)
    ?j <- (deleting)
    =>
    (retract ?i)
    (retract ?j)
    (printout t "=================================================================================================================" crlf)
	(-- ?*num*)	
    (assert (del-do (id 3)(total ?*num*)))
)
(defrule cari-lion
    ?i <- (cari-lion (num ?num))
    ?j <- (lion ?id ?class ?date ?origin ?destination ?price ?seat)
    =>
   	(if (= ?*counter* ?num) then
        (retract ?i)
        (retract ?j)
        (printout t "Successfully deleted")
        (readline)
        (assert (mainmenu))
    else
	    (++ ?*counter*)
    )
)

(deffacts mandala 
(mandala 10 "Economy" "31-12-2013" "Semarang" "Jakarta" 655000 35)
(mandala 9 "Economy" "01-01-2014" "Jakarta" "Pangkal Pinang" 575000 20)
(mandala 8 "Economy" "30-12-2013" "Pangkal Pinang" "Jakarta" 550000 35)
(mandala 7 "Economy" "01-01-2014" "Pangkal Pinang" "Semarang" 685000 50)
(mandala 6 "Economy" "29-12-2013" "Semarang" "Pangkal Pinang" 625000 45)
(mandala 5 "Executive" "31-12-2013" "Semarang" "Pangkal Pinang" 750000 15)
(mandala 4 "Executive" "30-12-2013" "Jakarta" "Semarang" 850000 20)
(mandala 3 "Executive" "29-12-2013" "Pangkal Pinang" "Jakarta" 875000 35)
(mandala 2 "Executive" "01-01-2014" "Jakarta" "Pangkal Pinang" 750000 25)
(mandala 1 "Executive" "01-01-2014" "Pangkal Pinang" "Semarang" 925000 15)
)
(defrule cetak-mandala
    (cetak-mandala)
    (mandala ?id ?class ?date ?origin ?destination ?price ?seat)
    =>
    (printout t "|"?*num* ".   |"?class "   |"?date "	|"?origin "		|"?destination "	| Rp. "?price "		|"?seat " seat<s>	|"crlf)
    (++ ?*num*)
)
(defrule cetak-akhir-mandala
	(declare (salience -100))
    ?i <- (cetak-mandala)
    =>
    (retract ?i)
    (printout t "=================================================================================================================" crlf)
    (readline)
    (assert(mainmenu))
)
(defrule cetak-akhir-mandala2
	(declare (salience -10))
    ?i <- (cetak-mandala)
    ?j <- (deleting)
    =>
    (retract ?i)
    (retract ?j)
    (printout t "=================================================================================================================" crlf)
	(-- ?*num*)	
    (assert (del-do (id 4)(total ?*num*)))
)
(defrule cari-mandala
    ?i <- (cari-mandala (num ?num))
    ?j <- (mandala ?id ?class ?date ?origin ?destination ?price ?seat)
    =>
   	(if (= ?*counter* ?num) then
        (retract ?i)
        (retract ?j)
        (printout t "Successfully deleted")
        (readline)
        (assert (mainmenu))
    else
	    (++ ?*counter*)
    )
)

(deffacts sriwijaya
(sriwijaya 10 "Economy" "30-12-2013" "Jakarta" "Kuala Lumpur" 3550000 20)
(sriwijaya 9 "Economy" "31-12-2013" "Singapore" "Jakarta" 2750000 30)
(sriwijaya 8 "Economy" "01-01-2014" "Kuala Lumpur" "Jakarta" 3500000 25)
(sriwijaya 7 "Economy" "31-12-2013" "Singapore" "Jakarta" 1800000 10)
(sriwijaya 6 "Economy" "29-12-2013" "Jakarta" "Kuala Lumpur" 2500000 25)
(sriwijaya 5 "Executive" "30-12-2013" "Singapore" "Jakarta" 3750000 20)
(sriwijaya 4 "Executive" "01-01-2014" "Kuala Lumpur" "Singapore" 4500000 15)
(sriwijaya 3 "Executive" "31-12-2013" "Jakarta" "Singapore" 3500000 25)
(sriwijaya 2 "Executive" "01-01-2014" "Singapore" "Jakarta" 4150000 30)
(sriwijaya 1 "Executive" "29-12-2013" "Jakarta" "Kuala Lumpur" 3850000 10)
)
(defrule cetak-sriwijaya
    (cetak-sriwijaya)
    (sriwijaya ?id ?class ?date ?origin ?destination ?price ?seat)
    =>
    (printout t "|"?*num* ".   |"?class "   |"?date "	|"?origin "		|"?destination "	| Rp. "?price "		|"?seat " seat<s>	|"crlf)
    (++ ?*num*)
)
(defrule cetak-akhir-sriwijaya
	(declare (salience -100))
    ?i <- (cetak-sriwijaya)
    =>
    (retract ?i)
    (printout t "=================================================================================================================" crlf)
    (readline)
    (assert(mainmenu))
)
(defrule cetak-akhir-sriwijaya2
	(declare (salience -10))
    ?i <- (cetak-sriwijaya)
    ?j <- (deleting)
    =>
    (retract ?i)
    (retract ?j)
    (printout t "=================================================================================================================" crlf)
	(-- ?*num*)
    (assert (del-int (id 2)(total ?*num*)))
)
(defrule cari-sriwijaya
	?i <- (cetak-sriwijaya)
	=>
	(retract ?i)
	(printout t "=========================================================================================================="crlf)
	(readline)
	(assert(mainmenu))
)

;===========================================================================================================================

;Main Menu
(defrule remove-intial-fact
	?i <- (initial-fact)
	=>
	(retract ?i)
	(assert(mainmenu))
)
(defrule main
	?i <- (mainmenu)
	=>
	(retract ?i)
	
	(bind ?*num* 1)
	(printout t "Welcome to Airlines Indonesia" crlf)
	(printout t "=============================" crlf)
	(printout t "1. View Ticket<s>"crlf)
	(printout t "2. Add Ticket"crlf)
	(printout t "3. Update Ticket"crlf)
	(printout t "4. Delete Ticket"crlf)
	(printout t "5. Ticketing Simulation"crlf)
	(printout t "6. Exit"crlf crlf)
	(printout t "Input your choice[1..6]: ")
	(bind ?pil (read))
	
	(if (numberp ?pil) then
		;1. View Ticket
		(if(= ?pil 1) then (assert (viewtix))
		;2. Add Ticket
		elif(= ?pil 2) then (assert (addtix))
		;3. Update Ticket
		elif(= ?pil 3) then (assert (updatetix))
		;4. Delete Ticket
		elif(= ?pil 4) then (assert (deltix))
		;5. Ticket Simulating
		elif(= ?pil 5) then (printout t "Simulasi belum selesai" crlf)(readline)
		;6. Exit
		elif(= ?pil 6) then (printout t "Thank you!" crlf)
		else (assert (mainmenu))
		)  
	else (assert (mainmenu))  
	)
)

;===========================================================================================================================

;1. View Ticket (Domestic and International Flight)
(deftemplate inter(declare(ordered FALSE)))
(deftemplate dom(declare(ordered FALSE)))
(defrule view-ticket
	?i <- (viewtix)  
	=>
	(retract ?i)
	
	(printout t "List of Flight"crlf)
	(printout t "=============="crlf)
	(printout t "1. Domestic Flight"crlf)
	(printout t "2. International Flight"crlf crlf)
	(printout t "Choose[1..2|0 -> previous menu]: ")
	(bind ?pil (read))
	
	(if(numberp ?pil) then
		(if(= ?pil 0) then (assert (mainmenu))
		elif(= ?pil 1) then (assert (dom))
		elif(= ?pil 2) then (assert (inter))
		else (assert (viewtix))   
		)
	else (assert (viewtix))    
	)
)
;1a. International Flight
(defrule international-flight
	?i <- (inter)
	=>
	(retract ?i)
	
	(printout t "LIST OF ITEM(S) TO BE VIEWED" crlf)
	(printout t "============================" crlf)
	(printout t "1. Garuda Indonesia"crlf)
	(printout t "2. Sriwijaya Air"crlf crlf)
	(printout t "Choose[1..2|0 to back to previous menu]: ")
	(bind ?pil (read))
	
	(if(numberp ?pil) then
		(if(= ?pil 1) then
			(printout t "GARUDA INDONESIA" crlf)
			(printout t "=========================================================================================================="crlf)
			(printout t "|No.  |Type of Class  | Date of Departure   | Origin         | Destination    | Price       | Available  |"crlf)
			(printout t "=========================================================================================================="crlf)
			(assert(cetak-garuda))
		elif(= ?pil 2) then
			(printout t "SRIWIJAYA AIR" crlf)
			(printout t "=========================================================================================================="crlf)
			(printout t "|No.  |Type of Class  | Date of Departure   | Origin         | Destination    | Price       | Available  |"crlf)
			(printout t "=========================================================================================================="crlf)
			(assert(cetak-sriwijaya))
		elif(= ?pil 0) then (assert(viewtix))
		else (assert(inter))
		)
	else (assert(inter))    
	)
)
;1b. Domestic Flight
(defrule domestic-flight
	?i <- (dom)    
	=>
	(retract ?i)
	
	(printout t "LIST OF ITEM(S) TO BE VIEWED" crlf)
	(printout t "============================" crlf)
	(printout t "1. Citilink"crlf)
	(printout t "2. Indonesia Air Asia"crlf)
	(printout t "3. Lion Air"crlf)
	(printout t "4. Mandala Airlines"crlf)
	(printout t "Choose[1..4|0 to back to previous menu]: ")
	(bind ?pil (read))
	
	(if(numberp ?pil) then
		(if(= ?pil 1) then
			(printout t "CITILINK" crlf)
			(printout t "=========================================================================================================="crlf)
			(printout t "|No.  |Type of Class  | Date of Departure   | Origin         | Destination    | Price       | Available  |"crlf)
			(printout t "=========================================================================================================="crlf)
			(assert(cetak-citilink))
		elif(= ?pil 2) then
			(printout t "INDONESIA AIR ASIA" crlf)
			(printout t "=========================================================================================================="crlf)
			(printout t "|No.  |Type of Class  | Date of Departure   | Origin         | Destination    | Price       | Available  |"crlf)
			(printout t "=========================================================================================================="crlf)
			(assert(cetak-airasia))
		elif(= ?pil 3) then
			(printout t "LION AIR" crlf)
			(printout t "=========================================================================================================="crlf)
			(printout t "|No.  |Type of Class  | Date of Departure   | Origin         | Destination    | Price       | Available  |"crlf)
			(printout t "=========================================================================================================="crlf)
			(assert(cetak-lion))
		elif(= ?pil 4) then
			(printout t "MANDALA AIR" crlf)
			(printout t "=========================================================================================================="crlf)
			(printout t "|No.  |Type of Class  | Date of Departure   | Origin         | Destination    | Price       | Available  |"crlf)
			(printout t "=========================================================================================================="crlf)
			(assert(cetak-mandala))
		elif(= ?pil 0) then (assert(viewtix))
		else(assert (dom))
		)
	else (assert(dom))    
	)
)

;===========================================================================================================================

;2. Add Ticket
(deftemplate add-inter(declare(ordered FALSE)))
(deftemplate add-dom(declare(ordered FALSE)))
(deffunction add-domestic (?dom)
	(bind ?class "")
	(while (and (neq ?class "Economy") (neq ?class "Executive")) 
		(printout t "Input the type of class [Economy|Executive] : ")
		(bind ?class (readline))
	)
	(bind ?date "")
	(while (and (neq ?date "29-12-2013") (neq ?date "30-12-2013") (neq ?date "31-12-2013") (neq ?date "01-01-2014")) 
		(printout t "Input the date of departure ['29-12-2013'..'01-01-2014'] : ") 
		(bind ?date (readline))
	)
	(bind ?origin "")
	(while (and (neq ?origin "Jakarta") (neq ?origin "Semarang") (neq ?origin "Pangkal Pinang")) 
		(printout t "Input the origin of the flight [Jakarta|Semarang|Pangkal Pinang]: ") 
		(bind ?origin (readline))
	)
	(bind ?destination "")
	(if (eq ?origin "Jakarta") then 
		(while (and (neq ?destination "Semarang") (neq ?destination "Pangkal Pinang")) 
			(printout t "Input the destination of the flight [Semarang|Pangkal Pinang]: ") 
			(bind ?destination (readline))
		) 
	elif (eq ?origin "Semarang") then  
		(while (and (neq ?destination "Jakarta") (neq ?destination "Pangkal Pinang")) 
			(printout t "Input the destination of the flight [Jakarta|Pangkal Pinang]: ") 
			(bind ?destination (readline))
		) 
	elif (eq ?origin "Pangkal Pinang") then 
		(while (and (neq ?destination "Jakarta") (neq ?destination "Semarang")) 
			(printout t "Input the destination of the flight [Jakarta|Semarang]: ") 
			(bind ?destination (readline))
		)
	)
	(bind ?price 0)
	(while (or (not (numberp ?price)) (< ?price 500000) (> ?price 1000000) (neq (mod ?price 5000) 0))
		(printout t "Input the price [Rp. 500000..Rp. 1000000 and multiple of Rp. 5000]: ")
		(bind ?price (read))
	)
	(bind ?seat 0)
	(while (or (not (numberp ?seat)) (< ?seat 10) (> ?seat 60))
		(printout t "Input the available seat<s> [10..60]: ") 
		(bind ?seat (read))
	)
	(if (eq ?dom 1) then
		(++ ?*citilink*)
		(assert (citilink ?*citilink* ?class ?date ?origin ?destination ?price ?seat))    
	 elif (eq ?dom 2) then
		(++ ?*airasia*)
		(assert (airasia ?*airasia* ?class ?date ?origin ?destination ?price ?seat))
	 elif (eq ?dom 3) then
		(++ ?*lion*)
		(assert (lion ?*lion* ?class ?date ?origin ?destination ?price ?seat))
	 elif (eq ?dom 4) then
		(++ ?*mandala*)
		(assert (mandala ?*mandala* ?class ?date ?origin ?destination ?price ?seat))
	)
	(printout t crlf)
	(printout t "Successfully added")
	(readline)
	(assert(mainmenu))
)
(deffunction add-international (?inter)
	(bind ?class "")
	(while (and (neq ?class "Economy") (neq ?class "Executive")) 
		(printout t "Input the type of class [Economy|Executive] : ")
		(bind ?class (readline))
	)
	(bind ?date "")
	(while (and (neq ?date "29-12-2013") (neq ?date "30-12-2013") (neq ?date "31-12-2013") (neq ?date "01-01-2014")) 
		(printout t "Input the date of departure ['29-12-2013'..'01-01-2014'] : ") 
		(bind ?date (readline))
	)
	(bind ?origin "")
	(while (and (neq ?origin "Jakarta") (neq ?origin "Singapore") (neq ?origin "Kuala Lumpur"))
		(printout t "Input the origin of the flight [Jakarta|Singapore|Kuala Lumpur]: ")
		(bind ?origin (readline))    
	)
	(bind ?destination "")
	(if (eq ?origin "Jakarta") then
		(bind ?destination "")
		(while (and (neq ?destination "Singapore") (neq ?destination "Kuala Lumpur"))
			(printout t "Input the destination of the flight [Singapore|Kuala Lumpur]: ")
			(bind ?destination (readline))    
		)
	elif(eq ?origin "Singapore") then
		(bind ?destination "")
		(while (and (neq ?destination "Jakarta") (neq ?destination "Kuala Lumpur"))
			(printout t "Input the destination of the flight [Jakarta|Kuala Lumpur]: ")
			(bind ?destination (readline))    
		)
	else
		(bind ?destination "")
		(while (and (neq ?destination "Jakarta") (neq ?destination "Singapore"))
			(printout t "Input the destination of the flight [Jakarta|Singapore]: ")
			(bind ?destination (readline))    
		)
	)
	(bind ?price 0)
	(while (or (not (numberp ?price)) (< ?price 1000000) (> ?price 4000000) (neq (mod ?price 50000) 0))
		(printout t "Input the price [Rp. 1000000..Rp. 4000000 and multiple of Rp. 50000]: ")
		(bind ?price (read))
	)
	(bind ?seat 0)
	(while (or (not (numberp ?seat)) (< ?seat 10) (> ?seat 30))
		(printout t "Input the available seat<s> [10..30]: ") 
		(bind ?seat (read))
	)
	(if (eq ?inter 1) then
		(++ ?*garuda*)
		(assert (garuda ?*garuda* ?class ?date ?origin ?destination ?price ?seat))    
	 elif (eq ?inter 2) then
		(++ ?*sriwijaya*)
		(assert (sriwijaya ?*sriwijaya* ?class ?date ?origin ?destination ?price ?seat))
	)
	(printout t crlf)
	(printout t "Successfully added")
	(readline)
	(assert(mainmenu))
)

(defrule add-ticket
	?i <- (addtix)  
	=>
	(retract ?i)
	
	(printout t "List of Flight"crlf)
	(printout t "=============="crlf)
	(printout t "1. Domestic Flight"crlf)
	(printout t "2. International Flight"crlf crlf)
	(printout t "Choose[1..2|0 to back to previous menu]: ")
	(bind ?pil (read))
	
	(if(numberp ?pil) then
		(if(= ?pil 0) then (assert (mainmenu))
		elif(= ?pil 1) then (assert (add-dom))
		elif(= ?pil 2) then (assert (add-inter))
		else (assert (addtix))
		)
	else (assert (addtix))
	)
)
;2a. International Flight
(defrule add-international-flight
	?i <- (add-inter)
	=>
	(retract ?i)
	
	(printout t "LIST OF ITEM(S) TO BE ADDED" crlf)
	(printout t "===========================" crlf)
	(printout t "1. Garuda Indonesia"crlf)
	(printout t "2. Sriwijaya Air"crlf crlf)
	(printout t "Choose[1..2| 0 to back to previous menu]: ")
	(bind ?pil (read))
	
	(if(numberp ?pil) then
		(if(= ?pil 0) then (assert(addtix))
		elif(or(= ?pil 1)(= ?pil 2)) then (add-international ?pil)
		else (assert(add-inter))
		)
	else (assert(add-inter))    
	)
)
;2b. Domestic Flight
(defrule add-domestic-flight
	?i <- (add-dom)
	=>
	(retract ?i)
	
	(printout t "LIST OF ITEM(S) TO BE ADDED" crlf)
	(printout t "===========================" crlf)
	(printout t "1. Citilink"crlf)
	(printout t "2. Indonesia Air Asia"crlf)
	(printout t "3. Lion Air"crlf)
	(printout t "4. Mandala Airlines"crlf crlf)
	(printout t "Choose[1..4| 0 to back to previous menu]: ")
	(bind ?pil (read))
	
	(if(numberp ?pil) then
		(if(= ?pil 0) then (assert(addtix))
		elif(or(= ?pil 1)(= ?pil 2)(= ?pil 3)(= ?pil 4)) then (add-domestic ?pil)
		else (assert(add-dom))
		)
	else (assert(add-dom))    
	)
)

;===========================================================================================================================

;3. Update Ticket
(deftemplate update-dom (declare(ordered FALSE)))
(deftemplate update-inter (declare(ordered FALSE)))

(deftemplate cetak-update-citilink (declare(ordered FALSE)))
(deftemplate cetak-update-airasia (declare(ordered FALSE)))
(deftemplate cetak-update-lion (declare(ordered FALSE)))
(deftemplate cetak-update-mandala (declare(ordered FALSE)))
(deftemplate cetak-update-garuda (declare(ordered FALSE)))
(deftemplate cetak-update-sriwijaya (declare(ordered FALSE)))

(deftemplate cetak-update-citilink-akhir (declare(ordered FALSE)))
(deftemplate cetak-update-airasia-akhir (declare(ordered FALSE)))
(deftemplate cetak-update-lion-akhir (declare(ordered FALSE)))
(deftemplate cetak-update-mandala-akhir (declare(ordered FALSE)))
(deftemplate cetak-update-garuda-akhir (declare(ordered FALSE)))
(deftemplate cetak-update-sriwijaya-akhir (declare(ordered FALSE)))

; funcion for update data =========================================
(deffunction update-domestic-flight-data-rule (?dom ?id)
	(bind ?class "")
	(while (and (neq ?class "Economy") (neq ?class "Executive")) 
		(printout t "Input the type of class [Economy|Executive] : ")
		(bind ?class (readline))
	)
	(bind ?date "")
	(while (and (neq ?date "29-12-2013") (neq ?date "30-12-2013") (neq ?date "31-12-2013") (neq ?date "01-01-2014")) 
		(printout t "Input the date of departure ['29-12-2013'..'01-01-2014'] : ") 
		(bind ?date (readline))
	)
	(bind ?origin "")
	(while (and (neq ?origin "Jakarta") (neq ?origin "Semarang") (neq ?origin "Pangkal Pinang")) 
		(printout t "Input the origin of the flight [Jakarta|Semarang|Pangkal Pinang]: ") 
		(bind ?origin (readline))
	)
	(bind ?destination "")
	(if (eq ?origin "Jakarta") then 
		(while (and (neq ?destination "Semarang") (neq ?destination "Pangkal Pinang")) 
			(printout t "Input the destination of the flight [Semarang|Pangkal Pinang]: ") 
			(bind ?destination (readline))
		) 
	elif (eq ?origin "Semarang") then  
		(while (and (neq ?destination "Jakarta") (neq ?destination "Pangkal Pinang")) 
			(printout t "Input the destination of the flight [Jakarta|Pangkal Pinang]: ") 
			(bind ?destination (readline))
		) 
	elif (eq ?origin "Pangkal Pinang") then 
		(while (and (neq ?destination "Jakarta") (neq ?destination "Semarang")) 
			(printout t "Input the destination of the flight [Jakarta|Semarang]: ") 
			(bind ?destination (readline))
		)
	)
	(bind ?price 0)
	(while (or (not (numberp ?price)) (< ?price 500000) (> ?price 1000000) (neq (mod ?price 5000) 0))
		(printout t "Input the price [Rp. 500000..Rp. 1000000 and multiple of Rp. 5000]: ")
		(bind ?price (read))
	)
	(bind ?seat 0)
	(while (or (not (numberp ?seat)) (< ?seat 10) (> ?seat 60))
		(printout t "Input the available seat<s> [10..60]: ") 
		(bind ?seat (read))
	)
    
    (retract ?id)
	(if (eq ?dom 1) then
		(assert (citilink ?*selected-index* ?class ?date ?origin ?destination ?price ?seat))    
	 elif (eq ?dom 2) then
		(assert (airasia ?*selected-index* ?class ?date ?origin ?destination ?price ?seat))
	 elif (eq ?dom 3) then
		(assert (lion ?*selected-index* ?class ?date ?origin ?destination ?price ?seat))
	 elif (eq ?dom 4) then
		(assert (mandala ?*selected-index* ?class ?date ?origin ?destination ?price ?seat))
	)

	(printout t crlf)
	(printout t "Successfully updated")
	(readline)
	(assert(mainmenu))
)
(deffunction update-international-flight-data-rule (?inter ?id)
	(bind ?class "")
	(while (and (neq ?class "Economy") (neq ?class "Executive")) 
		(printout t "Input the type of class [Economy|Executive] : ")
		(bind ?class (readline))
	)
	(bind ?date "")
	(while (and (neq ?date "29-12-2013") (neq ?date "30-12-2013") (neq ?date "31-12-2013") (neq ?date "01-01-2014")) 
		(printout t "Input the date of departure ['29-12-2013'..'01-01-2014'] : ") 
		(bind ?date (readline))
	)
	(bind ?origin "")
	(while (and (neq ?origin "Jakarta") (neq ?origin "Singapore") (neq ?origin "Kuala Lumpur"))
		(printout t "Input the origin of the flight [Jakarta|Singapore|Kuala Lumpur]: ")
		(bind ?origin (readline))    
	)
	(bind ?destination "")
	(if (eq ?origin "Jakarta") then
		(bind ?destination "")
		(while (and (neq ?destination "Singapore") (neq ?destination "Kuala Lumpur"))
			(printout t "Input the destination of the flight [Singapore|Kuala Lumpur]: ")
			(bind ?destination (readline))    
		)
	elif(eq ?origin "Singapore") then
		(bind ?destination "")
		(while (and (neq ?destination "Jakarta") (neq ?destination "Kuala Lumpur"))
			(printout t "Input the destination of the flight [Jakarta|Kuala Lumpur]: ")
			(bind ?destination (readline))    
		)
	else
		(bind ?destination "")
		(while (and (neq ?destination "Jakarta") (neq ?destination "Singapore"))
			(printout t "Input the destination of the flight [Jakarta|Singapore]: ")
			(bind ?destination (readline))    
		)
	)
	(bind ?price 0)
	(while (or (not (numberp ?price)) (< ?price 1000000) (> ?price 4000000) (neq (mod ?price 50000) 0))
		(printout t "Input the price [Rp. 1000000..Rp. 4000000 and multiple of Rp. 50000]: ")
		(bind ?price (read))
	)
	(bind ?seat 0)
	(while (or (not (numberp ?seat)) (< ?seat 10) (> ?seat 30))
		(printout t "Input the available seat<s> [10..30]: ") 
		(bind ?seat (read))
	)
    
    (retract ?id)
	(if (eq ?inter 1) then
		;(++ ?*garuda*)
		(assert (garuda ?*selected-index* ?class ?date ?origin ?destination ?price ?seat))    
	 elif (eq ?inter 2) then
		;(++ ?*sriwijaya*)
		(assert (sriwijaya ?*selected-index* ?class ?date ?origin ?destination ?price ?seat))
	)
	(printout t crlf)
	(printout t "Successfully updated")
	(readline)
	(assert(mainmenu))
)
;==================================================================



; rule for domestic flight ====================
(defrule cetak-update-citilink-rule
	(cetak-update-citilink)
	(citilink ?id ?class ?date ?origin ?destination ?price ?seat)
	=>
    (format t "|%2d.  |%-15s| %-20s| %-15s| %-15s| Rp. %7d | %2d seat(s) |" ?*num* ?class ?date ?origin ?destination ?price ?seat)
	(printout t crlf)
	(++ ?*num*)
)
(defrule cetak-update-citilink2-rule
    ?i <- (cetak-update-citilink)
	=>
    (retract ?i)
    (printout t "=========================================================================================================="crlf)
	
    (bind ?updateid "")
	(while (and (neq ?updateid 0) (or (not (numberp ?updateid)) (< ?updateid 1) (> ?updateid ?*num*)))
        (printout t "Item number to be updated [1.." (- ?*num* 1) " | 0 to back to previous menu]: ")
		(bind ?updateid (read))
	)

    (if (eq ?updateid 0) then
        (assert (update-dom))
    else
        (bind ?*selected-index* ?updateid)
	    (bind ?*num* 1)
	    (assert (cetak-update-citilink-akhir))
	)
)
(defrule cetak-update-citilink-akhir-rule
	(cetak-update-citilink-akhir)
    ?i <- (citilink ?id ?class ?date ?origin ?destination ?price ?seat)
	=>
    (if(eq ?*num* ?*selected-index*) then
        (update-domestic-flight-data-rule 1 ?i)
    )
    (++ ?*num*)
)

(defrule cetak-update-airasia-rule
	(cetak-update-airasia)
	(airasia ?id ?class ?date ?origin ?destination ?price ?seat)
	=>
    (format t "|%2d.  |%-15s| %-20s| %-15s| %-15s| Rp. %7d | %2d seat(s) |" ?*num* ?class ?date ?origin ?destination ?price ?seat)
	(printout t crlf)
	(++ ?*num*)
)
(defrule cetak-update-airasia2-rule
    ?i <- (cetak-update-airasia)
	=>
    (retract ?i)
    (printout t "=========================================================================================================="crlf)
	
    (bind ?updateid "")
	(while (and (neq ?updateid 0) (or (not (numberp ?updateid)) (< ?updateid 1) (> ?updateid ?*num*)))
        (printout t "Item number to be updated [1.." (- ?*num* 1) " | 0 to back to previous menu]: ")
		(bind ?updateid (read))
	)

    (if (eq ?updateid 0) then
        (assert (update-dom))
    else
        (bind ?*selected-index* ?updateid)
	    (bind ?*num* 1)
	    (assert (cetak-update-airasia-akhir))
	)
)
(defrule cetak-update-airasia-akhir-rule
	(cetak-update-airasia-akhir)
    ?i <- (airasia ?id ?class ?date ?origin ?destination ?price ?seat)
	=>
    (if(eq ?*num* ?*selected-index*) then
        (update-domestic-flight-data-rule 2 ?i)
    )
    (++ ?*num*)
)

(defrule cetak-update-lion-rule
	(cetak-update-lion)
	(lion ?id ?class ?date ?origin ?destination ?price ?seat)
	=>
    (format t "|%2d.  |%-15s| %-20s| %-15s| %-15s| Rp. %7d | %2d seat(s) |" ?*num* ?class ?date ?origin ?destination ?price ?seat)
	(printout t crlf)
	(++ ?*num*)
)
(defrule cetak-update-lion2-rule
    ?i <- (cetak-update-lion)
	=>
    (retract ?i)
    (printout t "=========================================================================================================="crlf)
	
    (bind ?updateid "")
	(while (and (neq ?updateid 0) (or (not (numberp ?updateid)) (< ?updateid 1) (> ?updateid ?*num*)))
        (printout t "Item number to be updated [1.." (- ?*num* 1) " | 0 to back to previous menu]: ")
		(bind ?updateid (read))
	)

    (if (eq ?updateid 0) then
        (assert (update-dom))
    else
        (bind ?*selected-index* ?updateid)
	    (bind ?*num* 1)
	    (assert (cetak-update-lion-akhir))
	)
)
(defrule cetak-update-lion-akhir-rule
	(cetak-update-lion-akhir)
    ?i <- (lion ?id ?class ?date ?origin ?destination ?price ?seat)
	=>
    (if(eq ?*num* ?*selected-index*) then
        (update-domestic-flight-data-rule 3 ?i)
    )
    (++ ?*num*)
)

(defrule cetak-update-mandala-rule
	(cetak-update-mandala)
	(mandala ?id ?class ?date ?origin ?destination ?price ?seat)
	=>
    (format t "|%2d.  |%-15s| %-20s| %-15s| %-15s| Rp. %7d | %2d seat(s) |" ?*num* ?class ?date ?origin ?destination ?price ?seat)
	(printout t crlf)
	(++ ?*num*)
)
(defrule cetak-update-mandala2-rule
    ?i <- (cetak-update-mandala)
	=>
    (retract ?i)
    (printout t "=========================================================================================================="crlf)
	
    (bind ?updateid "")
	(while (and (neq ?updateid 0) (or (not (numberp ?updateid)) (< ?updateid 1) (> ?updateid ?*num*)))
        (printout t "Item number to be updated [1.." (- ?*num* 1) " | 0 to back to previous menu]: ")
		(bind ?updateid (read))
	)

    (if (eq ?updateid 0) then
        (assert (update-dom))
    else
        (bind ?*selected-index* ?updateid)
	    (bind ?*num* 1)
	    (assert (cetak-update-mandala-akhir))
	)
)
(defrule cetak-update-mandala-akhir-rule
	(cetak-update-mandala-akhir)
    ?i <- (mandala ?id ?class ?date ?origin ?destination ?price ?seat)
	=>
    (if(eq ?*num* ?*selected-index*) then
        (update-domestic-flight-data-rule 4 ?i)
    )
    (++ ?*num*)
)
;==============================================

; rule for international flight ===============
(defrule cetak-update-garuda-rule
	(cetak-update-garuda)
    ;?i <- (garuda ?id ?class ?date ?origin ?destination ?price ?seat)
	(garuda ?id ?class ?date ?origin ?destination ?price ?seat)
	=>
    ;(retract ?i)
    ;(assert (garuda ?*num* ?class ?date ?origin ?destination ?price ?seat))
    ;(bind ?*garuda* ?*num*)
    (format t "|%2d.  |%-15s| %-20s| %-15s| %-15s| Rp. %7d | %2d seat(s) |" ?*num* ?class ?date ?origin ?destination ?price ?seat)
	(printout t crlf)
	(++ ?*num*)
)
(defrule cetak-update-garuda2-rule
    ?i <- (cetak-update-garuda)
	=>
    (retract ?i)
    (printout t "=========================================================================================================="crlf)
	
    (bind ?updateid "")
	(while (and (neq ?updateid 0) (or (not (numberp ?updateid)) (< ?updateid 1) (> ?updateid ?*num*)))
        ;(printout t "updateid: " (not (numberp ?updateid)) crlf)
		(printout t "Item number to be updated [1.." (- ?*num* 1) " | 0 to back to previous menu]: ")
		(bind ?updateid (read))
	)

    (if (eq ?updateid 0) then
        (assert (update-inter))
    else
        (bind ?*selected-index* ?updateid)
	    (bind ?*num* 1)
	    (assert (cetak-update-garuda-akhir))
	)
)
(defrule cetak-update-garuda-akhir-rule
	(cetak-update-garuda-akhir)
    ?i <- (garuda ?id ?class ?date ?origin ?destination ?price ?seat)
	=>
    (if(eq ?*num* ?*selected-index*) then
        (update-international-flight-data-rule 1 ?i)
    )
    (++ ?*num*)
    
)

(defrule cetak-update-sriwijaya-rule
	(cetak-update-sriwijaya)
    (sriwijaya ?id ?class ?date ?origin ?destination ?price ?seat)
	=>
    (format t "|%2d.  |%-15s| %-20s| %-15s| %-15s| Rp. %7d | %2d seat(s) |" ?*num* ?class ?date ?origin ?destination ?price ?seat)
	(printout t crlf)
	(++ ?*num*)
)
(defrule cetak-update-sriwijaya2-rule
    ?i <- (cetak-update-sriwijaya)
	=>
    (retract ?i)
    (printout t "=========================================================================================================="crlf)
	
    (bind ?updateid "")
	(while (and (neq ?updateid 0) (or (not (numberp ?updateid)) (< ?updateid 1) (> ?updateid ?*num*)))
        (printout t "Item number to be updated [1.." (- ?*num* 1) " | 0 to back to previous menu]: ")
		(bind ?updateid (read))
	)

    (if (eq ?updateid 0) then
        (assert (update-inter))
    else
        (bind ?*selected-index* ?updateid)
	    (bind ?*num* 1)
	    (assert (cetak-update-sriwijaya-akhir))
	)
)
(defrule cetak-update-sriwijaya-akhir-rule
	(cetak-update-sriwijaya-akhir)
    ?i <- (sriwijaya ?id ?class ?date ?origin ?destination ?price ?seat)
	=>
    (if(eq ?*num* ?*selected-index*) then
        (update-international-flight-data-rule 2 ?i)
    )
    (++ ?*num*)
)
;==============================================

(defrule update-ticket
    ?i <- (updatetix)
    =>
    (retract ?i)
    
    (printout t "List of Flight"crlf)
	(printout t "=============="crlf)
	(printout t "1. Domestic Flight"crlf)
	(printout t "2. International Flight"crlf crlf)
	(printout t "Choose[1..2|0 to back to previous menu]: ")
	(bind ?pil (read))
	
	(if(numberp ?pil) then
		(if(= ?pil 0) then (assert (mainmenu))
		elif(= ?pil 1) then (assert (update-dom))
		elif(= ?pil 2) then (assert (update-inter))
		else (assert (updatetix))
		)
	else (assert (updatetix))
	)
)
(defrule update-international-flight
    ?i <- (update-inter)
    =>
    (retract ?i)
    (bind ?*num* 1)
    
    (printout t "LIST OF ITEM(S) TO BE UPDATED" crlf)
	(printout t "=============================" crlf)
	(printout t "1. Garuda Indonesia"crlf)
	(printout t "2. Sriwijaya Air"crlf crlf)
	(printout t "Choose[1..2| 0 to back to previous menu]: ")
	(bind ?pil (read))
	
	(if(numberp ?pil) then
		(if(= ?pil 1) then
			(printout t "GARUDA INDONESIA" crlf)
			(printout t "=========================================================================================================="crlf)
			(printout t "|No.  |Type of Class  | Date of Departure   | Origin         | Destination    | Price       | Available  |"crlf)
			(printout t "=========================================================================================================="crlf)
			(assert(cetak-update-garuda))
		elif(= ?pil 2) then
			(printout t "SRIWIJAYA AIR" crlf)
			(printout t "=========================================================================================================="crlf)
			(printout t "|No.  |Type of Class  | Date of Departure   | Origin         | Destination    | Price       | Available  |"crlf)
			(printout t "=========================================================================================================="crlf)
			(assert(cetak-update-sriwijaya))
		elif(= ?pil 0) then (assert(updatetix))
		else (assert(update-inter))
		)
	else (assert(update-inter))    
	)
)

(defrule update-domestic-flight
    ?i <- (update-dom)
    =>
    (retract ?i)
    (bind ?*num* 1)
    
    (printout t "LIST OF ITEM(S) TO BE UPDATED" crlf)
	(printout t "===========================" crlf)
	(printout t "1. Citilink"crlf)
	(printout t "2. Indonesia Air Asia"crlf)
	(printout t "3. Lion Air"crlf)
	(printout t "4. Mandala Airlines"crlf crlf)
	(printout t "Choose[1..4| 0 to back to previous menu]: ")
	(bind ?pil (read))
	
	(if(numberp ?pil) then
		(if(= ?pil 1) then
			(printout t "CITILINK" crlf)
			(printout t "=========================================================================================================="crlf)
			(printout t "|No.  |Type of Class  | Date of Departure   | Origin         | Destination    | Price       | Available  |"crlf)
			(printout t "=========================================================================================================="crlf)
			(assert(cetak-update-citilink))
		elif(= ?pil 2) then
			(printout t "INDONESIA AIR ASIA" crlf)
			(printout t "=========================================================================================================="crlf)
			(printout t "|No.  |Type of Class  | Date of Departure   | Origin         | Destination    | Price       | Available  |"crlf)
			(printout t "=========================================================================================================="crlf)
			(assert(cetak-update-airasia))
		elif(= ?pil 3) then
			(printout t "LION AIR" crlf)
			(printout t "=========================================================================================================="crlf)
			(printout t "|No.  |Type of Class  | Date of Departure   | Origin         | Destination    | Price       | Available  |"crlf)
			(printout t "=========================================================================================================="crlf)
			(assert(cetak-update-lion))
		elif(= ?pil 4) then
			(printout t "MANDALA AIR" crlf)
			(printout t "=========================================================================================================="crlf)
			(printout t "|No.  |Type of Class  | Date of Departure   | Origin         | Destination    | Price       | Available  |"crlf)
			(printout t "=========================================================================================================="crlf)
			(assert(cetak-update-mandala))
		elif(= ?pil 0) then (assert(updatetix))
		else (assert(update-dom))
		)
	else (assert(update-dom))
	)
)


;===========================================================================================================================
;4. delete ticket

(defrule delete-ticket
    ?i <- (deltix)  
    =>

    (printout t "List of Flight"crlf)
    (printout t "=============="crlf)
    (printout t "1. Domestic Flight"crlf)
    (printout t "2. International Flight"crlf crlf)
    (printout t "Choose[1..2|0 -> previous menu]: ")
    (bind ?pil (read))
    
    (retract ?i)
    (if(numberp ?pil) then
    	(if(= ?pil 0) then (assert (mainmenu))
        elif(= ?pil 1) then 
            (assert (del-dom))
        elif(= ?pil 2) then 
            (assert (del-inter))
        else 
            (assert (deltix))   
        )
    else (assert (deltix))    
    )
)

(deffunction del-international (?inter)
    (assert (deleting))
    (if(= ?inter 1) then
    	(printout t "Garuda Indonesia" crlf)
        (printout t "================================================================================================================="crlf)
		(printout t "|No.  |Type of Class |Date of Departure |Origin		|Destination 	|Price			|Available 	|"crlf)
		(printout t "================================================================================================================="crlf)
        (assert(cetak-garuda))
        
    else
        (printout t "Sriwijaya Air" crlf)
        (printout t "================================================================================================================="crlf)
		(printout t "|No.  |Type of Class |Date of Departure |Origin		|Destination 	|Price			|Available 	|"crlf)
		(printout t "================================================================================================================="crlf)
        (assert(cetak-sriwijaya))
    )
)

(deffunction del-domestic (?dom)
    (assert (deleting))
    (if(= ?dom 1) then
    	(printout t "Citilink" crlf)
        (printout t "================================================================================================================="crlf)
		(printout t "|No.  |Type of Class |Date of Departure |Origin		|Destination 	|Price			|Available 	|"crlf)
		(printout t "================================================================================================================="crlf)
        (assert(cetak-citilink))
    elif(= ?dom 2) then
        (printout t "Indonesia Air Asia" crlf)
        (printout t "================================================================================================================="crlf)
		(printout t "|No.  |Type of Class |Date of Departure |Origin		|Destination 	|Price			|Available 	|"crlf)
		(printout t "================================================================================================================="crlf)
        (assert(cetak-airasia))
    elif(= ?dom 3) then
        (printout t "Lion Air" crlf)
        (printout t "================================================================================================================="crlf)
		(printout t "|No.  |Type of Class |Date of Departure |Origin		|Destination 	|Price			|Available 	|"crlf)
		(printout t "================================================================================================================="crlf)
        (assert(cetak-lion))
    else
        (printout t "Mandala Airlines" crlf)
        (printout t "================================================================================================================="crlf)
		(printout t "|No.  |Type of Class |Date of Departure |Origin		|Destination 	|Price			|Available 	|"crlf)
		(printout t "================================================================================================================="crlf)
        (assert(cetak-mandala))
    )
)

(defrule delete-international-flight
	?i <- (del-inter)
    =>
    (retract ?i)
    
    (printout t "Update International Flight Ticket" crlf)
    (printout t "==================================" crlf)
    (printout t "1. Garuda Indonesia"crlf)
    (printout t "2. Sriwijaya Air"crlf crlf)
    (printout t "Choose[1..2|0 -> previous menu]: ")
    (bind ?pil (read))
    
    (if(numberp ?pil) then
        (if(= ?pil 0) then (assert(deltix))
        elif(or(= ?pil 1)(= ?pil 2)) then
            (bind ?*num* 1)
            (del-international ?pil)
        else (assert(del-inter))
        )
    else (assert(del-inter))    
    )
)

(defrule delete-domestic-flight
    ?i <- (del-dom)
    =>
    (retract ?i)
    
    (printout t "View Domestic Flight" crlf)
    (printout t "====================" crlf)
    (printout t "1. Citilink"crlf)
    (printout t "2. Indonesia Air Asia"crlf)
    (printout t "3. Lion Air"crlf)
    (printout t "4. Mandala Airlines"crlf crlf)
    (printout t "Choose[1..4|0 -> previous menu]: ")
    (bind ?pil (read))
    
    (if(numberp ?pil) then
        (if(= ?pil 0) then (assert(deltix))
        elif(or(= ?pil 1)(= ?pil 2)(= ?pil 3)(= ?pil 4)) then
            (bind ?*num* 1)
            (del-domestic ?pil)
        else (assert(del-dom))
        )
    else (assert(del-dom))    
    )
)

(defrule del-int-ticket
	?i <- (del-int-ticket(id ?id)(num ?num))
    =>
    (if (= ?id 1) then
    	(assert (cari-garuda(num ?num)))
    else
        (assert (cari-sriwijaya(num ?num)))
    )
    (retract ?i)
)

(defrule del-do-ticket
	?i <- (del-do-ticket(id ?id)(num ?num))
    =>
    (if (= ?id 1) then
    	(assert (cari-citilink(num ?num)))
    elif(= ?id 2) then
        (assert (cari-airasia(num ?num)))
    elif(= ?id 3) then
        (assert (cari-lion(num ?num)))
    else
        (assert (cari-mandala(num ?num)))
    )
    (retract ?i)
)

(defrule delete-international
    (declare (salience -20))
	?i <- (del-int (id ?id)(total ?tot))
    =>
    (retract ?i)
    
    (printout t "Item number to be deleted [1.." ?tot " | 0 to back to previous menu] : ")
    (bind ?pilih(read))
    
    (if (numberp ?pilih) then
        (if (= ?pilih 0) then
        	(assert (del-inter))
        elif(or(< ?pilih 0) (> ?pilih ?tot)) then
            (assert (del-int(id ?id)(total ?tot)))
        else 
            (bind ?*counter* 1)
            (assert (del-int-ticket(id ?id)(num ?pilih)))
        )
    else (assert(del-int(id ?id)(total ?tot)))
   	)
)

(defrule delete-domestic
    (declare (salience -20))
	?i <- (del-do (id ?id)(total ?tot))
    =>
    (retract ?i)
    
    (printout t "Item number to be deleted [1.." ?tot " | 0 to back to previous menu] : ")
    (bind ?pilih(read))
    
    (if (numberp ?pilih) then
        (if (= ?pilih 0) then
        	(assert (del-dom))
        elif(or(< ?pilih 0) (> ?pilih ?tot)) then
            (assert (del-do(id ?id)(total ?tot)))
        else 
            (bind ?*counter* 1)
            (assert (del-do-ticket(id ?id)(num ?pilih)))
        )
    else (assert(del-do(id ?id)(total ?tot)))
   	)
)

(reset)
(run)