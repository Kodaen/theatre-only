VAR despair = 0
VAR alcool_is_visible = false
VAR nb_drinks = 0
VAR cup_is_already_full = true
VAR eve_called = false
VAR prefet_called = false
VAR arthur_called = false
VAR pizzeria_called = false
VAR fenetre_ouverte = false
VAR colere = false

// Le jeu démarre sur une introduction présentant la pièce, ainsi que les props qui sont disponibles immédiatement.
-> introduction

// SCENE PREMIERE //
== introduction ==
{Il règne sur le commissariat un silence pesant. Une énorme pile de dossiers couvre presque entièrement ce qui fût un jour un bureau. Ducray est assis derrière, pensif. Absent. | Ducray gît derrière son bureau.}

* {alcool_is_visible} Se servir un verre.
    Ducray se sert un verre. -> introduction
//* {nb_drinks == 1} Se resservir un verre.
//* {nb_drinks == 2} Un petit troisième pour la route.

* {introduction == 1} Bâiller. #audio yawn-choice
    Ducray se met à bâiller exagérément. Si quelqu'un d'autre avait été présent, il aurait sans doute bâillé à son tour. Mais il n'y a personne.
    -> introduction
* Regarder l'heure. #DMX /1 100 #DMX /3 255
    À en juger par le silence qui règne au commissariat, il est tard. À cette heure de la nuit, on ne trouve plus que ceux qui bossent trop, et ceux qui ne bossent pas assez. Difficile de dire à quelle catégorie le commissaire Ducray appartient. /*Il regarde l'horloge*/ Il jette un oeil sur l'horloge. Il devrait être rentré depuis longtemps. 02h51. À ce stade, c'est plutôt l'heure qui vous regarde que l'inverse. L'heure vous juge.
    ** Laisser tomber.
        -> introduction
    ** (duel_horloge) Affronter le regard de l'horloge. #DMX /1 100 #DMX /3 255 true
        Face au regard de l'horloge, pas question de baisser les yeux. Sans trop savoir pourquoi, Ducray resta planté un moment, à fixer l'heure. À la juger en retour.
        *** Jeter l'éponge.
            ~despair ++
            Après un long moment, Ducray dût bien admettre sa défaite. Une de plus. Voilà bien longtemps que le commissaire n'avait pas connu de victoire. À bien y réfléchir, sa vie n'avait été qu'une succession de défaite. La dernière victoire à laquelle il pouvait se raccrocher remontait à l'école primaire, lorsqu'il avait remporté une médaille d'argent à la natation.
            **** (medaille_argent) La médaille d'argent.
                Même cette victoire avait un goût amer. Il n'éprouvait aucun plaisir à y repenser. À cause de la piscine, sans doute...
                ~despair ++
            **** Refouler le souvenir.
                /*Il inspire fort*/ Une grande inspiration et le souvenir est déjà loin.
            ---- -> introduction
 * (regarder_bureau) Poser son regard sur le bureau. #DMX /1 100
    Derrière l'énorme tas de dossiers, on distingue à peine le bois du bureau. Du chêne. Le bureau de Ducray est à l'image de sa vie : bordélique. Chaotique. Abîmé. En instance de divorce.
    ** (fouiller_bureau) Fouiller parmi les dossiers.
        /* Il fouille dans les dossiers*/ {Les dossiers s'escaladent les uns les autres. Derrière cette apparent chaos se cache en réalité une logique implacable : il y a les dossiers, et il y a le dossier. | }
        *** Consulter les dossiers.
            Ducray toise les dossiers. Du boulot. Il déteste le boulot. Du moins, il déteste son boulot. Ceux des autres n'ont pas l'air si mal, en comparaison... Ces derniers mois, les affaires s'accumulent. La tension politique est à son comble, les attentats se multiplient.
            **** (attentats_politiques) Les attentats.
                Les travailleurs sont très en colère. D'abord, c'était contre ce qu'ils appellaient le système. Désormais, leur colère semble se porter sur des individus. Des patrons, des hommes politiques. Des riches... Ducray ne les aime pas trop, ces travailleurs. Trop politiques à son goût. Les riches, il les déteste carrément. Ducray n'aime pas grand monde. -> fouiller_bureau
        *** (consulter_dossier) Consulter le dossier.
            {Ducray ressort machinalement le dossier. Il l'a lu tant de fois qu'il le connaît par cœur. Jade de Fougerolles a été retrouvée morte le dimanche 23 septembre de l'année dernière, aux alentours de dix-neuf heures. Elle flottait, inerte, au milieu de sa piscine. Le descriptif de la mort est accompagné d'une photo du corps repêché, d'une copie du témoignage de l'homme qui la retrouvée morte, ainsi que du rapport d'autopsie. | Ducray consulte le dossier, une énième fois.}
            **** (photo_victime) La photo de la victime.
                La photo présente une femme, habillée d'une robe de cocktail blanche, allongée sur le bord d'une piscine. Elle est trempée jusqu'aux os. Sa robe lui colle à la peau. Son corps, blanc comme la craie. La femme n'a jamais été prise en photo dans la piscine dans laquelle elle s'est noyée. Au moment de l'arrivée de la police, le corps avait déja été tiré hors de l'eau. -> consulter_dossier
            **** (copie_temoignage) La copie du témoignage.
                L'homme qui a découvert le corps est Arthur Vasseur, un piscinier de trente-trois ans employé par la famille de la victime pour entretenir la piscine ainsi que le réseau de bassin qui s'étend sur toute la propriété. Il a déclaré avoir trouvé le corps aux alentours de dix-neuf heures. Il a tout de suite reconnu Jade, et a réussi tant bien que mal à la tirer hors de l'eau. Elle était déjà morte. Il a ensuite appelé la police. Divers détails de son témoignage ont parût suspects aux enquêteurs. Ensuite, la presse s'est emparé de l'affaire. Puis la sphère politique. Et finalement...
                ***** (details_suspects) Des détails suspects.
                    Arthur a d'abord prétendu avoir senti le poul de la victime, puis s'est ravisé plus tard, lors d'un témoignage ultérieur. Il a également déclaré avoir pratiqué un massage cardiaque, alors même qu'il admettait que la victime était déjà morte. Il a prétexté que la panique lui avait fait perdre ses moyens... -> details_suspects_suite
                ***** (details_suspects_suite) Et finalement... quoi ?
                    {Arthur est rapidement passé de témoin de première main à principal suspect. Ses empreintes recouvraient le corps de la victime. Il possédait également une clé de la propriété. Il connaissait la victime. Il avait un mobile. |}
                    ****** Les empreintes.
                        Des empreintes ont été retrouvées à divers endroits du corps. Le suspect s'est défendu en expliquant qu'il avait tenté de lui faire un massage cardiaque. Sous la panique, il n'a pas pensé à laisser le corps en état. -> details_suspects_suite
                    ****** La clé.
                        Son métier lui donnait accès à diverses clés, et il pouvait entrer dans la propriété à sa guise. C'est d'ailleurs comme ça qu'il a trouvé la victime. -> details_suspects_suite
                    ****** Sa relation avec la victime.
                        Elle était son employeur. Il était son employé. Arthur a toujours nié avoir un quelconque grief à son égard. -> details_suspects_suite
                    ****** Le mobile.
                        Elle était richissime. Il était pauvre. Pourtant, personne n'a jamais pensé qu'il ait pu en vouloir à son argent. D'autant que rien n'a été dérobé. En revanche... Il était politisé. Encarté. M.T.S.
                        ******* (MTS) Le M.T.S.
                            Le Mouvement des Travailleurs et Travailleuses Solidaires. Un mouvement citoyen sans représentants, très à gauche de l'échiquier politique. Naît lors des premières grèves générales, il n'a cessé de prendre de l'ampleur avec la montée des mouvements sociaux. -> details_suspects_suite
                ****** {CHOICE_COUNT() <= 3} Poursuivre la lecture du dossier. -> consulter_dossier
            **** (rapport_autopsie) Le rapport d'autopsie.
                {Un rapport d'autopsie. Ou plutôt un simulacre d'autopsie. Tout est allé très vite. La demande venait d'en haut. L'histoire faisait déjà beaucoup trop de bruit... |}
                ***** Lire le rapport d'autopsie.
                    La victime avait vingt-six ans au moment de la mort. La mort est survenue entre 18h30 et 19h00. Autrement dit, elle a pu mourir avant qu'Arthur ne la trouve, autant que de ses mains. Aucune analyse toxicologique n'a été requise. L'affaire a été expédiée. Présence d'eau dans les poumons. Noyade avérée. À part ça, aucune trace de lutte. Pas de contusions, pas de marques ni blessure. Un corps parfait. Neuf. Celui d'une personne qui n'a jamais eu à l'user. Un corps de riche. -> consulter_dossier
                ***** Une demande venue d'en haut.
                    C'est ce qu'on dit, dans les couloirs du commissariat. Difficile de dire de quelle altitude on parle... -> rapport_autopsie
            **** {CHOICE_COUNT() == 0} Un dernier détail.
                Il y a un détail dont le dossier ne fait pas mention. Ducray s'en souvient car c'est lui qui avait interrogé Arthur Vasseur, le jour où ce dernier avait appelé la police après avoir découvert le corps. Si le dossier n'en parle pas, c'est parce qu'on a dû juger qu'il était trop insignifiant pour figurer dans le dossier. Et pourtant...
                ***** Pourtant..?
                    {Pourtant ce détail, pour Ducray, fait toute la différence. Il l'obsède. Une simple odeur. À moins que Ducray ait simplement perdu les pédales... |}
                    ****** (odeur_amande) Une odeur ?
                        Lorsque Arthur a prodigué à la victime les premiers soins, il a précisé avoir senti une légère odeur d'amande.
                        ******* Un détail capital !
                            C'est du moins ce que pense un esprit malade comme celui de Ducray. Le moindre détail est important quand on a envoyé un homme sur la chaise électrique...
                        ******* Pas de quoi se réveiller la nuit...
                            ~despair ++
                            ...Sauf si vous êtes un flic alcoolique, en instance de divorce, et qui a potentiellement envoyé un innocent à la chaise électrique, bien entendu.
                        ------- (meurtre_politique) Arthur Vasseur. Celui-là même qui a découvert le corps. Quand la presse a divulgué son appartenance au M.T.S, la classe politique s'est emballée. Un meurtre politique. Un prolétaire noie de sang froid une richissime rentière. Jade de Fougerolles était vêtue d'une robe de cocktail. Difficile de croire à la thèse de la noyade accidentelle.
                        ******* {!MTS} Le M.T.S.
                            Le Mouvement des Travailleurs et Travailleuses Solidaires. Un mouvement citoyen sans représentants, très à gauche de l'échiquier politique. Naît lors des premières grèves générales, il n'a cessé de prendre de l'ampleur avec la montée des mouvements sociaux. -> meurtre_politique
                        ******* Un accident ?
                            La police, tout comme la presse, ont très vite écarté cette possibilité : au moment de sa mort, la victime était vêtue d'une robe de cocktail. Aller piquer une tête en robe de soirée, c'est tout de même... étrange. Pour autant...
                            ******** (these_empoisonnement) Pour autant ?
                            Pourtant, Ducray ne croit pas à la thèse du meurtre. Les médias ont fait de Jade de Fougerolles une représentante de la classe dominante - ce qu'elle était. Mais ils n'ont pas fait grand bruit du fait qu'elle était également une figure militante favorable à la classe ouvrière. Au point de s'attirer les foudres de sa famille. Pourquoi Arthur l'aurait-il choisi elle comme victime ? Tout ça n'a aucun sens... Et puis, il y a cette odeur d'amande.
                            ********* L'odeur d'amande.
                                Quand une personne ingère du cyanure, son haleine exhale un léger parfum d'amande. Jade n'a pas été noyée, elle a été empoisonnée.
                            ********** Un meurtre politique.
                                Peut-être. Les activités militantes de Jade étaient mal vues de tout un tas de personne, à commencer par sa propre famille, qui règne sur un véritable empire financier, érigé sur la sueur des prolétaire de tout le pays.
                            ********** Un meurtre famillial.
                                Possible. Jade, par ses actions politiques, mettait sa famille dans l'embarras. Une famille très puissante, et très riche. Jade devenait gênante pour les affaires...
                            ********** Un suicide.
                                C'est la thèse à laquelle Ducray veut croire. Il l'imagine ingérer du cyanure puis décider d'aller prendre un dernier bain. Se laisser mourir paisiblement, bercée par le mouvement de l'eau. Jade serait morte noyée, incapable de nagée suite aux effets du poison. Ça expliquerait la robe de soirée : personne n'aurait l'idée de se suicider en bikini.
                            ---------- -> dossier_lu
                    ****** La folie.
                        ~despair ++
                        En effet, il faut être fou pour se torturer avec un détail si minuscule, depuis plus d'un an. Lorsque Arthur a prodigué à la victime les premiers soins, il a précisé avoir senti une légère odeur d'amande. -> odeur_amande
    ** (ouvrir_carton_1) Ouvrir le carton sous le bureau.
        ~alcool_is_visible = true
        Ducray ouvre le carton sous le bureau. Il a fait ce geste mille fois, un million de fois. Au début, un sentiment de honte l'accompagnait. Plus maintenant. /*Il sort une bouteille d'alcool et la pose sur le bureau*/
        *** Se servir un verre.
            Ducray regarde autour de lui. Le seul récipient qu'il trouve est une tasse, à moitié pleine.
            **** Inspecter la tasse.
                Un mélange non identifié gît au fond de la tasse. Depuis combien de temps ? Il ne le sait pas.
                ***** Jeter le liquide.
                    /*Verse le liquide noir dans la poubelle et repose sa tasse sur le bureau.*/ Si Ducray voulait se tuer, il s'y prendrait autrement.
                    ****** Se servir un verre.
                        -> premier_verre_1
                    ****** Rester sobre.
                        -> rester_sobre_1
                ***** Santé ! (Boire le liquide)
                    /* Il boit la tasse */ L’entièreté de son corps se froisse. Il vient d’expérimenter avec beaucoup d’âpreté le baiser d’une fosse septique.
                    ****** (premier_verre_1) Se servir un verre.
                        ~nb_drinks ++/* Ducray se sert un verre */ 
                        Le liquide ambré se déverse en cascade dans la gorge usée du commissaire. Tout à coup, les violons s’accordent. C’est un orchestre qui se met en marche. Cette masse de calcaire, ce flic, se contorsionne de plaisir. La sueur émane de son front plissé. Ses synapses sont en ébullition, son sang court à toute vitesse dans ses veines, ses tempes palpites. Ses lèvres, immédiatement asséchées par l’alcool restent entrouvertes, elles en redemandent. Muettes, elles implorent. 
                        ******* (choix_consulter_dossier) Le dossier fait face à Ducray.
                            ******** Consulter le dossier. -> consulter_dossier
                    ****** Arrêter de boire.
                        -> rester_sobre_1
            **** (rester_sobre_1) Reste sobre.
                Ducray est déjà au fond du trou. Improbable que l'alcool l'aide à en sortir... -> choix_consulter_dossier
        *** Rester sobre.
            /* Ducray repose la bouteille en évidence. */ -> choix_consulter_dossier
    ** Le divorce.
        /* Il regarde le cadre photo devant lui, puis couche la photo pour ne plus avoir à la regarder*/ Cette pensée inspire à Ducray un profond malaise. Il en est même à préferer penser aux sordides histoires qui s'étalent sur son bureau. -> regarder_bureau
+ Passer un coup de fil.
    -> telephone_1

= telephone_1
/* Ducray se dirige vers le téléphone */
    * {!prefet_called} Appeler le préfet de police.
        ~prefet_called = true
        /* Son de tonalité. Puis quelqu'un décroche. */
        Allô ? Allô Monsieur le préfet ? Pardon de vous appeler si tard... /* Réponse du préfet */
        ** Inspecteur Ducray.
            Ducray.
        ** Devine.
            Pardon... Non non, c'est pas une blague. Oui, c'est moi. /* Le préfet a compris qui c'était. */ Celui-là même.
        -- Oui je sais, mais offrez-moi quelques minutes.
        ** Bientôt 3h...
            Pardon. Je bosse tard, vous savez.
        ** À peine minuit. (Mentir)
            Ah... Ok, je savais pas. Désolé. J'ai été trop pris par le boulot, j'imagine...
        -- C'est à propos de l'affaire... L'affaire Vasseur. Enfin... L'affaire De Fougerolles... Un élément important me semble avoir été trop longtemps ignoré.
        ** L'âge de la victime.
            Vingt-six ans. Euh... Ben je... /* Il ne sait oas quoi dire */ Ça fait jeune pour mourir, vous trouvez pas ? /* Le préfet raccroche. */ Allô ? Monsieur le préfet ?
        ** La couleur de ses cheveux.
            Blonde. En quoi c'est un détail important ? Elle portait une robe blanche... C'est quasi du ton sur ton, en terme de style c'est étrange, non ? /* Le préfet raccroche. */ Allô ? Monsieur le préfet ?
        ** Son haleine.
            ~colere = true
            Arthur Vasseur a déclaré avoir senti une légère odeur d'amande. Or, les gens qui prennent du cyanure exhalent une légère odeur d'amande. Je crois que c'est un indice capital dans l'affaire. /* Le préfet répond */ Comment ça, quelle affaire ?
            *** Un innocent a été exécuté.
                Non, je ne délire pas Monsieur le préfet. S'il-vous-plaît, écoutez... /* Le préfet raccroche. */ Allô ? Monsieur le préfet ?
            *** Le vrai coupable court toujours.
                Je ne sais pas encore... Peut-être.
                **** Arthur Vasseur. Le piscinier.
                    Oui, je sais qu'il a été exécuté. Oui... Je raconte n'importe quoi. Pardon, il est tard. Non, je n'ai pas bu... /* Le préfet raccroche. */ Allô ? Monsieur le préfet ?
                **** Sa famille. Une sombre histoire d'héritage.
                    La famille De Fougerolles possède une fortune colossale. Peut-être une histoire d'héritage, ou bien... /* Le préfet raccroche. */ Allô ? Monsieur le préfet ?
                **** Un meurtre politique.
                    Jade De Fougerolles était favorable aux mouvement sociaux. Ça n'a aucun sens qu'elle ait été tuée par un soit-disant militant radical. Il aurait eu mieux fait de tuer Émile De Fougerolles, le patriarche. Lui, pour le coup, est loin d'être un gauchiste... On l'imagine mal chanter des slogans en jouant du djembé... /* Le préfet raccroche. */ Allô ? Monsieur le préfet ?
                **** Je n'en sais rien...
                    Je ne sais pas, Monsieur le préfet. Je crois que c'est Socrate qui disait : "Je ne sais qu'une chose, c'est que je ne sais rien.". /* Le préfet raccroche. */ Allô ? Monsieur le préfet ?
            *** Il n'y a aucun coupable. Jade s'est suicidée.
                On sait qu'elle allait mal... Repensez à l'odeur d'amande... Le cyanure... J'ai la conviction qu'elle est allée elle-même prendre se baigner dans sa piscine, après avoir ingéré le poison. Elle s'est noyée en perdant connaissance. S'il vous-plaît, il faut ouvrir à nouveau l'enquête. /* Le préfet raccroche. */ Allô ? Monsieur le préfet ?
        ** Sa tenue.
            Personellement, ça ne me viendrait pas à l'idée de piquer une tête habillé en robe de soirée. /* Le préfet répond. */ Ce n'est pas un détail... Je pense qu'elle...
            *** ... a été assassinée.
                Oui, c'est la thèse retenue, je sais bien... Mais je le répète : Arthur Vasseur n'était pas le coupable. /* Le préfet raccroche. */ Allô ? Monsieur le préfet ?
            *** ... s'est donné la mort.
                On sait qu'elle allait mal... Repensez à l'odeur d'amande... Le cyanure... J'ai la conviction qu'elle est allée elle-même prendre se baigner dans sa piscine, après avoir ingéré le poison. Elle s'est noyée en perdant connaissance. S'il vous-plaît, il faut ouvrir à nouveau l'enquête. /* Le préfet raccroche. */ Allô ? Monsieur le préfet ?
        ** Les traces de blessures.
            C'est ça. Il n'y en a eu aucune. Pas de trace de lutte, rien. Vous ne trouvez pas ça étrange ? /* Le préfet répond. */ Oui, je sais que l'affaire est close depuis longtemps, mais... /* Le préfet raccroche. */ Allô ? Monsieur le préfet ?
        ** Je ne sais plus. Désolé de vous avoir dérangé. (Raccrocher)
        -- -> introduction
    * {!eve_called} Appeler Eve.
        ~eve_called = true
        /* Son de tonalité. Puis quelqu'un décroche. */ Allô ?
        ** Chérie ?
            Pardon, Eve. Tu m'entends ? /* Elle répond. */ Oui je sais...
        ** Eve ?
            Je sais que j'avais dit que j'appelerais plus, mais...
        ** Madame ?
        -- Oui, il est tard... Mais c'est important...
        ** Je voulais te parler de l'affaire.
            Je sais... Je dirais pas que c'est à cause d'elle qu'on en est là où on en est mais...
        ** Je voulais entendre ta voix.
            /* Silence pensant. */ Allô ? Eve ?
        -- Si j'ai bu ?
        ** Juste un verre.
            Pas plus.
        ** Moi ? Jamais.
            J'ai arrêté, tu sais...
        ** Je suis littéralement explosé.
            C'est pas un crime, si ?
        -- Allô ? Attends, ne raccroche pas encore. Une dernière chose...
        ** Je t'aime.
            Allô ? Eve ? /* Elle a raccroché */
        ** Tu m'aimes encore ?
            Allô ? Eve ? /* Elle a raccroché */
        ** Je peux parler à la petite ?
            Allô ? Eve ? L'heure ? Euh...
            *** Désolé, je ferai mieux d'aller me coucher moi aussi. -> introduction
            *** Elle est debout à cette heure-ci d'habitude, non ?
                Allô ? Eve ? /* Elle a raccroché */ -> introduction
        ** Non, c'est toi qui raccroche. (Faire de l'humour)
            Pardon... J'ai voulu faire de l'humour... Allô ? Eve ? /* Elle a raccroché */
        -- -> introduction
    * {!pizzeria_called} Commander une pizza.
        ~pizzeria_called = true
        /* On entend une tonalité. */ Contrairement à un commissariat, une pizzeria est fermée à des heures si tardives... La pepperoni attendra demain. -> introduction
    + Reposer le combiné.
        -> introduction



// SCENE DEUX //
== dossier_lu ==
Ducray gît derrière son bureau.
* {!alcool_is_visible} Ouvrir le carton sous le bureau.
    ~alcool_is_visible = true
    Ducray ouvre le carton sous le bureau. Il a fait ce geste mille fois, un million de fois. Au début, un sentiment de honte l'accompagnait. Plus maintenant. /*Il sort une bouteille d'alcool et la pose sur le bureau*/
    ** (servir_premier_verre) Se servir un verre.
        Ducray regarde autour de lui. Le seul récipient qu'il trouve est une tasse, à moitié pleine.
        *** Inspecter la tasse.
            Un mélange non identifié gît au fond de la tasse. Depuis combien de temps ? Il ne le sait pas.
            **** Jeter le liquide.
                /*Verse le liquide noir dans la poubelle et repose sa tasse sur le bureau.*/ Si Ducray voulait se tuer, il s'y prendrait autrement.
                ***** Se servir un verre.
                    -> premier_verre_2
                ***** Rester sobre.
                    -> rester_sobre_2
            **** Santé ! (Boire le liquide)
                /* Il boit la tasse */ L’entièreté de son corps se froisse. Il vient d’expérimenter avec beaucoup d’âpreté le baiser d’une fosse septique.
                ***** (premier_verre_2) Se servir un verre.
                    ~nb_drinks ++/* Ducray se sert un verre */ 
                    Le liquide ambré se déverse en cascade dans la gorge usée du commissaire. Tout à coup, les violons s’accordent. C’est un orchestre qui se met en marche. Cette masse de calcaire, ce flic, se contorsionne de plaisir. La sueur émane de son front plissé. Ses synapses sont en ébullition, son sang court à toute vitesse dans ses veines, ses tempes palpites. Ses lèvres, immédiatement asséchées par l’alcool restent entrouvertes, elles en redemandent. Muettes, elles implorent.  -> dossier_lu
                ***** Rester sobre.
                    -> rester_sobre_2
    ** (rester_sobre_2) Rester sobre.
        -> dossier_lu
+ {alcool_is_visible == true && nb_drinks == 0} Se servir un premier verre.
    -> premier_verre_2
+ {alcool_is_visible && nb_drinks == 1} Se resservir un verre.
    -> second_verre
+ {alcool_is_visible && nb_drinks == 2} Se resservir un verre.
    ~nb_drinks++
    -> dossier_lu
+ Passer un coup de fil.
    -> telephone_2
* {alcool_is_visible} Arroser la plante.
    -> arroser_plante
+ Faire de l'ordre dans le bureau (et dans sa tête).
    -> ranger_bureau
* Allumer le poste radio.
    -> allumer_radio
+ Faire une partie de mini-golf.
-> mini_golf
* {fenetre_ouverte} En finir. (Se défenestrer)
/* Ducray se dirige vers la fenêtre ouverte. Il hésite. */ Ducray, en regardant en bas, avait l'impression que ses problèmes diminuaient... Le grand saut n'est peut-être pas pour aujourd'hui, finalement... -> dossier_lu
+ {nb_drinks >= 3} Boire sérieusement. (Jusqu'à ce qu'il fasse tout noir)
-> alcool_final_message

= premier_verre_2
~nb_drinks ++ /* Ducray se sert un verre */

    Le liquide ambré se déverse en cascade dans la gorge usée du commissaire. Tout à coup, les violons s’accordent. C’est un orchestre qui se met en marche. Cette masse de calcaire, ce flic, se contorsionne de plaisir. La sueur émane de son front plissé. Ses synapses sont en ébullition, son sang court à toute vitesse dans ses veines, ses tempes palpites. Ses lèvres, immédiatement asséchées par l’alcool restent entrouvertes, elles en redemandent. Muettes, elles implorent.  -> dossier_lu

= ranger_bureau
* Aérer la pièce.
~fenetre_ouverte = true
/* Ducray ouvre la fenêtre du fond de la piece. */
* Rafraîchir la pièce.
/* Ducray allume le ventilateur de la piece. */
* Empiler les livres.
/* Ducray empile des livres. Ils tombent. */
* Ranger la chaise.
* Éteindre la lampe.
    Sans lampe, Ducray ne voit plus rien. Logique.
    ** Allumer la lampe à nouveau.
        Ducray dit : "Que la lumière soit", et la lumière fût.
        -> ranger_bureau
/* Ducray range la deuxième chaise. */
* Réagencer le bureau.
/* Ducray traine le bureau ailleurs. Il se pose pour regarder si c'est mieux, hésite. Le re-change de place. Hésite à nouveau mais semble convaincu. */ Réagencer le bureau à 3 heure du matin, en voilà une bonne idée.
* {colere} Faire de l'ordre dans les dossier. (De manière musclée)
    ~fenetre_ouverte = true
/* Ducray balance les dossier par terre.*/
+ Laisser tomber.
-> dossier_lu
- -> ranger_bureau

= mini_golf
/* Ducray froisse l'un de ses dossiers et en fait une boule de papier. */
+ Taper la boule de papier.
/* Ducray tape la boule de papier pour s'amuser. */
-> mini_golf
* {colere} Se servir du meuble comme d'une balle.
/* Ducray utilise le balais pour fracasser le meuble. */
-> mini_golf
+ Fini de s'amuser !
-> dossier_lu

= allumer_radio
/* Ducray allume la radio */ Peace Piece, Bill evans. C'était leur morceau préféré. Comme si Ducray n'était pas assez déprimé...
+ Couper le poste.
-> dossier_lu
* Danser tristement.
/* Ducray se met à danser */
    ** Couper le poste.
        -> dossier_lu

= second_verre
~nb_drinks ++
Le commissaire n’était pas en mesure d’imaginer que la seconde gorgée puisse être encore plus exaltante que la première. Cela dépasse largement les maigres capacités de son esprit fatigué. Tandis que sa vue s’embrume, tandis que ses genoux s’engourdissent, il se laisse transporter.
    * Se remettre au travail.
        -> dossier_lu
    * Un petit troisième.
        -> troisieme_verre

= troisieme_verre
~nb_drinks ++/* Ducray engloutit un nouveau verre. */ 
Ça fait du bien par où ça passe. -> dossier_lu

= telephone_2
/* Ducray se dirige vers le téléphone */
    * {!prefet_called} Appeler le préfet de police.
        ~prefet_called = true
        /* Son de tonalité. Puis quelqu'un décroche. */
        Allô ? Allô Monsieur le préfet ? Pardon de vous appeler si tard... /* Réponse du préfet */
        ** Inspecteur Ducray.
            Ducray.
        ** Devine.
            Pardon... Non non, c'est pas une blague. Oui, c'est moi. /* Le préfet a compris qui c'était. */ Celui-là même.
        -- Oui je sais, mais offrez-moi quelques minutes.
        ** Bientôt 3h...
            Pardon. Je bosse tard, vous savez.
        ** À peine minuit. (Mentir)
            Ah... Ok, je savais pas. Désolé. J'ai été trop pris par le boulot, j'imagine...
        -- C'est à propos de l'affaire... L'affaire Vasseur. Enfin... L'affaire De Fougerolles... Un élément important me semble avoir été trop longtemps ignoré.
        ** L'âge de la victime.
            Vingt-six ans. Euh... Ben je... /* Il ne sait oas quoi dire */ Ça fait jeune pour mourir, vous trouvez pas ? /* Le préfet raccroche. */ Allô ? Monsieur le préfet ?
        ** La couleur de ses cheveux.
            Blonde. En quoi c'est un détail important ? Elle portait une robe blanche... C'est quasi du ton sur ton, en terme de style c'est étrange, non ? /* Le préfet raccroche. */ Allô ? Monsieur le préfet ?
        ** Son haleine.
        ~colere = true
            Arthur Vasseur a déclaré avoir senti une légère odeur d'amande. Or, les gens qui prennent du cyanure exhalent une légère odeur d'amande. Je crois que c'est un indice capital dans l'affaire. /* Le préfet répond */ Comment ça, quelle affaire ?
            *** Un innocent a été exécuté.
                Non, je ne délire pas Monsieur le préfet. S'il-vous-plaît, écoutez... /* Le préfet raccroche. */ Allô ? Monsieur le préfet ?
            *** Le vrai coupable court toujours.
                Je ne sais pas encore... Peut-être.
                **** Arthur Vasseur. Le piscinier.
                    Oui, je sais qu'il a été exécuté. Oui... Je raconte n'importe quoi. Pardon, il est tard. Non, je n'ai pas bu... /* Le préfet raccroche. */ Allô ? Monsieur le préfet ?
                **** Sa famille. Une sombre histoire d'héritage.
                    La famille De Fougerolles possède une fortune colossale. Peut-être une histoire d'héritage, ou bien... /* Le préfet raccroche. */ Allô ? Monsieur le préfet ?
                **** Un meurtre politique.
                    Jade De Fougerolles était favorable aux mouvement sociaux. Ça n'a aucun sens qu'elle ait été tuée par un soit-disant militant radical. Il aurait eu mieux fait de tuer Émile De Fougerolles, le patriarche. Lui, pour le coup, est loin d'être un gauchiste... On l'imagine mal chanter des slogans en jouant du djembé... /* Le préfet raccroche. */ Allô ? Monsieur le préfet ?
                **** Je n'en sais rien...
                    Je ne sais pas, Monsieur le préfet. Je crois que c'est Socrate qui disait : "Je ne sais qu'une chose, c'est que je ne sais rien.". /* Le préfet raccroche. */ Allô ? Monsieur le préfet ?
            *** Il n'y a aucun coupable. Jade s'est suicidée.
                On sait qu'elle allait mal... Repensez à l'odeur d'amande... Le cyanure... J'ai la conviction qu'elle est allée elle-même prendre se baigner dans sa piscine, après avoir ingéré le poison. Elle s'est noyée en perdant connaissance. S'il vous-plaît, il faut ouvrir à nouveau l'enquête. /* Le préfet raccroche. */ Allô ? Monsieur le préfet ?
        ** Sa tenue.
            Personellement, ça ne me viendrait pas à l'idée de piquer une tête habillé en robe de soirée. /* Le préfet répond. */ Ce n'est pas un détail... Je pense qu'elle...
            *** ... a été assassinée.
                Oui, c'est la thèse retenue, je sais bien... Mais je le répète : Arthur Vasseur n'était pas le coupable. /* Le préfet raccroche. */ Allô ? Monsieur le préfet ?
            *** ... s'est donné la mort.
                On sait qu'elle allait mal... Repensez à l'odeur d'amande... Le cyanure... J'ai la conviction qu'elle est allée elle-même prendre se baigner dans sa piscine, après avoir ingéré le poison. Elle s'est noyée en perdant connaissance. S'il vous-plaît, il faut ouvrir à nouveau l'enquête. /* Le préfet raccroche. */ Allô ? Monsieur le préfet ?
        ** Les traces de blessures.
            C'est ça. Il n'y en a eu aucune. Pas de trace de lutte, rien. Vous ne trouvez pas ça étrange ? /* Le préfet répond. */ Oui, je sais que l'affaire est close depuis longtemps, mais... /* Le préfet raccroche. */ Allô ? Monsieur le préfet ?
        ** Je ne sais plus. Désolé de vous avoir dérangé. (Raccrocher)
        -- -> dossier_lu
    * {!eve_called} Appeler Eve.
        ~eve_called = true
        /* Son de tonalité. Puis quelqu'un décroche. */ Allô ?
        ** Chérie ?
            Pardon, Eve. Tu m'entends ? /* Elle répond. */ Oui je sais...
        ** Eve ?
            Je sais que j'avais dit que j'appelerais plus, mais...
        ** Madame ?
        -- Oui, il est tard... Mais c'est important...
        ** Je voulais te parler de l'affaire.
            Je sais... Je dirais pas que c'est à cause d'elle qu'on en est là où on en est mais...
        ** Je voulais entendre ta voix.
            /* Silence pensant. */ Allô ? Eve ?
        -- Si j'ai bu ?
        ** Juste un verre.
            Pas plus.
        ** Moi ? Jamais.
            J'ai arrêté, tu sais...
        ** Je suis littéralement explosé.
            C'est pas un crime, si ?
        -- Allô ? Attends, ne raccroche pas encore. Une dernière chose...
        ** Je t'aime.
            Allô ? Eve ? /* Elle a raccroché */
        ** Tu m'aimes encore ?
            Allô ? Eve ? /* Elle a raccroché */
        ** Je peux parler à la petite ?
            Allô ? Eve ? L'heure ? Euh...
            *** Désolé, je ferai mieux d'aller me coucher moi aussi. -> dossier_lu
            *** Elle est debout à cette heure-ci d'habitude, non ?
                Allô ? Eve ? /* Elle a raccroché */ -> dossier_lu
        ** Non, c'est toi qui raccroche. (Faire de l'humour)
            Pardon... J'ai voulu faire de l'humour... Allô ? Eve ? /* Elle a raccroché */
        -- -> dossier_lu
    * {!pizzeria_called} Commander une pizza.
        ~pizzeria_called = true
        /* On entend une tonalité. */ Contrairement à un commissariat, une pizzeria est fermée à des heures si tardives... La pepperoni attendra demain. -> dossier_lu
    + Reposer le combiné.
        -> dossier_lu

= arroser_plante
/* Ducray arrose la plante avec la bouteille d'alcool. */ -> dossier_lu

= alcool_final_message
Si Ducray continue de boire, il n'y aurait pas de retour en arrière. Sa nuit va s'arrêter. Ou commencer, selon comment on voit les choses... Il hésite...
    + Cesser de boire.
        -> dossier_lu
    + Je veux que tout s'éteigne. (Boire jusqu'à s'éffondrer)
        -> alcool_final
= alcool_final
+ {nb_drinks < 6} Boire.
~nb_drinks ++
-> alcool_final
+ {nb_drinks < 6} Boire.
~nb_drinks ++
-> alcool_final
+ {nb_drinks < 6} Boire.
~nb_drinks ++
-> alcool_final
+ {nb_drinks >= 6} Sombrer. -> grand_final

= grand_final
/* Ducray s'endort. Rideau. Coup de téléphone qui retentit. Le rideau s'ouvre à nouveau. Ducray dort. La sonnerie finit par le réveiller. Un téléphone pend devant lui. Peut-être qu'une personne est assise sur la chaise (en mode chaise électrique). Ducray décroche le téléphone pendu. La personne assise décroche l'autre téléphone.*/
* Décrocher.  #DMX /1 100 #DMX /3 255 true
    ** Allô ?
        Qu’est c’que tu veux ?
        *** Tu me hantes.
            Tu es si seul là bas que tu reviens dans mon monde pour me hanter ?
        *** Ne pas se laisser culpabiliser.
            Tu l’as encore en travers de la gorge ?
    ** Il est tard pour appeler les gens.
        Pourquoi tu t’ramènes toujours au pire moment ?
        *** Pas envie de parler ce soir.
             J’ai vraiment pas envie d’te causer. Maintenant va et marche, où que tu sois.
        *** Tu m'emmerdes.
            C’est prodigieux que tu parviennes à me faire chier en étant aussi loin.
    -- Enfin bon...
    ** Je suis désolé.
        Tu sais, j’suis désolé que tu ais reçu pareil traitement. Cette histoire c’est mon rocher de Sisyphe. En ruinant ta vie, je me suis condamné à tenter tant bien que mal de réparer l’irréparable. J’espère que de là où t’es tu peux m’pardonner.
        *** J'essaye de laver ton honneur.
            Non mais je sais c’que tu penses ! Tu penses que j’essaye juste de sauver mon image. Mais j’me saigne jour et nuit pour que l’histoire ne se souvienne pas de toi comme d’une ordure.
        *** Je souffre...
            L'abîme de souffrances qui compose ma vie ne cesse d’engloutir tout ce qui m’entoure.
    ** L'odeur d'amande.
        Je n’ai pas oublié l’amande, je ne l’oublie jamais, j’y pense tout le temps. J’peux même plus mettre de lait d’amande dans mon café, il me sort par les yeux.
        *** Tous des incompétents.
            Tous ces enfoirés déploient un effort phénoménal pour ignorer ce détail. Le climat politique n’y est pas favorable. Des années qu’il ne l’a pas été.
        *** Je devrais en finir.
            Le cyanure... le cyanure... ça règlerait bon nombre de mes problèmes...
    -- Je n’ai plus envie de t’écouter, plus personne, plus jamais.
/* Ducray attrape son manteau et s'en va. */
-> END
