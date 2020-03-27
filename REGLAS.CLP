(defrule Caracteristica
		(Inicio)
=>
	(printout t "¿La obra tiene Bajo Continuo?" crlf)
		(bind ?resp (read))
			(if (or (eq ?resp si)(eq ?resp s))
					then
					
						(assert (BajoCont))		
			else
					(printout t "¿La obra tiene Amonia en Paralelo?" crlf)
						(bind ?resp (read))
							(if (or (eq ?resp si)(eq ?resp s))
									then
									
										(assert (ArmoPara))		
							else
									(printout t "¿La obra tiene Ritmo Uniforme y bien marcado?" crlf)
										(bind ?resp (read))
											(if (or (eq ?resp si)(eq ?resp s))
													then
													
														(assert (RitUni))		
											else
													(printout t "¿La obra tiene via libre a la improvisacion?" crlf)
														(bind ?resp (read))
															(if (or (eq ?resp si)(eq ?resp s))
																	then
																	
																		(assert (Improvisacion))		
															else
																(printout t "¿La obra tiene ornamentacion?" crlf)
																	(bind ?resp (read))
																		(if (or (eq ?resp si)(eq ?resp s))
																				then
																				
																					(assert (ornamentacion))		
																		else
																				(printout t "¿La obra tiene las voces externas muy separadas?" crlf)
																					(bind ?resp (read))
																						(if (or (eq ?resp si)(eq ?resp s))
																								then
																								
																									(assert (Separada))		
																						
																						
																						else
																								(printout t "Esta obra no pertenece al Barroco" crlf)	
																								 (halt)
																						
																						)
																		)
															)
											)
							)															
			)																			
)





(defrule Barroco
		(or 
				(BajoCont)
				(ArmoPara)
				(RitUni)
				(Improvisacion)
				(ornamentacion)
				(Separada)
		)
=>
				
						(assert (Barroco))
					
)

(defrule TEMPO
	
		(Barroco)
=>

			(assert (ObraBarroca))
	(printout t "¿La obra es binaria?" crlf)
		(bind ?resp (read))
			(if (or (eq ?resp si)(eq ?resp s))
					then
					
						(assert (Binario))
			
			else
				(printout t "La obra es ternaria" crlf)
					
					
								(assert (Ternaria))
		
			)
)


(defrule Hemiolias
		(Barroco)
		(Binario)
=>
	(printout t "¿La obra tiene Hemiolias?" crlf)
		(bind ?resp (read))
			(if (or (eq ?resp si)(eq ?resp s))
					then
					
						(assert (Hemiolias))
			
						
			)
)


(defrule Sincopas
		(Barroco)
			(or 
				(Binario)
				(Ternaria)
			)
=>
	(printout t "¿La obra tiene Sincopas?" crlf)
		(bind ?resp (read))
			(if (or (eq ?resp si)(eq ?resp s))
					then
					
						(assert (Sincopas))
			
						
			)
)


(defrule Contrapunto
		(Barroco)
		(Binario)
		(Sincopas)
		(Hemiolias)
=>
	(printout t "¿La obra tiene Contrapunto" crlf)
		(bind ?resp (read))
			(if (or (eq ?resp si)(eq ?resp s))
					then
					
						(assert (Contrapunto))
			
						
			)
)


(defrule MasUnaParte
		(Barroco)
		(Binario)
=>
	(printout t "¿La obra tiene mas de una parte?" crlf)
		(bind ?resp (read))
			(if (or (eq ?resp si)(eq ?resp s))
					then
					
						(assert (MasUnaParte))
			
						
			)
)


(defrule Repeticion
		(Barroco)
		(Binario)
		(MasUnaParte)
=>
	(printout t "¿La obra tiene repeticiones?" crlf)
		(bind ?resp (read))
			(if (or (eq ?resp si)(eq ?resp s))
					then
					
						(assert (Repeticion))
			
						
			)
)

(defrule Velocidad
		(Barroco)
		(or 
				(Binario)
				(Ternaria)
		)
			
=>
	(printout t "¿La obra tiene un tempo rapido?" crlf)
		(bind ?resp (read))
			(if (or (eq ?resp si)(eq ?resp s))
					then
					
						(assert (Rapidas))
			
						
			
			else
				(printout t "La obra tiene un tempo lento" crlf)
					
									(assert (Lentas))

						
			)
)

(defrule Homofonia
		(Barroco)
		(Ternaria)
		(Rapidas)
		
=>
	(printout t "¿La obra tiene textura homofonica?" crlf)
		(bind ?resp (read))
			(if (or (eq ?resp si)(eq ?resp s))
					then
					
						(assert (Homofonia))
			
						
			)
)

(defrule ligado2y3
		(Homofonia)
		
=>
	(printout t "¿La obra tiene el 2 y 3 tiempo ligado?" crlf)
		(bind ?resp (read))
			(if (or (eq ?resp si)(eq ?resp s))
					then
					
						(assert (ligado2y3))
			
						
			)
)

(defrule Division4comp
		(Homofonia)
		
=>
	(printout t "¿La obra tiene frases dividias en 4 compases?" crlf)
		(bind ?resp (read))
			(if (or (eq ?resp si)(eq ?resp s))
					then
					
						(assert (Division4comp))
			
						
			)
)

(defrule BajoOstinato
		(Barroco)
		(Ternaria)
		(Rapidas)
		
=>
	(printout t "¿La obra tiene un bajo ostinato?" crlf)
		(bind ?resp (read))
			(if (or (eq ?resp si)(eq ?resp s))
					then
					
						(assert (BajoOstinato))
			
						
			)
)

(defrule VariacionVozSuper
		(BajoOstinato)
		
=>
	(printout t "¿La obra tiene variaciones de las voces superiores?" crlf)
		(bind ?resp (read))
			(if (or (eq ?resp si)(eq ?resp s))
					then
					
						(assert (VariacionVozSuper))
			
						
			)
)

(defrule Cadencias
		(BajoOstinato)
		
=>
	(printout t "¿La obra tiene cadencias marcadas?" crlf)
		(bind ?resp (read))
			(if (or (eq ?resp si)(eq ?resp s))
					then
					
						(assert (Cadencias))
			
						
			)
)



(defrule Acentos
		(BajoOstinato)
		
=>
	(printout t "¿La obra tiene acentos cruzados?" crlf)
		(bind ?resp (read))
			(if (or (eq ?resp si)(eq ?resp s))
					then
					
						(assert (Acentos))
			
						
			)
)


(defrule LOURE
		
				(Barroco)
				(Binario)
				(Hemiolias)
				(or (Lentas) (Rapidas))
				(Sincopas)
				(Contrapunto)
			
		
=>
		(printout t "La danza es una LOURE" crlf)

		 (halt)
)

(defrule GAVOTTE
		
				(Barroco)
				(Binario)
				(MasUnaParte)
				(or (Lentas) (Rapidas))
				(Repeticion)
				
					
=>
		(printout t "La danza es una MUSETTE" crlf)
			
		 (halt)
)


(defrule MUSETTE
		
				(Barroco)
				(Binario)
				(or (Lentas) (Rapidas))
				(MasUnaParte)
				
					
=>
		(printout t "La danza es una MUSETTE" crlf)
			
		 (halt)
)



(defrule BOUREE
		
				(Barroco)
				(Binario)
				(Rapidas)
				(Sincopas)
				
					
=>
		(printout t "La danza es una BOUREE" crlf)
			
		 (halt)
)

(defrule BOUREE_2
		
				(Barroco)
				(Ternaria)
				(Rapidas)
				(Sincopas)
				
					
=>
		(printout t "La danza es una BOUREE" crlf)
			
		 (halt)
)

(defrule SARABANDA
		
				(Barroco)
				(Ternaria)
				(Rapidas)
				(Homofonia)
				(ligado2y3)
				
					
=>
		(printout t "La danza es una SARABANDA" crlf)
			
		 (halt)
)

(defrule GUIGUE
		
				(Barroco)
				(Ternaria)
				(Rapidas)
				(Homofonia)
				(Division4comp)
				
					
=>
		(printout t "La danza es una GUIGUE" crlf)
			
		 (halt)
)


(defrule CHACONNE
		
				(Barroco)
				(Ternaria)
				(Rapidas)
				(BajoOstinato)
				(VariacionVozSuper)
				
					
=>
		(printout t "La danza es una CHACONNE" crlf)
			
		 (halt)
)

(defrule PASSACAILLE
		
				(Barroco)
				(Ternaria)
				(Rapidas)
				(BajoOstinato)
				(Cadencias)
				
					
=>
		(printout t "La danza es una PASSACAILLE" crlf)
	
		 (halt)
)

(defrule COURANTE
		
				(Barroco)
				(Ternaria)
				(Lentas)
				(Acentos)
				
				
				
					
=>
		(printout t "La danza es una COURANTE" crlf)
		
		 (halt)
)


(defrule NoDanza
		
			(Barroco)
			(ObraBarroca)
							
=>
		(printout t "        " crlf)
		(printout t "        " crlf)
		(printout t "La obra no pertenece a ninguna danza" crlf)
		
		 (halt)
)



