VAR despair = 0
VAR alcool_is_visible = false
VAR nb_drinks = 0
VAR files_on_ground = false
VAR cup_is_already_full = true

// Le jeu démarre sur une introduction présentant la pièce, ainsi que les props qui sont disponibles immédiatement.
-> introduction

== introduction ==
{Il règne sur le commissariat un silence pesant. Une énorme pile de dossiers couvre presque entièrement ce qui fût un jour un bureau. Ducray est assis derrière, pensif. Absent. | Ducray gît derrière ce qu'il lui reste de bureau.}

* {alcool_is_visible} Se servir un verre.
    Ducray se sert un verre. -> introduction
//* {nb_drinks == 1} Se resservir un verre.
//* {nb_drinks == 2} Un petit troisième pour la route.

* {introduction == 1} Bâiller. #audio yawn-choice
    Ducray se met à bâiller exagérément. Si quelqu'un d'autre avait été présent, il aurait sans doute bâillé à son tour. Mais il n'y a personne. 
    -> introduction
* Regarder l'heure. #audio intro-voice
    À en juger par le silence qui règne au commissariat, il est tard. À cette heure de la nuit, on ne trouve plus que ceux qui bossent trop, et ceux qui ne bossent pas assez. Difficile de dire à quelle catégorie le commissaire Ducray appartient. /*Il regarde l'horloge*/ Il jette un oeil sur l'horloge. Il devrait être rentré depuis longtemps. 02h51. À ce stade, c'est plutôt l'heure qui vous regarde que l'inverse. L'heure vous juge.
    ** Laisser tomber.
        -> introduction
    ** (duel_horloge) Affronter le regard de l'horloge.
        Face au regard de l'horloge, pas question de baisser les yeux. Sans trop savoir pourquoi, Ducray resta planté un moment, à fixer l'heure. À la juger en retour.
        *** Jeter l'éponge.
            ~despair ++
            Après un long moment, Ducray dût bien admettre sa défaite. Une de plus. Voilà bien longtemps que le commissaire n'avait pas connu de victoire. À bien y réfléchir, sa vie n'avait été qu'une succession de défaite. La dernière victoire à laquelle il pouvait se raccrocher remontait à l'école primaire, lorsqu'il avait remporté une médaille d'argent à la natation.
            **** (medaille_argent) La médaille d'argent.
                Même cette vitoire avait un goût amer. In n'éprouvait aucun plaisir à y repenser. À cause de la piscine, sans doute...
                ~despair ++
            **** Refouler le souvenir.
                /*Il inspire fort*/ Une grande inspiration et le souvenir est déjà loin.
            ---- -> introduction
 * (regarder_bureau) Poser son regard sur le bureau.
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
                La photo présente une femme, habillée d'une robe de cocktail noire, allongée sur le bord d'une piscine. Elle est trempée jusqu'aux os. Sa robe lui colle à la peau. Son corps, blanc comme la craie. La femme n'a jamais été prise en photo dans la piscine dans laquelle elle s'est noyée. Au moment de l'arrivée de la police, le corps avait déja été tiré hors de l'eau. -> consulter_dossier
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
                        Elle était richissime. Il était pauvre. Pourtant, personne n'a jamais pensé qu'il ait pu en vouloir à son argent. D'autant que rien n'a été dérobé. En revanche... Il était politisé. Encarté. MTS.
                        ******* (MTS) Le MTS.
                            Le Mouvement des Travailleurs et Travailleuses Solidaires. Un mouvement citoyen sans représentants, très à gauche de l'échiquier politique. Naît lors des premières grèves générales, il n'a cessé de prendre de l'ampleur avec la montée des mouvements sociaux. -> details_suspects_suite
                ****** {CHOICE_COUNT() <= 3} Poursuivre la lecture du dossier. -> consulter_dossier
            **** (rapport_autopsie) Le rapport d'autopsie.
                {Un rapport d'autopsie. Ou plutôt : un simulacre d'autopsie. Tout est allé très vite. La demande venait d'en haut. L'histoire faisait déjà beaucoup trop de bruit... |}
                ***** Lire le rapport d'autopsie.
                    Jade est morte entre 18h30 et 19h00. Autrement dit, elle a pu mourir avant qu'Arthur ne la trouve, autant que de ses mains. Aucune analyse toxicologique n'a été requise. L'affaire a été expédiée. Présence d'eau dans les poumons. Noyade avérée. À part ça, aucune trace de lutte. Pas de contusions, pas de marques ni blessure. Un corps parfait. Neuf. Celui d'une personne qui n'a jamais eu à l'user. Un corps de riche. -> consulter_dossier
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
                            ... Sauf si vous êtes un flic alcoolique, en instance de divorce, et qui a potentiellement envoyé un innocent à la chaise électrique, bien entendu.
                        ------ (meurtre_politique) Arthur Vasseur. Celui-là même qui a découvert le corps. Quand la presse a divulgué son appartenance au MTS, la classe politique s'est emballée. Un meurtre politique. Un prolétaire noie de sang froid une richissime rentière. Jade de Fougerolles était vêtue d'une robe de cocktail. Difficile de croire à la thèse de la noyade accidentelle.
                        ******* {!MTS} Le MTS.
                            Le Mouvement des Travailleurs et Travailleuses Solidaires. Un mouvement citoyen sans représentants, très à gauche de l'échiquier politique. Naît lors des premières grèves générales, il n'a cessé de prendre de l'ampleur avec la montée des mouvements sociaux. -> meurtre_politique
                        ******* Un accident ?
                            La police, tout comme la presse, ont très vite écarté cette possibilité : au moment de sa mort, la victime était vêtue d'une robe de cocktail. Aller piquer une tête en robe de soirée, c'est tout de même... étrange. Pourtant...
                            ******** (these_empoisonnement) Pourtant ?
                            Pourtant, Ducray ne croit pas à la thèse du meurtre. Les médias ont fait de Jade de Fougerolles une représentante de la classe dominante - ce qu'elle était. Mais ils n'ont pas fait grand bruit du fait qu'elle était également une figure militante favorable à la classe ouvrière. Au point de s'attirer les foudres de sa famille. Pourquoi Arthur l'aurait-il choisi elle comme victime ? Tout ça n'a aucun sens... Et puis, il y a cette odeur d'amande. 
                            ********* L'odeur d'amande.
                                Quand une personne ingère du cyanure, son haleine exhale un léger parfum d'amande. Jade n'a pas été noyée, elle a été empoisonnée.
                            ********** Un meurtre politique.
                                Peut-être. Les activités militantes de Jade étaient mal vues de tout un tas de personne, à commencer par sa propre famille, qui règne sur un véritable empire financier, érigé sur la sueur des prolétaire de tout le pays.
                            ********** Un meurtre famillial.
                                Possible. Jade, par ses actions politiques, mettait sa famille dans l'embarras. Une famille très puissante, et très riche. Jade devenait gênante pour les affaires...
                            ********** Un suicide.
                                C'est la thèse à laquelle Ducray veut croire. Il l'imagine ingérer du cyanure puis décider d'aller prendre un dernier bain. Se laisser mourir paisiblement, bercée par le mouvement de l'eau. Jade serait morte noyée, incapable de nagée suite aux effets du poison. Ça expliquerait la robe de soirée : personne n'aurait l'idée de se suicider en bikini.
                            ---------- -> refermer_dossier
                    ****** La folie.
                        ~despair ++
                        En effet, il faut être fou pour se torturer avec un détail si minuscule, depuis plus d'un an. Lorsque Arthur a prodigué à la victime les premiers soins, il a précisé avoir senti une légère odeur d'amande. -> odeur_amande
    ** (ouvrir_tiroir_1) Ouvrir le tiroir du bureau.
        ~alcool_is_visible = true
        Ducray ouvre le tiroir du bureau. Il a fait ce geste mille fois, un million de fois. Au début, un sentiment de honte l'accompagnait. Plus maintenant. /*Il sort une bouteille d'alcool et la pose sur le bureau*/
        *** Se servir un verre.
            Ducray regarde autour de lui. Le seul récipient qu'il trouve est une tasse, à moitié pleine.
            **** Inspecter la tasse.
                Un mélange non identifié gît au fond de la tasse. Depuis combien de temps ? Il ne le sait pas.
                ***** Jeter le liquide.
                    /*Verse le liquide noir dans la poubelle et repose sa tasse sur le bureau.*/
                    ****** Se servir un verre.
                        -> premier_verre
                    ****** Rester sobre.
                        -> rester_sobre_1
                ***** Santé ! (Boire le liquide)
                    /* Il boit la tasse */ L’entièreté de son corps se froisse. Il vient d’expérimenter avec beaucoup d’âpreté le baiser d’une fosse septique.
                    ****** (premier_verre) Se servir un verre.
                        /* Ducray se sert un verre */ Le liquide ambré se déverse en cascade dans la gorge usée du commissaire. Tout à coup, les violons s’accordent, c’est un orchestre qui se met en marche. Cette masse de calcaire, ce flic, se contorsionne de plaisir, la sueur émane de son front plissé. Ses synapses sont en ébullition, son sang court à toute vitesse dans ses veines, ses tempes palpites. Ses lèvres, immédiatement asséchées par l’alcool restent entrouvertes, elles en redemandent. Muettes, elles implorent. -> consulter_dossier
                    ****** Rester sobre.
                        -> rester_sobre_1
            **** (rester_sobre_1) Reste sobre.
                Ducray est déjà au fond du trou. Improbable que l'alcool l'aide à en sortir... -> consulter_dossier
        *** Rester sobre.
            /* Ducray repose la bouteille en évidence. */ -> consulter_dossier
    ** Le divorce.
        /* Il regarde le cadre photo devant lui, puis couche la photo pour ne plus avoir à la regarder*/ Cette pensée inspire à Ducray un profond malaise. Il en est même à préferer penser aux sordides histoires qui s'étalent sur son bureau. -> regarder_bureau
    = refermer_dossier
    * Refermer le dossier.
    * Envoyer valser le dossier.
        ~files_on_ground = true
    - -> dossier_lu
    
    == dossier_lu ==
    -> END
    //* {~files_on_ground: nnn } /* Ducray envoie valser ses dossier sur le sol. */ hhh
    //* {alcool_is_visible = false} (ouvrir_tiroir_2) Ouvrir le tiroir du bureau.
    -> END
