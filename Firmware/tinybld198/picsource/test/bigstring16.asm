;Memory filled with strings; All of them are sent only once to UART.
	LIST      P=16F876A, F=INHX8M
	#include "p16f876a.inc"

	__CONFIG  _HS_OSC & _CP_OFF & _WDT_OFF & _BODEN_ON & _PWRTE_ON & _LVP_OFF & _DEBUG_OFF & _CPD_OFF

	CBLOCK 0x20
	al
	i
	ENDC

	variable	_tab_cnt=0

;******************** MACROS ******************************888
DoString macro table
	movlw	1
	movwf	i
_altcar#v(_tab_cnt)
	movlw	HIGH table	; table page
	movwf	PCLATH
	decf	i,	w
	call	table
	movwf	al
	movlw	HIGH _altcar#v(_tab_cnt)    ; my page
	movwf	PCLATH
	movf	al,	w	
	SendLWait
	incfsz	i,	f
	goto	_altcar#v(_tab_cnt)
_tab_cnt set _tab_cnt+1
	endm
	
SendLWait macro
	btfss PIR1,TXIF		;empty?
	goto $-1
	movwf TXREG
	endm
	
;************************ START *******************

	ORG       0x0000
	clrf STATUS
	PAGESEL init
	goto init



init      
	bcf	STATUS,IRP	; 
	bsf	STATUS,RP0	; select bank 1
	movlw	d'10'		; at 20Mhz with 115200 => 10
	movwf	SPBRG		; at  4Mhz with  19200 => 12
	movlw	b'00100100'	; TXEN+BRGH
	movwf	TXSTA

	bcf	STATUS,RP0     ; select bank 0
	movlw	b'10010000'
	movwf	RCSTA
          

start 
	DoString Table2
	DoString Table3
	DoString Table4
	DoString Table5
	DoString Table6
	DoString Table7
	DoString Table8
	DoString Table9
	DoString Table10
	DoString Table11
	DoString Table12
	DoString Table13
	DoString Table14
	DoString Table15
	DoString Table16
	DoString Table17
	goto z2	
	ORG 0x100
z2
	DoString Table18
	DoString Table19
	DoString Table20
	DoString Table21
	DoString Table22
	DoString Table23
	DoString Table24
	DoString Table25
	DoString Table26
	DoString Table27
	DoString Table28
	DoString Table29
	goto $
		

;TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT


	ORG 0x200
Table2
	addwf PCL,f
	DT "Marvin Minsky   Transcript Programs, Emotions and Common SensePrograms     What I'm going to talk about if I don't waste all th"
	DT "e time on anecdotes is some new ideas about how to make machines more resourceful and versatile. These will be in a book called "

	ORG 0x300
Table3
	addwf PCL,f
	DT "The Emotion Machine. You'll find some early chapters of that book, which should be done this summer I hope, [on my web page].  "
	DT "    [Since the mid 1970s], AI, in my view, has not made dramatic progress in the direction of programs that have what you call '"

	ORG 0x400
Table4
	addwf PCL,f
	DT "general intelligence' or 'common sense' or a lot of resourcefulness for handling problems that the programmer didn't have in mi"
	DT "nd []. That's a quarter century. You can ask what happened.      Certainly lots of things happened that you could call AI. Optic"

	ORG 0x500
Table5
	addwf PCL,f
	DT "al character recognition, machines reading not-too-badly printed text, are pretty good. They only make a mistake every few line"
	DT "s. But those are not using very different techniques than were available before. The computer is a thousand times faster, or mor"

	ORG 0x600
Table6
	addwf PCL,f
	DT "e. Most people in AI are either working on trying to represent knowledge in the form of mathematical logic, which reveals a lot"
	DT " of problems, but doesn't give us good solutions. The reason I don't care for logic is that I think the kind of reasoning that p"

	ORG 0x700
Table7
	addwf PCL,f
	DT "eople find useful in real life is reasoning by analogy. What I mean by reasoning by analogy is: of course if you see a problem "
	DT "exactly like one you've seen before, then you can just remember the solution. But in real life that almost never happens. There "

	ORG 0x800
Table8
	addwf PCL,f
	DT "are always some things different. So you look at this problem or situation and say, what worked' What do I remember about solvi"
	DT "ng a similar problem in the past' That word 'similar' means that you're looking in your records for a case that has some feature"

	ORG 0x900
Table9
	addwf PCL,f
	DT "s or properties or functionality that's the same as this problem, and other features that are different. Then you have to ask, "
	DT "which of these features are important' If they're not important, then who cares. If it's different in important features, then y"

	ORG 0xa00
Table10
	addwf PCL,f
	DT "ou want to get a sub-goal, which says, how can I change this problem so that it will better fit that one. So it seems to me tha"
	DT "t most of what we call 'problem solving' is figuring out how to fit the present case to situations which you've seen before, whi"

	ORG 0xb00
Table11
	addwf PCL,f
	DT "ch aren't the same. Mathematical logic is no good at this.      It's very hard to represent meta-knowledge about which features"
	DT " of things are important because it's hard to express what you mean by important. What is important' It might be something like,"

	ORG 0xc00
Table12
	addwf PCL,f
	DT " 'it will reduce your amount of search time'. Most logic is done in some awful thing called the first order predicate calculus,"
	DT " if you'll pardon the expression, which has the virtue that there's some good theorems about it, but it has the trouble that it "

	ORG 0xd00
Table13
	addwf PCL,f
	DT "can't talk about its own deductive processes. That's what we think when you say, I've been working on this for 15 minutes and I"
	DT " haven't gotten anywhere, well that's not the most important kind of self-monitoring supervising there could be. But I've never "

	ORG 0xe00
Table14
	addwf PCL,f
	DT "seen that happening. Now you can sort of simulate it by assigning scores to how long you've searched part of the tree or someth"
	DT "ing, using the alpha beta heuristic for controlling searches '[] incidentally, that was invented by Arthur Samuel in the checker"

	ORG 0xf00
Table15
	addwf PCL,f
	DT "s program, and reinvented by John McCarthy because Samuel had explained it so badly.      Neural nets, you might think, have th"
	DT "at fuzzy quality that if two things aren't exactly the same, well it will recognize it anyway. So they're fine. But the trouble "

	ORG 0x1000
Table16
	addwf PCL,f
	DT "with neural nets is that they're completely incapable of any reflection. If part of your machine, like the OCR part, uses a neu"
	DT "ral net to distinguish between a P and a broken R, there's no way the rest of the program can know - it's very hard - to disasse"

	ORG 0x1100
Table17
	addwf PCL,f
	DT "mble the huge number of little numbers hidden in the neural net program and figure out what was the important feature that allo"
	DT "wed it to make its distinction. In principle, you could do that, but I don't know of anybody incorporating neural nets with othe"

	ORG 0x1200
Table18
	addwf PCL,f
	DT "r kinds of reasoning with any such interface.      Genetic algorithms are very popular. I can't figure out why because, in almo"
	DT "st all respects, they are worse than the traditional artificial intelligence heuristic search. What genetic algorithms do is use"

	ORG 0x1300
Table19
	addwf PCL,f
	DT " the computers ten thousand times faster to make lots of things to try. Then you have a competition so that the ones that succe"
	DT "ed better in solving some problem, or faster, replace the ones that took longer. However, in real life I think that's the wrong "

	ORG 0x1400
Table20
	addwf PCL,f
	DT "thing. And evolution itself is screwy about this. The important thing is not to remember what led to success - or half of the t"
	DT "hing you should remember is what worked. The other half is what are the 100 most common mistakes. When I was training for a Ph.D"

	ORG 0x1500
Table21
	addwf PCL,f
	DT ". in mathematics, everyone understood that in the mathematics world. If you hear a theorem, then you also want to know the 10 m"
	DT "ost likely ways that it won't apply. Of course a theorem is always true if the conditions are true, but if this was true for a c"

	ORG 0x1600
Table22
	addwf PCL,f
	DT "ompact set, is it also true for a locally compact set, and if not where is the counter example that shows why that kind of reas"
	DT "oning breaks down.      What evolution and genetic algorithms don't do -tell me if I'm wrong- is keep any record of why all thos"

	ORG 0x1700
Table23
	addwf PCL,f
	DT "e poor losers died. If it weren't for a almost religious, superstitious worship of imitating genetics which took 600 million ye"
	DT "ars, well, [] 400 million years, to get to us from fish... You could say, boy, if [we] had kept some records of what went wrong "

	ORG 0x1800
Table24
	addwf PCL,f
	DT "and spent about the same amount of energy on learning how to avoid bugs, maybe it would have taken only 5 million years instead"
	DT " of 400' Who knows' But I think people who look at genetic algorithms and don't notice that they don't solve any problems that r"

	ORG 0x1900
Table25
	addwf PCL,f
	DT "equire deep thought should... I could go on all day'      The other [point], finally, is one that will irritate more people. I "
	DT "don't like [the] use of statistical methods for learning to distinguish between ambiguous words in language or learning behavior"

	ORG 0x1a00
Table26
	addwf PCL,f
	DT " by changing probabilities and so forth. The reason is that again, if the knowledge you store is stored as vectors of numbers, "
	DT "then that program might be good. Might get 95% of what it's faced with. But the other 5% might be stuff that requires some refle"

	ORG 0x1b00
Table27
	addwf PCL,f
	DT "ction and deeper thought about the nature of the problem. Now if your conclusions are expressed as meaningless vectors in some "
	DT "high dimensional vector space, there's no way you can think about that, and no way for the program. So whenever I see a number i"

	ORG 0x1c00
Table28
	addwf PCL,f
	DT "n a learning program, I say that might be useful now, but it's an intellectual dead-end. The simplest way to put it is if you s"
	DT "ee 12 as the sum of something, you've lost a lot of information. Because it might have been (3 + 9) or (4 + 8) or (5 + 7) and so"

	ORG 0x1d00
Table29
	addwf PCL,f
	DT " on. Whenever you see a number, you should say 'how sad.' It's the most opaque thing in the world. That's why it's so useful. B"
	DT "ecause if you're counting things, you don't care if they're dead people or broken plates - 6 dead things and that says it all.  "


		
          END

