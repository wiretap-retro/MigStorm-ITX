;Memory filled with strings; All of them are sent only once to UART.
	LIST      P=18F252
	#include "p18f252.inc"
	RADIX DEC

		__CONFIG	_CONFIG1H, b'11111010'	;_OSCS_OFF_1H & _HS_OSC_1H
		__CONFIG	_CONFIG2L, _BOR_ON_2L & _BORV_20_2L & _PWRT_ON_2L
		__CONFIG	_CONFIG2H, _WDT_OFF_2H & _WDTPS_128_2H
		__CONFIG	_CONFIG4L, _STVR_ON_4L & _LVP_OFF_4L & _DEBUG_OFF_4L
		__CONFIG	_CONFIG5L, _CP0_OFF_5L & _CP1_OFF_5L & _CP2_OFF_5L & _CP3_OFF_5L
		__CONFIG	_CONFIG5H, _CPB_OFF_5H & _CPD_OFF_5H
		__CONFIG	_CONFIG6L, _WRT0_OFF_6L & _WRT1_OFF_6L & _WRT2_OFF_6L & _WRT3_OFF_6L
		__CONFIG	_CONFIG6H, _WRTC_OFF_6H & _WRTB_OFF_6H & _WRTD_OFF_6H
		__CONFIG	_CONFIG7L, _EBTR0_OFF_7L & _EBTR1_OFF_7L & _EBTR2_OFF_7L & _EBTR3_OFF_7L
		__CONFIG	_CONFIG7H, _EBTRB_OFF_7H		
		
	CBLOCK 0x20
	cnt1
	cnt2
	cnt3
	ax
	ENDC


	variable	_tab_cnt=0

;******************** MACROS **********************
	
SendLWait macro
	btfss PIR1,TXIF		;empty?
	goto $-2
	movwf TXREG
	endm
	
;************************ START *******************

	ORG       0x0000
	goto init
	nop
	nop
	nop


init      
	movlw	d'10'		; at 20Mhz with 115200 => 10
	movwf	SPBRG		; at  4Mhz with  19200 => 12
	movlw	b'00100100'	; TXEN+BRGH
	movwf	TXSTA

	movlw	b'10010000'
	movwf	RCSTA
          
start 
	movlw	UPPER Table1
	movwf	TBLPTRU
	movlw	HIGH Table1
	movwf	TBLPTRH
	movlw	LOW Table1
	movwf	TBLPTRL

	movlw	125
	movwf	cnt2
hop2
	clrf	cnt1
hop1	
	TBLRD*+
	movf	TABLAT,	w
	SendLWait
	
	decfsz	cnt1
	goto	hop1
	decfsz	cnt2
	goto	hop2
	goto $			; freeze
	
Table_size set Table1_end - Table1
	messg #v(Table_size)	

;TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT


	ORG 0x100
Table1
	DB	"[Since the mid 1970s], AI, in my view, has not made dramatic progress in the direction of programs that have what you call 'gene"
	DB	"ral intelligence' or 'common sense' or a lot of resourcefulness for handling problems that the programmer didn't have in mind []"
	DB	". That's a quarter century. You can ask what happened.   Certainly lots of things happened that you could call AI. Optical chara"
	DB	"cter recognition, machines reading not-too-badly printed text, are pretty good. They only make a mistake every few lines. But th"
	DB	"ose are not using very different techniques than were available before. The computer is a thousand times faster, or more. Most p"
	DB	"eople in AI are either working on trying to represent knowledge in the form of mathematical logic, which reveals a lot of proble"
	DB	"ms, but doesn't give us good solutions. The reason I don't care for logic is that I think the kind of reasoning that people find"
	DB	" useful in real life is reasoning by analogy. What I mean by reasoning by analogy is: of course if you see a problem exactly lik"
	DB	"e one you've seen before, then you can just remember the solution. But in real life that almost never happens. There are always "
	DB	"some things different. So you look at this problem or situation and say, what worked' What do I remember about solving a similar"
	DB	" problem in the past' That word 'similar' means that you're looking in your records for a case that has some features or propert"
	DB	"ies or functionality that's the same as this problem, and other features that are different. Then you have to ask, which of thes"
	DB	"e features are important' If they're not important, then who cares. If it's different in important features, then you want to ge"
	DB	"t a sub-goal, which says, how can I change this problem so that it will better fit that one. So it seems to me that most of what"
	DB	" we call 'problem solving' is figuring out how to fit the present case to situations which you've seen before, which aren't the "
	DB	"same. Mathematical logic is no good at this.   It's very hard to represent meta-knowledge about which features of things are imp"
	DB	"ortant because it's hard to express what you mean by important. What is important' It might be something like, 'it will reduce y"
	DB	"our amount of search time'. Most logic is done in some awful thing called the first order predicate calculus, if you'll pardon t"
	DB	"he expression, which has the virtue that there's some good theorems about it, but it has the trouble that it can't talk about it"
	DB	"s own deductive processes. That's what we think when you say, I've been working on this for 15 minutes and I haven't gotten anyw"
	DB	"here, well that's not the most important kind of self-monitoring supervising there could be. But I've never seen that happening."
	DB	" Now you can sort of simulate it by assigning scores to how long you've searched part of the tree or something, using the alpha "
	DB	"beta heuristic for controlling searches '[] incidentally, that was invented by Arthur Samuel in the checkers program, and reinve"
	DB	"nted by John McCarthy because Samuel had explained it so badly.   Neural nets, you might think, have that fuzzy quality that if "
	DB	"two things aren't exactly the same, well it will recognize it anyway. So they're fine. But the trouble with neural nets is that "
	DB	"they're completely incapable of any reflection. If part of your machine, like the OCR part, uses a neural net to distinguish bet"
	DB	"ween a P and a broken R, there's no way the rest of the program can know - it's very hard - to disassemble the huge number of li"
	DB	"ttle numbers hidden in the neural net program and figure out what was the important feature that allowed it to make its distinct"
	DB	"ion. In principle, you could do that, but I don't know of anybody incorporating neural nets with other kinds of reasoning with a"
	DB	"ny such interface.   Genetic algorithms are very popular. I can't figure out why because, in almost all respects, they are worse"
	DB	" than the traditional artificial intelligence heuristic search. What genetic algorithms do is use the computers ten thousand tim"
	DB	"es faster to make lots of things to try. Then you have a competition so that the ones that succeed better in solving some proble"
	DB	"m, or faster, replace the ones that took longer. However, in real life I think that's the wrong thing. And evolution itself is s"
	DB	"crewy about this. The important thing is not to remember what led to success - or half of the thing you should remember is what "
	DB	"worked. The other half is what are the 100 most common mistakes. When I was training for a Ph.D. in mathematics, everyone unders"
	DB	"tood that in the mathematics world. If you hear a theorem, then you also want to know the 10 most likely ways that it won't appl"
	DB	"y. Of course a theorem is always true if the conditions are true, but if this was true for a compact set, is it also true for a "
	DB	"locally compact set, and if not where is the counter example that shows why that kind of reasoning breaks down.   What evolution"
	DB	" and genetic algorithms don't do -tell me if I'm wrong- is keep any record of why all those poor losers died. If it weren't for "
	DB	"a almost religious, superstitious worship of imitating genetics which took 600 million years, well, [] 400 million years, to get"
	DB	" to us from fish... You could say, boy, if [we] had kept some records of what went wrong and spent about the same amount of ener"
	DB	"gy on learning how to avoid bugs, maybe it would have taken only 5 million years instead of 400' Who knows' But I think people w"
	DB	"ho look at genetic algorithms and don't notice that they don't solve any problems that require deep thought should... I could go"
	DB	" on all day'   The other [point], finally, is one that will irritate more people. I don't like [the] use of statistical methods "
	DB	"for learning to distinguish between ambiguous words in language or learning behavior by changing probabilities and so forth. The"
	DB	" reason is that again, if the knowledge you store is stored as vectors of numbers, then that program might be good. Might get 95"
	DB	"% of what it's faced with. But the other 5% might be stuff that requires some reflection and deeper thought about the nature of "
	DB	"the problem. Now if your conclusions are expressed as meaningless vectors in some high dimensional vector space, there's no way "
	DB	"you can think about that, and no way for the program. So whenever I see a number in a learning program, I say that might be usef"
	DB	"ul now, but it's an intellectual dead-end. The simplest way to put it is if you see 12 as the sum of something, you've lost a lo"
	DB	"t of information. Because it might have been (3 + 9) or (4 + 8) or (5 + 7) and so on. Whenever you see a number, you should say "
	DB	"'how sad.' It's the most opaque thing in the world. That's why it's so useful. Because if you're counting things, you don't care"
	DB	" if they're dead people or broken plates - 6 dead things and that says it all.   People have reasons why computers don't really "
	DB	"think. They're all silly. The answer is we haven't programmed them right. But some people will say that they don't know the mean"
	DB	"ing of what they're doing. Meaning is something the computer can't have, so these are really different philosophers. A humanist "
	DB	"says they don't even know that they exist. They can't have goals. Yet another one will say they don't have consciousness, whatev"
	DB	"er that is (and I'll come to that). A sensible person says they just don't have much common sense. That's what we can fix. Here'"
	DB	"s a little example. As far as I know, no computer knows that you can use a string to pull and object, but not to push it. You pr"
	DB	"obably shouldn't eat string and if you tie a box with it, you should have put the stuff in it before. I added if you steal a str"
	DB	"ing, it's owner might be annoyed. But the point is, there are a whole lot of things you know about string. There's been only one"
	DB	" large project to do something about that, that's the famous Cyc project of Douglas Lenat in Austin. He's coming along, but if y"
	DB	"ou look at Cyc, it's still can't do any extensive amount of 5-year old type common sense reasoning. In particular it doesn't kno"
	DB	"w much about space. Knows a lot about time. There's also the theory of free will. I'll skip that.   So let's talk about consciou"
	DB	"sness for a minute. I can't discuss it much, but I just put a big essay on it on my web page. [] If you don't like something abo"
	DB	"ut it, I would love email about where you agree and disagree because I'm trying to make it so perfect that everybody will agree "
	DB	"with everything. At least I'm going to spend a few more weeks on it. But what the chapter maintains, among other things, is that"
	DB	" the reason consciousness has baffled so many people, especially physicists, is very simple: there isn't any such thing. Conscio"
	DB	"usness is a word that we use as a suitcase word. It's a word we use as a name for a dozen very hard problems about how the brain"
	DB	" or the mind works, which are quite different from one another. In fact, if you go to school, which you've all probably done, do"
	DB	" you remember anybody giving a little class where you talk about what is thinking and how does it work' As Seymour Pappert has p"
	DB	"ointed out... or what is learning. You probably heard one of those'   Have you heard the theory that to learn something you shou"
	DB	"ld do it in little bits and not stay up all night working on it' If that were true, there would be no computer games' [laughs, a"
	DB	"pplause] I visited my lab the other night and I was shocked to see nobody in it' It occurred to me that it may be near the end o"
	DB	"f its useful life' So consciousness is a suitcase word. One of the most important things is keeping some records of what you've "
	DB	"done recently so if something goes wrong, you can think about which of the things you did might have been wrong. That's the cred"
	DB	"it assignment problem that I believe will be necessary for genetic programming someday to work well. Making descriptions of thos"
	DB	"e events.   The rest of my lecture will emphasize how do you describe what happened. You need some way to represent it, some kin"
	DB	"d of data structure. I'll recommend five or six of them.   My thesis is that the two main reasons why AI hasn't made progress [i"
	DB	"s that] (1) [] people haven't tried to organize common sense knowledge. But the reason they couldn't is that they didn't know ho"
	DB	"w to represent it. People are always arguing, should I use a relational database' Should I represent it in the neural net' Shoul"
	DB	"d I represent it as a fuzzy logic set' Should I represent is as a bunch of axioms in mathematical logic' The answer to all of th"
	DB	"ose is 'no'. You should use all of them. Use neural net for things that depend on a whole lot of small inputs in a moderately ad"
	DB	"ditive, but not very interesting way... just weighting things. Use logic for something that depends on a few very important infl"
	DB	"uences. If you change the value of one of them, the whole thing won't work. If that's the kind of thing you'll make out of might"
	DB	"'s, ands and ors and so on.   I guess I shouldn't read the other ten' Making and using models of yourself, like revealing the co"
	DB	"urse of your ability to solve a problem. You might say well, maybe I need to take a course in this. Or if I don't get better at "
	DB	"this, my friends will hate me. Really if I did get better at this, I'd just be a nerd of some sort and my friends would hate me "
	DB	"even more. And so on. Hearing conversations in your mind. Making new goals.Adjusting your level of wakefulness, whatever that me"
	DB	"ans.   Back to learning. Recent discoveries in learning skills has revealed a very strange fact - suppose you work very hard on "
	DB	"something and then you're tested later that day on the same thing. It's interesting, you won't be much better. If you're tested "
	DB	"the next day, you may be a lot better. If you're tested the third day, you may be considerably better than you were on the secon"
	DB	"d day without having done the thing in between. Guess what's the largest factor in influencing to what extent that's true' It's "
	DB	"whether you got 8 hours of sleep or 6. Have you ever heard of such a thing' I never heard of it until last week when a sleep res"
	DB	"earcher named Robert Stickgold told me that this has been discovered in several places. In school when they teach you about thin"
	DB	"king or learning...and what's school for' It's not to learn about Inuit culture or Egyptian culture or algebra or geography or w"
	DB	"hatever' What you're really in school for is to learn about thinking and learning. As Pappert has pointed out many times, we kno"
	DB	"w so little about it - or the teachers do at least - that it's a taboo subject. You don't talk about it. That's because we don't"
	DB	" have good theories of things. Anyway if you read chapter E4 you'll see that I think I am on the track... E5 goes to more detail"
	DB	".   I have a theory of how to get a machine to do many of the things that go into this suitcase of consciousness. There will sti"
	DB	"ll be people who say yes, but you haven't gotten at the unified, central, solar spirit or magic of consciousness that explains a"
	DB	"ll those other things. My answer is go back to the Middle Ages or stop bothering me, I'm busy.   This is a diagram of the system"
	DB	" I ended up with, which has five layers of things including theaters which are places where you simulate in one way or another w"
	DB	"hat you think might happen if you were to do something. Here on the side where you can't see it... But some people will say but "
	DB	"consciousness...isn't that the central thing that's in control. That's another disaster. There isn't any central thing in contro"
	DB	"l. The anterior hypothalamus controls what happens if you're too cold or too hot. And the posterior hypothalamus does the opposi"
	DB	"te. Both of those little pieces of brain, which are very tiny, have about 10 heuristics. Like if you're too hot you will stretch"
	DB	" out and you'll start sweating. If you're smart, you'll go to an air-conditioned movie, using the higher, more reflective levels"
	DB	" of the mind. So what I'm saying is that what controls what you do is not centrally controlled. If some ferocious animal comes o"
	DB	"ver here, that's going to interrupt me and I'll react with some primitive alarm system or other. There are about 10 of those. Th"
	DB	"e human brain is a wonderful kluge that has built lots of different kinds of control systems. You shift from one to another, but"
	DB	" some of your common sense says what you can shift to. If the alarm isn't loud enough, maybe you'll think well this is a real em"
	DB	"ergency. If I don't get this done, I'll lose my job and whatever you're worried about.   Anyway the way this book starts is the "
	DB	"idea that the best way to look at the mind, at least when you start, is just think of it as a big cloud of different processes t"
	DB	"hat are connected. Each of them has some function, each of them depends on a few others. If you look at the brain, you'll see th"
	DB	"at there are about 400 brain centers. There's a lot that we can't see because there are families of cells that are common to man"
	DB	"y brain centers that are activated by separate busses. If you look in the brain, you'll see several hundred distinct large busse"
	DB	"s and in only a few cases do we know what those do. But each brain center typically connects to one, two or thirty different oth"
	DB	"er brain centers, and has almost no connections with the rest. So it's a big, complicated, highly evolved architecture. However "
	DB	"in the popular mind there are very popular theories like the mind is two parts - logic and intuition - or reason and emotion - o"
	DB	"r left brain versus right brain. That's a very popular one. But there's really no basis to it. It's true that there's more langu"
	DB	"age in the left brain in most people, but there are children with a certain kind of epilepsy who have to lose a hemisphere. I kn"
	DB	"ow a 9-year old who lost his entire right brain when he was 3 1/2 years old. He's a superior achiever in his class. He can't see"
	DB	" on one side of his visual field and his left hand isn't very good, but he's charming and sociable and makes great drawings. He'"
	DB	"s fine. So one should know that before you believe people.   One thing I emphasize a lot in this book is this idea of multiple r"
	DB	"epresentation. If you understand something very precisely in one way, say what does the word understand mean, what does meaning "
	DB	"mean' It's a difficult word because there's a kind of philosophical trouble with it. Here's what I think understanding is. [] Mo"
	DB	"st of you are too young to remember the new math where you were told about the empty set and that the number one is the set that"
	DB	" contains only the empty set and stuff like that. That that was the right way to define numbers. Of course numbers are also ways"
	DB	" of expressing the size of things and the importance of things. You use it in all different ways. So if you understand something"
	DB	" in only one way, then I claim you don't understand it at all in the following sense: you know it by rote. Maybe you have a sent"
	DB	"ence. Henrik Van Loon had a child in some story in a 19th century children's book. This child had learned that the Nile is the l"
	DB	"ongest river in the world. His teacher said what's the longest river in the world and he couldn't answer it. Then she prompted h"
	DB	"im 'the Nile is' and out it comes. So you would say that this child has memorized or learned by rote something, but he doesn't u"
	DB	"nderstand it. What's the point' If you have several representations of it, like if you think of the Nile as a river and maybe yo"
	DB	"u have a mental image of this river going much further than some other river, and you might have a optic image of swimming in an"
	DB	"d realizing you're never going to get to the end and you're going to die. Images like that are very good for helping you remembe"
	DB	"r stuff. So each of you probably has a dozen different ways to represent a river. There are some optic ones, things you use a ri"
	DB	"ver, there's the river as an obstacle that you need a tunnel or bridge to get across []. The point is that if you have 10 differ"
	DB	"ent meanings or representations of the river, then when you hear somebody talking about it you won't get stuck. You'll probably "
	DB	"get stuck, but in 30 milliseconds or less you'll say I've got the wrong representation and you scan through 5-10 of them and all"
	DB	" of a sudden, you know what they're talking about. This is why philosophers and very literal people have had trouble with words "
	DB	"like meaning and understanding because of this joke: if you understand something in just one way, then you don't functionally un"
	DB	"derstand it at all.   Throughout this book I use the idea of suitcase word, of saying that... now this isn't quite the same thin"
	DB	"g, but sometimes we don't understand something because we falsely assume that there's an 'it' there rather than a collection of,"
	DB	" or a network of interrelated processes. It's hard to put those in a definition, especially a logical one. So understanding mean"
	DB	"s having many ways to deal with things. I can't remember what kind of crazy search found this. It's from Aristotle's Metaphysics"
	DB	". I was looking for something to see whether he had this idea. I will read it. 'The essence of a house is assigned in such a for"
	DB	"mula that has a shelter against destruction by wind, rain and heat. But a physicist would describe it as stones, bricks and timb"
	DB	"ers.' You see the difference the first one is a functional definition - the house is to keep the rain off me. The second one is "
	DB	"a structural description - it's something supported by something else as a certain structure. Aristotle says, 'but there's a thi"
	DB	"rd possible description which would say that it was that form in that material with that purpose or end. Which, then, is entitle"
	DB	"d to be regarded as the genuine physicist' The one who confines himself to the material or the one who restricts himself to the "
	DB	"formulable essence'' That's the function, I guess. 'Is it not rather the one who contains both in a single formula''   So here's"
	DB	" an example of multiple representation, not in terms of different data structures, but you might use the same data structure in "
	DB	"different realms of concern. John gave Mary the book. I discussed this example in my old book, The Society of Mind. I'm deciding"
	DB	" how much of that old section to copy and how much to write new. Whenever you see something happen, you can think of it has pure"
	DB	"ly physical, as Aristotle said. John gave Mary the book. First it's in John's hands and you might imagine a physical transfer sc"
	DB	"ript where it moves to Mary's hands. There's another one which I'm thinking of calling 'dominion'. Did you notice that wherever "
	DB	"you go in the world, whatever you see, you can't have it because it belongs to someone. It's very important. Almost everything b"
	DB	"elongs to someone, including the air in some science fiction stories. So what's happened is, it looks like the control of the bo"
	DB	"ok has passed from John to Mary, but we don't know whether he's loaned or maybe it was hers all along, and he's giving it back. "
	DB	"As soon as you hear that, perhaps different parts of your mind are looking for different answers to resolve this ambiguity.   Al"
	DB	"so there's been a change in the memory of John and Mary because unless he's like me, he probably remembers who he gave the book "
	DB	"to. Anyway I conclude that chapter showing a dozen different kinds of data structure that you could use for representing things."
	DB	" A lot of these data structures depend on each other, so you talk about very low level neural nets, or even lower level connecti"
	DB	"ons between things. I don't want to talk about things I call K-line semantic nets, which I think are actually about the richest "
	DB	"representations for problems you don't understand yet. That's what relational databases have in them. Then the kind of frame arr"
	DB	"ays and trans-frames and scripts that I talked about in The Society of Mind.   So the moral of all this is that when you have a "
	DB	"new problem and you say what's the best way to represent this, should I use a neural net or a relational database, the answer is"
	DB	" if you're just trying to get something done quick and it doesn't have to be very good or resourceful, then I'll suggest a way t"
	DB	"o pick one. But if you're looking for something in the future that's like a baby machine that's going to keep getting smarter, t"
	DB	"hen you'd better not have it learn by statistical associations or neural nets or whatever. You should probably start it off with"
	DB	" five or six of these things and figure out some way of negotiating and managing that the different representations give you alt"
	DB	"ernate ways of using the same kind of knowledge.    Then somewhere in my web page you'll find this diagram, which I'm very proud"
	DB	" of, although it's been around since 1993. This is a little diagram that suggests why it's sometimes better to use neural nets o"
	DB	"r fuzzy logic, and why it's sometimes better to use logical reasoning.   This is just a handy theory. You look at this problem. "
	DB	"My favorite example is you see there's some property of a situation and you ask what does it depend on. Does it depend on a larg"
	DB	"e number of small causes or a small number of large causes. What keeps this chair off the floor' It's four legs. Then you can do"
	DB	" logic. You can say if that leg were missing and it got a little force, it would tilt that way. If the front two legs were missi"
	DB	"ng, then it wouldn't need any force, it would just fall. Neural nets won't do you any good with that. Or if they do, they'll was"
	DB	"te a lot of resources. On the other hand, what keeps this jacket on the table' Well, it's probably 5-10 million little linen fib"
	DB	"ers touching the surface and each pushing up with a few milligrams of force. If 10 thousand of them disappeared suddenly, you wo"
	DB	"uldn't notice the difference. So that's a good place to use a neural net like thing.   I call this the theory of causal diversit"
	DB	"y. What annoys me is it's not that I like this theory, but I've been peddling it. I say, tell me a similar theory for when it pa"
	DB	"ys to use the genetic algorithm or a blah, blah. In other words, what went wrong in AI is that people went off around 1980 in di"
	DB	"fferent directions. If somebody is doing grammar, instead of grammar they're doing statistical associations of words and cluster"
	DB	"ing theory to find the word types and so forth. That's very nice, but I want to know, when is that better than using a simpler t"
	DB	"extbook type grammar and what do you mean by when' For what kind of problem' If you're trying to transcribe a conversation that "
	DB	"you dictated from hearing two of your roommates talk, you'll find that it isn't even made of sentences very much. People stop in"
	DB	" the middle of the sentence when they know that you probably got the idea and so forth. Then statistical things might help, or e"
	DB	"lse something that represents conceptual ambiguity very graphically and clearly.   In other words what I'm saying is not that th"
	DB	"is is the right diagram, but how come you don't have 5 or 10 of them and why don't people think more about that sort of thing. L"
	DB	"et me put it another way - artificial intelligence...of course there's nobody in charge of it, so you can't say what's it for. C"
	DB	"learly some people are trying to make machines smarter at particular things. Lots of people do that. A few people are trying to "
	DB	"make machines generally more resourceful. I only know of about a dozen such people. Some people are trying to make theories of h"
	DB	"ow the human mind works. That's cognitive science.   But in any case, if you look at those, you might have [] of higher level qu"
	DB	"estion, which is, what are the kinds of problems that a person can solve' What are the big classes of problems' I don't know. So"
	DB	" you see the reason why this theory of causal diversity is nice, [] it says well in some problems you're trying to understand an"
	DB	" effect that has a lot of small causes. You see all 9 holes in this diagram are meaningful. If there are just a few causes, then"
	DB	" they have small effects. Then it's not a problem. That's the empty square. If there's a medium number of problems with small ef"
	DB	"fects, then a linear theory will probably do, and maybe a simple statistical one. If there are a lot of causes with small effect"
	DB	"s, then you need some elaborate connection, neural network or something like that.   It's hard to find anything else that will d"
	DB	"o. If a small number of causes with large effects, then that's clearly logic. If you're in the middle, that's where classical, a"
	DB	"rtificial and traditional heuristic search worked. The chess program. Actually it's a small number of causes with large effects."
	DB	" But that small number is about 32 chess pieces and they're all interacting in rather horrible ways. Loss of a pawn has a large "
	DB	"effect eventually. So classical AI handles those problems by big searches perhaps. You can use case-based reasoning or analogy-b"
	DB	"ased reasoning. This middle ground is where traditional AI was notably successful. But not many people do it anymore. In this co"
	DB	"rner, the problem is hopeless. If there are a lot of causes with large effects, then you're screwed. But there's a way to get ar"
	DB	"ound it, which is to find a different representation like happened in physics when most people couldn't cope with the Heisenburg"
	DB	" matrix formulation for quantum mechanics when there are a lot of variables. But if you put it in terms of the Schroedinger equa"
	DB	"tion, it looks much neater and everybody felt better. Obviously there were still 20 variables you couldn't do a damn thing. But "
	DB	"you could prove meta-theory about it more easily. So making a new representation is the big deal if a problem seems hopelessly c"
	DB	"omplicated.   That's mostly what I wanted to say. So the question is why we didn't get HAL in 2001' I think the answer is I beli"
	DB	"eve we could have. [] I once went to an international conference on neural net. There were 40 thousand registrants. I don't know"
	DB	" how many go to an international conference on genetic algorithms or genetic programs, but there are many thousands of people wo"
	DB	"rking on that. Tens of thousands of people try to make slightly better rules-based systems. That's another very useful represent"
	DB	"ation. But very few try to make a system that will in some very smart ways make new rules on the basis of experience. That's the"
	DB	" obvious thing to do. Randy Davis tried it for awhile, but I haven't heard of much work in that direction. I'm sure there is. Bu"
	DB	"t you see in these areas that have real growth potential, if you had an international conference, for example, on using multiple"
	DB	" representations for common sense reasoning, I've only been able to find 6 or 7 people in the whole world. I'm sure there's at l"
	DB	"east twice that many that I don't know of, but not thousands.   So the reason nothing much happened, from my point of view, it's"
	DB	" not fair to the people who made lots of progress in qualitative physics and certain kinds of linguistics and heaven knows what."
	DB	".. but what happens now' What's the worst of all'   Here is a word for the simulation people. I think simulations are immensely "
	DB	"important. All over the world there are probably 40 thousand students working on making stupid little physical robots with their"
	DB	" programming. Nothing seems ever to be learned from this. When I was a young student, I met W. Gray Walter, a scientist in Brist"
	DB	"ol, England, who had made these little turtles that reacted to light and crawled around and did a lot of the things that your ty"
	DB	"pical mini-robot does. He showed what they could do. It became clear that they couldn't do very much. After awhile this early pe"
	DB	"riod of the late 1940s and early 1950s, that got abandoned. It started up again in force in the 1980s. I can't for the life of m"
	DB	"e see why any student would do this. I'm very angry at a professor who would ask a student to. Because in the 10 or 15 years sin"
	DB	"ce 1980, maybe there have been 3 or 4 interesting discoveries. People will tell you we've discovered that you have to make the l"
	DB	"imbs compliant or they won't work. That was known in the '70s. Tell me something else that you've learned from building a physic"
	DB	"al robot, and I'll tell you someone in the 1970s who wrote a big paper on that. So the student is wasting a whole year or three "
	DB	"soldering connections and working with bad components. Every now and then the robot will go down the hall and actually find a do"
	DB	"or and go through it, if that's what you're programming it to do. But you don't know why because next time it won't. That's why "
	DB	"you'll find that these robotics people treasure their videos - because it won't work tomorrow. The reason is that the real world"
	DB	"...but they say in the real world, you know, how do you know your simulation contains all the important things' The answer is te"
	DB	"ll me an important thing you've discovered and I'll make sure that it gets into the simulation. Nobody ever tells me one. Yes, t"
	DB	"he gears could have backlash, and I bet that your best CAD program can allow for that. I don't know. Yes, the floor might be sli"
	DB	"ppery and I'll bet there are 7 kinds of friction that you can understand. But then you can have the robot go over these 100 time"
	DB	"s varying a few parameters and understand the problem. But what happens in physical robotics is you never get to do the same thi"
	DB	"ng twice. There's no science. There's no replicable experiment. It's just like ESP, meaning usually it doesn't work, but it work"
	DB	"s if you're happy enough to have a video.   So I think simulations are immensely important. If you see a student who says I'm bu"
	DB	"ilding another robot, tell him 40 thousand people are doing that. In 15 years they've discovered 5 things (giving them the benef"
	DB	"it of the doubt). That means that in 400 thousand years, if you divide that...let's say 40 things...then you have one chance in "
	DB	"10 thousand of discovering something. Boy, isn't that an incentive' It's in common sense reasoning where we discover 5 things a "
	DB	"month (I'm not kidding), all 7 people. That's where the student should go.     From ARTIFICIAL INTELLIGENCE GAME DEVELOPERS CONF"
	DB	"ERENCE, MARVIN MINSKY.   [This was a test to fill PICs memory with data, and instead of something like 'The quick fox jumped ove"
	DB	"r the lazy dog' I selected something more interesting. And now a serial test:]  abcdefghijklmnopqrstuvwxyz ABCDEFGHIJKLMNOPQRSTU"
	DB	"VWXYZ abcdefghijklmnopqrstuvwxyz ABCDEFGHIJKLMNOPQRSTUVWXYZ abcdefghijklmnopqrstuvwxyz ABCDEFGHIJKLMNOPQRSTUVWXYZ abcdefghijklmn"
	DB	"opqrstuvwxyz ABCDEFGHIJKLMNOPQRSTUVWXYZ abcdefghijklmnopqrstuvwxyz ABCDEFGHIJKLMNOPQRSTUVWXYZ abcdefghijklmnopqrstuvwxyz ######."
									;ARTIFICIAL INTELLIGENCE GAME DEVELOPERS CONFERENCE 2001 MARVIN MINSKY 
Table1_end

		
          END

