-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-05-2025 a las 18:25:35
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `documentos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `animes`
--

CREATE TABLE `animes` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` text NOT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  `portada` varchar(255) DEFAULT NULL,
  `estado` enum('En emisión','Finalizado','Próximamente') DEFAULT NULL,
  `proximo_episodio` date DEFAULT NULL,
  `fecha_emision` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `animes`
--

INSERT INTO `animes` (`id`, `nombre`, `descripcion`, `imagen`, `portada`, `estado`, `proximo_episodio`, `fecha_emision`) VALUES
(3, 'Code Geass', ' Nos situamos en una realidad alternativa, donde el Imperio de Britania ha conquistado prácticamente todo el planeta. A los países subyugados bajo su poder opresor les ha arrebatado la libertad, los derechos e incluso el nombre. Área 11, ésa es la denominación que ahora tienen los japoneses. Allí, un joven llamado Lelouch comenzará su rebelión, el día en que por casualidad se topa con la misteriosa C.C., quien le concede un poder peculiar: El Geass, el poder de la absoluta obediencia. Basta con cruzar su mirada con la de su objetivo para que éste cumpla cualquier orden que Lelouch realice, sea cual sea, aunque signifique su propia destrucción.', 'uploads/animes/680437b52e1b0_cc1.jpg', 'uploads/animes/680437b52eb82_cc2.jpg', 'Finalizado', NULL, NULL),
(4, 'Overlord', 'La historia da comienzo cuando Yggdrasil, un popular juego online, es cerrado un día sin previo aviso. Sin embargo, el protagonista, Momonga, decide no salir del juego. Momonga así se transforma y se convierte en “el mago más poderoso”. El mundo sigue cambiando con él dentro, y los NPCs comienzan a sentir emociones. Sin familia, amigos ni lugar en la sociedad, Momonga tendrá que luchar por adaptarse al nuevo mundo en el que se ha convertido el juego.', 'uploads/animes/68057f6d18198_ov.jpg', '', 'Finalizado', NULL, NULL),
(7, 'Overlord II', 'Segunda temporada de Overlord.', 'uploads/animes/68059d2c7713a_ov2.jpg', 'uploads/animes/68059d2c77c4e_2856.jpg', 'Finalizado', NULL, NULL),
(8, 'Cyberpunk: Edgerunners', 'En una distopía plagada de corrupción e implantes cibernéticos, un chico prodigioso pero temerario trata de convertirse en un mercenario proscrito: un \'edgerunner\'.', 'uploads/animes/6806f35a02aa9_dd.jpg', '', 'En emisión', NULL, NULL),
(9, 'Mushoku Tensei: Isekai Ittara Honki Dasu', 'Asesinado mientras salvaba unos estudiantes que serían atropellados por un camión, un NEET de 34 años reencarna en un nuevo mundo de magia bajo el nombre de Rudeus Greyrat, un recién nacido. Con conocimiento, experiencia y arrepentimientos de una vida pasada, Rudeus jura llevar una vida plena y no volver a repetir sus errores. Ahora, dotado con un tremendo poder mágico, así como la mentalidad de un hombre adulto, Rudeus es visto como un genio en potencia por sus nuevos padres. Pronto, se verá siendo entrenado por poderosos guerreros, como su padre, un espadachín y una maga llamada Roxy Migurdia. Pero a pesar de su inocente exterior, Rudeus sigue siendo un otaku pervertido, y usa sus vastos conocimientos para hacer suyas a las mujeres que en su vida anterior nunca disfrutó.', 'uploads/animes/6806f3b7ec302_mm.jpg', '', 'Finalizado', NULL, NULL),
(10, 'Kimi no Koto ga Daidaidaidaidaisuki na 100-nin no Kanojo', 'A Rentaro Aijo lo rechazaron 100 veces hasta que terminó secundaria. Desesperado, visita un santuario para rezar por tener más suerte en su nueva fase como estudiante y poder conseguirse una novia. Es entonces cuando aparece ante él el Dios del Amor y le da una buena noticia: conocerá a su alma gemela en la preparatoria, ¡y no solo a una, sino a 100! Pero hay una trampa: si conoce a su alma gemela, deberán acabar juntos y amarse mutuamente, porque de lo contrario, ¡la chica morirá! ¿Qué hará Rentaro con sus 100 novias en preparatoria?', 'uploads/animes/6806f59310893_kk.jpg', '', 'Finalizado', NULL, NULL),
(11, 'Ore dake Level Up na Ken', 'Lo que no te mata te hace más fuerte, pero en el caso de Sung Jinwoo, lo que lo mató lo hizo más fuerte. Después de ser brutalmente asesinado por monstruos en una mazmorra de alto rango, Jinwoo regresó con el Sistema, un programa que solo él puede ver y que eleva su nivel en todos los sentidos. Ahora, está decidido a descubrir los secretos detrás de sus poderes y la mazmorra que los engendró.', 'uploads/animes/6806f737578ce_hh.jpg', '', 'Finalizado', NULL, NULL),
(12, 'Blue Lock', 'Tras una desastrosa derrota en la Copa Mundial de 2018, el equipo japonés está pasando por un mal momento. ¿Qué es lo que les falta? Un delantero que sea el mejor, alguien que pueda guiarles hasta la victoria. La federación japonesa está decidida a crear un jugador con una sed de gol única, alguien \"egoísta\" con el balón, un jugador que pueda ser capaz de dar la vuelta a un partido que está por perderse... Y para ello reúnen a 300 de las mejores jóvenes promesas de Japón. ¿Quién resultará el elegido como futuro líder del equipo? ¿Quién será capaz de plantar cara con su fuerza y su ego a cualquiera que se ponga en su camino? ¿Quién erá ese jugador más egoísta que nadie?', 'uploads/animes/6806f78695dd2_bb.jpg', '', 'Finalizado', NULL, NULL),
(14, 'Spy x Family', 'Todo el mundo tiene una parte de sí mismos que no puede mostrar a los demás. En una era en la que las naciones de todo el mundo se encuentran involucradas en una feroz guerra de información a puerta cerrada, Ostania y Westalis llevan décadas en guerra fría. La División de Inteligencia de Westalis (WISE) envía a su mejor espía, \"Twilight\", en una misión ultrasecreta para vigilar los movimientos de Donovan Desmond, quien dirige el Partido Nacional por la Unidad de Ostania, responsable de bombardear los esfuerzos de paz entre ambos países. La misión tiene por nombre \"Operación Strix\". La idea es \"crear una familia en una semana para infiltrarse en las reuniones sociales organizadas por la escuela de élite a la que asiste el hijo de Desmond\". Twilight adopta la identidad del psiquiatra Loid Forger y comienza a buscar miembros para su familia, pero Anya, la hija que adopta, resulta tener la capacidad para leer las mentes a los demás, mientras que su esposa, Yor, es una asesina. Todos mantendrán estos en secreto, pero comenzarán una vida juntos en la que deberán ocultarse sus identidades unos a otros. La paz del mundo está ahora en manos de esta nueva familia mientras se embarcan en una aventura repleta de sorpresas.', 'uploads/animes/6806f9efa2714_3618.jpg', '', 'Finalizado', NULL, NULL),
(15, 'Tensei shitara Slime Datta Ken', 'Satoru Mikami es un hombre de 37 años que tiene un trabajo que no le gusta, sin salida y que no es feliz con la vida que lleva, pero cuando muere a manos de un ladrón y piensa que es su fin, se despierta descubriendo que se ha reencarnado en un mundo de magia y espada… ¡pero como un slime! Ahora tendrá que acostumbrarse a su nueva vida, aunque por suerte contará con dos habilidades únicas que le ayudarán a sobrevivir: una que le proporciona una gran comprensión de todo lo que le rodea, y otra que le permite copiar las habilidades de sus oponentes.', 'uploads/animes/6806fab01b7a4_3016.jpg', 'uploads/animes/6806fab01ba19_3016 (1).jpg', 'Finalizado', NULL, NULL),
(16, 'Youkoso Jitsuryoku Shijou Shugi no Kyoushitsu e ', 'La historia tiene lugar en Koudo Ikusei, la escuela de prestigio por excelencia que cuenta con instalaciones de última generación en las que casi el 100% de los alumnos pueden ir a la universidad y encontrar trabajo. En ella los estudiantes tienen la libertad de llevar el peinado que quieran y de traer todos los efectos personales que deseen. Koudo Ikusei es una escuela paradisíaca, pero lo cierto es que sólo los alumnos “superiores” son bien tratados. El protagonista Kiyotaka Ayanokouji pertenece a la Clase-D, aquella en la sólo están los estudiantes “inferiores” que son ridiculizados por el resto de la escuela. Por alguna razón, Kiyotaka se despistó en sus exámenes de ingreso y terminó ahí. Sin embargo, después de conocer a Suzune Horikita y Kikyou Kushida, otros dos estudiantes de su misma clase, la situación de Kiyotaka comienza a cambiar.', 'uploads/animes/6806fb8644dc3_2782.jpg', 'uploads/animes/6806fb8645053_2782 (1).jpg', 'Finalizado', NULL, NULL),
(17, 'Kage no Jitsuryokusha ni Naritakute!', 'Grandes héroes y diabólicos villanos son el tipo de personajes que la gente anhela ser, pero este no es el caso de Cid Kagenou. Él aspira a convertirse en la mente maestra detrás de todo, moviendo los hilos y haciendo que sus maquinaciones impulsen toda la historia. En su vida anterior en Japón no pudo lograr sus objetivos, pero ahora, renacido en un mundo de magia, ¡mostrará la verdadera eminencia de la sombra! Mientras Cid finge ser solo otro personaje de relleno, recluta a miembros de su (falsa) organización “Shadow Garden”, con el objetivo de acabar con un misterioso culto que acecha en las sombras. Su (falsa) organización contra el asqueroso (pero sorpresivamente real) Culto de Diabolos.', 'uploads/animes/6806fc5206351_3690.jpg', '', 'Finalizado', NULL, NULL),
(18, 'Tokyo Revengers', 'Mientras miraba las noticias, Takemichi Hanagaki se entera de que su novia de secundaria, Hinata Tachibana, ha muerto. La única chica que alguna vez se fijó en él fue asesinada por un grupo de criminales conocidos como la Banda Tokyo Manji. Takemichi vive en un viejo departamento con delgadas paredes, y en su trabajo, su jefa seis años menor que él lo trata como basura. Para rematar, es un completo virgen… En la cúspide de la miseria de su vida, de repente vuelve en el tiempo doce años a sus días de secundaria. Para salvar a Hinata y cambiar el curso del tiempo, ¡el alguna vez inútil trabajador de medio tiempo Takemichi deberá buscar volverse el líder de la banda criminal más tenebrosa de Tokio!', 'uploads/animes/6806fce7ec539_3465.jpg', '', 'Finalizado', NULL, NULL),
(20, 'Watashi no Oshi wa Akuyaku Reijou.', 'El mundo de una trabajadora corporativa se pone patas arriba cuando un día despierta siendo Rae Taylor, la protagonista de su juego otome favorito, Revolution. Rae esta eufótica ante la oportunidad de cortejar a Claire François, la villana del juego y por quien siente un profundo amor. Armada con sus conocimientos del juego y de los eventos que están por suceder, Rae se propone hacer que Claire se enamore de ella. Pero ¿cómo se tomará la villana los embites románticos de Rae?', 'uploads/animes/6806fea989c56_3871.jpg', '', 'Finalizado', NULL, NULL),
(21, 'Oshi No Ko', 'La chica de 16 años, Ai Hoshino, es una talentosa y hermosa idol que es adorada por sus fanáticos. Ella es la personificación de la pureza, pero no todo lo que brilla es oro… Gorou Honda es un ginecólogo de una zona rural y gran fanático de Ai. Entonces, cuando la idol embarazada se presenta en su hospital, está más que desconcertado. Gorou le promete un parto seguro, pero poco sabe él que un encuentro con una misteriosa figura resultaría en su muerte prematura, o eso pensaba. Al abrir sus ojos, Gorou se encuentra en el regazo de su amada idol y descubre que ha renacido como Aquamarine Hoshino, ¡el hijo recién nacido de Ai! Con su mundo vuelto al revés, Gorou pronto descubre que el mundo del espectáculo está lleno de espinas, y que el talento no siempre genera éxito. ¿Podrá proteger la sonrisa de su amada idol?', 'uploads/animes/68070021805ff_3808.jpg', '', 'Finalizado', NULL, NULL),
(22, 'Boku no Kokoro no Yabai Yatsu', 'Kyotaro Ichikawa puede parecer el típico estudiante de secundaria, pero en su corazón sueña con el asesinato. Por ello, no es de extrañar que la persona que más desea matar nunca esté lejos de su mente: la ídolo de la clase, Anna Yamada. Leyendo a solas en la biblioteca de su querida escuela, empieza a encontrarse sin querer con Yamada, que viene a atiborrarse en secreto de sus queridos caramelos y dulces. A través de sus interacciones, Ichikawa descubre lo tonta que es Yamada, y no puede evitar apoyarla desde la barrera. Mientras tanto, la propia Yamada no puede evitar burlarse implacablemente de Ichikawa debido a sus reacciones atolondradas. Gracias a una serie de interacciones cotidianas muy conmovedoras, el vínculo distante entre ambos se convierte en algo más que simples conocidos de biblioteca. Tal vez, con el tiempo, Ichikawa llegue a darse cuenta de que sus deseos asesinos se han convertido en algo totalmente distinto.', 'uploads/animes/6807011f9b880_3770.jpg', '', 'Finalizado', NULL, NULL),
(23, 'Maou Gakuin no Futekigousha', ' A pesar de su apetito por la destrucción, ¡incluso los reyes demonio se cansan de la sangre y el caos en algunas veces! Cuando Anoth reencarna con la esperanza de una vida más pacífica, termina yendo a una escuela con sus descendientes en su viejo castillo 2,000 años después. Pero con la magia desapareciendo en esta nueva era, y Anoth conservando la suya, ¡¿quién podrá hacerle frente?!', 'uploads/animes/6807019789e99_3321.jpg', '', 'Finalizado', NULL, NULL),
(24, 'Chainsaw Man', 'Denji es un adolescente que vive con un demonio motosierra llamado Pochita. Debido a la deuda que dejó su padre, ha estado viviendo una vida por los suelos mientras paga su deuda recolectando cadáveres de demonios con Pochita. Un día, Denji es traicionado y asesinado. A medida que su conciencia se desvanece, hace un contrato con Pochita y revive como \"Chainsaw Man\", un hombre con un corazón de diablo.', 'uploads/animes/680701ddd5e58_3707.jpg', '', 'Finalizado', NULL, NULL),
(25, 'Bocchi the Rock!', 'Hitori es una chica muy introvertida e incapaz de relacionarse socialmente. Sin embargo, ama la música y su sueño es formar una banda y ser famosa. Un día, mientras iba con su guitarra, se encuentra con una chica que necesita una guitarrista para tocar urgentemente en una banda. A partir de aquí, Hitori tendrá que superar sus miedos para poder alcanzar su sueño.', 'uploads/animes/6807022d16715_3700.jpg', '', 'Finalizado', NULL, NULL),
(26, 'Dungeon ni Deai wo Motomeru no wa Machigatteiru Darou ka', 'Comúnmente conocido como el “Calabozo”, la ciudad de Orario posee bajo tierra un enorme laberinto. Su extraño nombre provoca emoción, ilusiones de honor, y esperanzas de un romance con una bella chica. En esta ciudad de sueños y deseos, el aventurero Bell Cranel tiene su predestinado encuentro con la pequeña diosa Hestia. Así comienza la historia de un chico dando todo para ser el mejor aventurero y de una solitaria diosa buscando seguidores, ambos esperando lograr sus metas y tal vez, tener un pequeño romance.', 'uploads/animes/680702918a53f_1887.jpg', '', 'Finalizado', NULL, NULL),
(27, 'Sword Art Online', 'Escapar es imposible hasta terminar el juego; un game over significaría una verdadera \"muerte\". Sin saber la \"verdad\" de la siguiente generación del Multijugador Masivo Online, \'Sword Art Online(SAO)\', con 10 mil usuarios unidos juntos abriendo las cortinas para esta cruel batalla a muerte. Participando solo en SAO, el protagonista Kirito ha aceptado inmediatamente la \"verdad\" de este MMO. <br/><br/> Y, en el mundo del juego, un gigante castillo flotante llamado \'Aincrad\', Kirito se distinguió a si mismo como un jugador solitario. Apuntando a terminar el juego al alcanzar la planta mas alta el solo continua avanzando arriesgadamente hasta que recibe una invitación a la fuerza de una guerrera y esgrimista experta, Asuna, con la cual tendra que hacer equipo.', 'uploads/animes/680702e11d6ff_825.jpg', '', 'Finalizado', NULL, NULL),
(28, 'Yofukashi no Uta', 'Kou Yamori parece el típico estudiante de secundaria en la superficie. Relativamente bueno en los estudios y amable con sus compañeros, se esfuerza mucho por mantener esta fachada. Un día, sin embargo, decide dejar de fingir y abandona la escuela, desarrollando insomnio como resultado de no tener una salida diurna para su energía. Cuando sale a pasear solo por la noche, se siente ligeramente mejor, aunque es consciente de que su incapacidad para dormir debería considerarse un problema grave. En uno de esos paseos, Kou conoce a una extraña chica, Nazuna Nanakusa, que le diagnostica la causa de su insomnio: a pesar de haber hecho cambios en su vida, sigue impidiéndole experimentar la verdadera libertad. Ella le dice que no podrá dormir si no está satisfecho con la forma en que pasa sus horas de vigilia. Cuando parece que ha resuelto sus preocupaciones actuales, Nazuna le invita a su apartamento para compartir su futón. Después de un rato, sin saber que él solo finge estar inconsciente, se inclina sobre él y le muerde el cuello.', 'uploads/animes/6807031ca226a_3652.jpg', '', 'Finalizado', NULL, NULL),
(29, 'Lycoris Recoil', '“LycoReco” es un café con un toque tradicional japonés ubicado en el centro de Tokio. ¡Pero el delicioso café y azucarados postres no son los únicos pedidos que acepta este café! Desde la entrega de paquetes, las recogidas y devoluciones en las solitarias calles nocturnas ¡¿Hasta zombis y exterminio de monstruos gigantes...?! Cualquiera que sea su problema, ¡estamos aquí para ayudarlo! ¡Resolveremos cualquier tipo de \"problema\" que pueda tener!', 'uploads/animes/680703a16cde9_3633.jpg', '', 'Finalizado', NULL, NULL),
(30, 'Date a LIve', 'Itsuka Shidou es un estudiante de instituto que, durante las vacaciones, vive en primera persona un suceso sin igual. Ante él aparece una chica con armadura, que destruye la ciudad que tiene delante. La chica responde ante el nombre de Tooka, y según la hermana de Shidou, es un espíritu (?seirei?, &#31934;&#38666;), los cuales causaron un terremoto espacio-temporal 30 años atrás. La hermana de Shidou revela que su verdadera identidad es la de la líder de la organización Ratatosk y le cuenta a Shidou que la única manera que tienen de salvar el mundo es hacer que Tooka se acabe enamorando de él y tengan una cita.', 'uploads/animes/6807041dc7999_977.jpg', 'uploads/animes/6807041dc7d29_977 (1).jpg', 'Finalizado', NULL, NULL),
(31, 'Tomodachi Game', 'Katagiri Yuuichi cree que los amigos son más importantes que el dinero, pero también conoce las dificultades de no tener suficientes fondos. Se esfuerza por ahorrar para poder ir al viaje del instituto, porque ha prometido a sus cuatro mejores amigos que irán todos juntos. Sin embargo, después de reunir todo el dinero de la clase, ¡se lo roban! Las sospechas recaen sobre dos amigos de Yuuichi, Sawaragi Shiho y Shibe Makoto. Poco después, los cinco son secuestrados y se despiertan en una extraña habitación con un personaje de un anime antiguo. Al parecer, uno de ellos los ha introducido en un “juego de amistad” para hacerse cargo de su enorme deuda. Pero, ¿quién era y por qué tenían semejante deuda? ¿Podrían haber robado el dinero de la clase para pagar la entrada en el juego? Yuuichi y sus mejores amigos tendrán que triunfar en juegos psicológicos que pondrán a prueba o destruirán su fe en los demás.', 'uploads/animes/6807047f3c234_3597.jpg', '', 'Finalizado', NULL, NULL),
(32, 'Otome Game Sekai wa Mob ni Kibishii Sekai desu', ' Leon, un antiguo oficinista japonés, ha reencarnado dentro del mundo de un juego otome, y se desespera al darse cuenta de que en este mundo las mujeres dominan sobre los hombres. Era como si los hombres fueran solamente peldaños en el éxito de las mujeres de este mundo, siendo las únicas excepciones los intereses románticos de la protagonista del juego, un grupo de hermosos hombres liderados por el príncipe heredero de un reino. En estas bizarras circunstancias, Leon tiene una sola arma: su conocimiento de su vida anterior, en donde su descarada hermana lo obligó a completar este mismo juego. Leon, quien realmente solo buscaba llevar una vida en el campo, comienza a utilizar este conocimiento para provocar una feroz revolución contra las mujeres y los hombres elegidos. Las cortinas se abren para una emocionante historia.', 'uploads/animes/680704cb2a62e_3595.jpg', '', 'Finalizado', NULL, NULL),
(33, 'Horimiya', 'Aunque admirada en la escuela por su amabilidad y destreza académica, la estudiante de preparatoria Kyouko Hori ha estado escondiendo otro lado de ella. Con sus padres a menudo fuera de casa debido al trabajo, Hori tiene que cuidar de su hermano menor y hacer las tareas del hogar, sin tener tiempo para socializar fuera de la escuela. Mientras tanto, Izumi Miyamura es visto como un inquietante otaku que usa anteojos. Sin embargo, en realidad es una persona amable e inepta para estudiar. Además, tiene nueve piercings escondidos detrás de su largo cabello, y un tatuaje a lo largo de su espalda y hombro izquierdo. Por pura casualidad, Hori y Miyamura se cruzan fuera de la escuela, ninguno luciendo como el otro lo esperaría. Estos polos aparentemente opuestos se convierten en amigos, compartiendo un lado que nunca le han mostrado a nadie.', 'uploads/animes/6807062ada8e0_3406.jpg', '', 'Finalizado', NULL, NULL),
(34, 'Shinchou Yuusha: Kono Yuusha ga Ore Tueee Kuse ni Shinchou Sugiru', 'La historia da comienzo cuando la diosa Rista invoca a un héroe para ayudarle en su mundo, el cual parece un videojuego de gran dificultad. El protagonista, Seiya, es excepcional en prácticamente todo, pero también es excesivamente cauto. Hace cosas como comprar tres sets de armadura (uno para usar, uno de repuesto, y otro de repuesto para el de repuesto) y no contenerse en absoluto ni siquiera contra un triste limo, por si acaso.', 'uploads/animes/6807072543729_3188.jpg', '', 'Finalizado', NULL, NULL),
(35, 'Arifureta Shokugyou de Sekai Saikyou', 'Hajime Nagumo es un otaku promedio de diecisiete años. Sin embargo, su vida cambia totalmente cuando él y el resto de su clase, son convocado a un mundo de fantasía. Son tratados como héroes y tienen la tarea de salvar a la raza humana de la extinción total. Pero lo que debería haber sido el sueño húmedo de cualquier otaku rápidamente se convierte en una pesadilla. Mientras que el resto de su clase es bendecido con poderes divinos, Hajime es un Synergist, que solo tiene una sola habilidad de transmutación. Ridiculizado y acosado por sus compañeros de clase por ser débil, pronto se encuentra en la desesperación. ¿Será capaz de sobrevivir en este peligroso mundo de monstruos y demonios?', 'uploads/animes/68070793e1a7c_3166.jpg', '', 'Finalizado', NULL, NULL),
(37, 'Akudama Drive', ' En esta historia, hace mucho tiempo las regiones de Kanto y Kansai tuvieron una guerra que dividió el mundo. Pero al final de la guerra, Kansai perdió y juró lealtad a Kanto. No obstante, el gobierno y la fuerza policial de Kansai no aceptaron la derrota, por lo que el crimen dominó la región. A estos criminales se les conoce como “Akudama”…', 'uploads/animes/681011ee48530_3364.jpg', '', 'Finalizado', NULL, NULL),
(38, 'Jigokuraku', '“Gabimaru el Hueco”, un ninja de la Aldea Iwagakure conocido por su fría actitud, se encuentra ahora en el corredor de la muerte. Cansado de la muerte y la traición, busca morir. No obstante, ningún método de ejecución parece funcionar en él debido a que Gabimaru, aunque no lo admite, aún tiene una razón para vivir. Él quiere volver a su hogar y ver a su esposa, la razón de su felicidad y por la que su trabajo como asesino comenzó a estorbarle. Por lo tanto, se niega a morir. Asaemon la ejecutora, una famosa asesina de criminales, nota esto y le da una propuesta al ninja. Ella quiere que Gabimaru se una a una expedición a una isla al sur de Japón en la búsqueda del elixir de la vida, y a cambio le perdonará todos sus crímenes. No obstante, esta isla no es un lugar normal: se cree que es el paraíso.', 'uploads/animes/681012357d5f6_3767.jpg', '', 'Finalizado', NULL, NULL),
(39, 'Kimetsu no Yaiba', 'Estamos en la era Taisho de Japón. Tanjiro, un joven que se gana la vida vendiendo carbón, descubre un día que su familia ha sido asesinada por un demonio. Para empeorar las cosas, su hermana menor Nezuko, la única superviviente de la masacre, ha sufrido una transformación en demonio. Destrozado por los acontecimientos Tanjiro decide convertirse en un cazador de demonios para poder devolver a su hermana a la normalidad y matar al demonio que masacró a su familia.', 'uploads/animes/681013bbdf6d9_3118.jpg', '', 'Finalizado', NULL, NULL),
(40, 'Sono Bisque Doll wa Koi wo Suru ', ' Gojo es un estudiante de preparatoria/instituto que quiere convertirse en kashiragi, un maestro del tradicional arte de crear muñecas Hina. Aunque adora ese arte, no sabe nada de las últimas tendencias y eso hace que le cueste encajar con sus compañeros de clase. Los más populares de la clase, en especial una chica llamada Marin Kitagawa, parecen creer que él vive en un mundo aparte. Todo esto cambia por completo un día cuando Marin comparte un secreto inesperado con él y hace que sus dos mundos coincidan.', 'uploads/animes/681015032ef86_3568.jpg', '', 'Finalizado', NULL, NULL),
(41, 'Ousama Ranking', 'La historia se centra en Bojji, un débil y sordo príncipe que no puede sostener incluso una espada para niños. Como el primogénito, sostiene su enorme deseo de convertirse en el más poderoso rey del mundo. No obstante, las personas a su alrededor se refieren despectivamente a él y no tienen intención alguna de aceptarlo como rey. Bojji consigue su primer amigo, llamado Kage (sombra), literalmente una sombra en el suelo que de alguna manera puede entender a Bojji. De hecho, Kage es un sobreviviente del clan de asesinos “Kage” que fue eliminado, por lo que ya no es un asesino y sobrevive robando. La historia seguirá a Bojji haciendo su propio camino hacia su deseo.', 'uploads/animes/68101531655ad_3550.jpg', '', 'Finalizado', NULL, NULL),
(42, 'Vinland Saga', 'Thorfinn, hijo de uno de los guerreros más grandes de los vikingos, se encuentra entre los mejores luchadores de la alegre banda de mercenarios dirigida por el astuto Askeladd. Sin embargo, Thorfinn no es parte del grupo por el saqueo que implica, en cambio, por haber causado una gran tragedia a su familia, el chico ha prometido matar a Askeladd en un duelo justo. Thorfinn pasa su niñez con la tripulación mercenaria, perfeccionando sus habilidades en el campo de batalla entre los daneses, donde matar es solo otro placer de la vida. Un día, cuando Askeladd recibe noticias de que el príncipe danés Canute ha sido tomado como rehén, trama un ambicioso plan: uno que decidirá al próximo rey de Inglaterra y alterará drásticamente las vidas de Thorfinn, Canute y la suya. Situada en el siglo XI en Europa, Vinland Saga cuenta una sangrienta epopeya en una era donde la violencia, la locura y la injusticia son ineludibles, proporcionando un paraíso para el infierno enloquecido por las batallas y el resto de quienes viven en él.', 'uploads/animes/681017080f6eb_3162.jpg', '', 'Finalizado', NULL, NULL),
(43, 'Mashle', ' Este es un mundo de magia. Este es un mundo en el que todos usan la magia habitualmente. En un bosque profundo y oscuro de este mundo de magia, hay un chico que se ejercita a diario. Su nombre es Mash Burnedead y tiene un secreto: no puede usar magia. Lo único que quería era vivir tranquilo con su familia, pero cuando un día intentan matarlo por no poder usar magia, las cosas se salen de control y acaba inscrito en una escuela mágica, donde su objetivo será convertirse en el \"Iluminado Divino\", el alumno más formidable, el elegido de Dios. ¿Podrán sus poderosos músculos derrotar a los más brillantes usuarios de magia? ¡Se alza el telón de esta historia de magia y fantasía peculiar en el que la fuerza puede con la magia!', 'uploads/animes/681017438e1b0_3790.jpg', '', 'Finalizado', NULL, NULL),
(44, 'Kusuriya no Hitorigoto', 'Maomao llevaba una vida tranquila ayudando a su padre, un boticario. Todo cambia el día que la venden como sirvienta al palacio del emperador, pero la vida entre nobles y realeza no es para ella. Cuando la familia imperial enferma, ella decide intervenir para encontrar una cura, lo que llama la atención de Jinshi, un guapo oficial de palacio que decide ascenderla como dama de compañía de una de las concubinas del emperador. ¡Su habilidad con la medicina la hará conocida en el palacio por ayudar a resolver muchos misterios!', 'uploads/animes/6810178c66e1b_3909.jpg', '', 'En emisión', NULL, NULL),
(45, 'Zom 100: Zombie ni Naru made ni Shitai 100 no Koto', 'Akira ve cómo una empresa explotadora le absorbe por completo la vida. Mientras tanto, cuando su ciudad es azotada repentinamente por un apocalipsis zombi, encuentra un nuevo sentido a la vida.', 'uploads/animes/681017ca992b0_3846.jpg', '', 'Finalizado', NULL, NULL),
(46, 'Re:Zero kara Hajimeru Isekai Seikatsu', ' En la historia, Subaru Natsuki es un estudiante corriente de instituto que se pierde en un mundo alternativo, donde una preciosa chica de pelo plateado lo rescata. Para devolverle el favor decide quedarse con ella, pero el destino con el que carga la muchacha es mucho más pesado de lo que Subaru puede imaginar. Los enemigos atacan sin descanso, uno tras otro, hasta que finalmente mueren tanto él como la chica. Es entonces cuando Subaru descubre que tiene el poder de dar marcha atrás en el tiempo y volver al inicio de la historia, al punto en el que llegó al mundo desconocido. El problema es que él es el único que recuerda lo ocurrido.', 'uploads/animes/6810188715b98_2433.jpg', 'uploads/animes/6810188715e2b_2433 (1).jpg', 'Finalizado', NULL, NULL),
(47, 'Sousou no Frieren', 'La maga Frieren formaba parte del grupo del héroe Himmel, quienes derrotaron al Rey Demonio tras un viaje de 10 años y devolvieron la paz al reino. Frieren es una elfa de más de mil años de vida, así que al despedirse de Himmel y sus compañeros promete que regresará para verlos y parte de viaje sola. Al cabo de cincuenta años, Frieren cumple su promesa y acude a visitar a Himmel y al resto. Aunque ella no ha cambiado, Himmel y los demás han envejecido y están en el final de sus vidas. Cuando Himmel muere, Frieren se arrepiente de no haber pasado más tiempo a su lado conociéndolo, así que emprende un viaje para conocer mejor a sus antiguos compañeros, a las personas y descubrir más del mundo.', 'uploads/animes/681018c9d18ea_3859.jpg', '', 'Finalizado', NULL, NULL),
(48, 'Shangri-La Frontier: Kusoge Hunter, Kamige ni Idoman to su', ' \"¿Cuándo fue la última vez que jugué un juego que no fuera una basura?\" Este es un mundo en el futuro cercano donde los juegos que usan pantallas se consideran retro, y muchos juegos de realidad virtual no llegan a un mínimo de calidad: son los llamados \"juegos basura\". A aquellos que dedican sus vidas a completar estos juegos se les llama \"cazadores de juegos basura\", y Rakuro Hizutome es uno de ellos. El juego que ha elegido abordar a continuación es Shangri-La Frontier, un juego que goza de una gran crítica y más de 30 millones de jugadores. ¡La mejor historia de aventuras escrita por el jugador más fuerte de \"juegos basura\" está a punto de comenzar!', 'uploads/animes/6810191f30497_3865.jpg', '', 'Finalizado', NULL, NULL),
(49, 'Undead Unluck', 'Tras leer la conclusión de su serie de manga favorita, Fuuko Izumo se siente finalmente preparada para poner fin a su existencia. Durante los últimos 10 años, Fuuko se ha visto afectada por una condición que trae consigo una desgracia extrema para cualquiera que la toque. Esto ha tenido un efecto drástico en su entorno, e incluso ha provocado inadvertidamente la muerte de quienes la rodean, incluidos sus padres. Mientras se encuentra en un puente sobre las vías del tren, Fuuko es tocada por un extraño hombre, lo que hace que se rompa la base y lo deje caer frente a un tren que se aproxima. Sin embargo, cuando Fuuko encuentra el cadáver del hombre, descubre que su cuerpo se está regenerando y que vuelve a la vida. El hombre, al que Fuuko llama Andy, es inmortal y, como ella, también desea la muerte. Al principio, Fuuko se muestra reticente, pero finalmente decide formar un equipo con Andy para darle la mejor muerte posible; pero una misteriosa organización acecha en las sombras, esperando aprovecharse de las extrañas habilidades del dúo.', 'uploads/animes/681019633b69c_3891.jpg', '', 'Finalizado', NULL, NULL),
(50, 'Another', 'La historia se centra en una clase maldita y en los hilos del destino que llevan a todos los alumnos y alumnas de la misma hasta a la muerte. Hacía 26 años iba a esa clase una chica llamada Misaki. Buena deportista, popular, caía bien a todo el mundo, las mejores notas? pero un día murió dejando un vacío enorme en sus compañeros de clases. Estos, decididos a no olvidarla, siguieron actuando como si Misaki siguiera viva hasta la graduación. Años después, en primavera de 1998, un chico llamado Koichi Sakakibara es transferido a esa clase para no tardar en darse cuenta de que hay algo raro ahí, especialmente con esa tal Misaki que siempre ve al fondo de clase dibujando sola y que lleva un parche.', 'uploads/animes/681019b4a4793_727.jpg', 'uploads/animes/681019b4a4beb_727.jpg', 'Finalizado', NULL, NULL),
(51, 'Tokyo Ghoul', ' Extraños asesinatos se están sucediendo uno tras otro en Tokyo. Debido a las pruebas encontradas en las escenas, la policía concluye que los ataques son obra de ghouls que se comen a las personas. Kaneki y Hide, dos compañeros de clase, llegan a la conclusión de que si nadie ha visto nunca a esos necrófagos es porque toman la apariencia de seres humanos para ocultarse. Poco sabían entonces de que su teoría sería más cierta de lo que pensaban cuando Kaneki es herido de gravedad por un monstruo y comienza a atraerle cada vez más la carne humana…', 'uploads/animes/68101a265f8a0_1415.jpg', 'uploads/animes/68101a265fb1f_1415 (1).jpg', 'Finalizado', NULL, NULL),
(52, 'Edens Zero', 'La vida de Shiki como el único humano que habita el planeta Granbell, un enorme parque de diversiones controlado por robots, se ve alterada con la llegada de Rebecca y su gato Happy. Tras huir juntos debido a una rebelión de robots, emprenden un viaje interestelar plagado de aventuras para buscar a Mother, una entidad femenina colosal que conoce toda la verdad sobre el poderoso Shiki.', 'uploads/animes/68101a611bd00_3464.jpg', '', 'Finalizado', NULL, NULL),
(53, 'Summertime Render', 'Después de la muerte de sus padres, Shinpei Ajiro vivió con las hermanas Kofune, Mio y Ushio, pero desde entonces se mudó a vivir solo a Tokio. Pero después de que Ushio se ahoga mientras intenta salvar a la joven Shiori Kobayakawa, regresa a casa para llorar su partida. Sin embargo, los moretones alrededor del cuello de Ushio ponen en duda la causa de su muerte. Dando un paso atrás, Shinpei se convence de que debe haber otra explicación. Entidades peligrosas deambulan entre los isleños, y una visión del difunto Ushio le pide que \"salve a Mio\" como su pedido final. Está seguro de que algo está pasando, y la muerte de Ushio es solo una pieza del rompecabezas.', 'uploads/animes/68101b98d7462_summertime-render.jpg', '', 'Finalizado', NULL, NULL),
(54, 'Hataraku Maou-sama!', ' El rey demonio llamado Sadao está a un paso de conquistar su mundo alternativo cuando se transporta al Tokyo de nuestro mundo. Él termina trabajando a tiempo parcial en un restaurante de comida rápida a fin de mes. Con el fin de conquistar Japón, tiene que dar el primer paso y pasar de un empleado temporal a un empleado completo. Mientras tanto, la heroína Emilia llegó a Japón también, en persecución de Sadao.', 'uploads/animes/68101c9906b39_986 (1).jpg', 'uploads/animes/68101c9906f07_986.jpg', 'Finalizado', NULL, NULL),
(55, 'Kumo Desu ga, Nani ka?', 'El mundo donde el Héroe y el Rey Demonio continúan oponiéndose el uno al otro. La gran magia del Héroe y el Rey Demonio cruzan mundos y explotan en el aula de una cierta escuela secundaria. Los estudiantes que murieron en la explosión reencarnarán en un mundo diferente. La protagonista, que tiene la reputación más baja de la clase, reencarnó en una araña. Sin embargo, ella se adaptó rápidamente a la condición presente con gran fuerza de voluntad. Esta es una historia de una araña intentando todo lo que puede para sobrevivir.', 'uploads/animes/68101cf0543bb_3397.jpg', 'uploads/animes/68101cf05478f_3397 (1).jpg', 'Finalizado', NULL, NULL),
(56, 'Yesterday wo Utatte', ' Después de la universidad, Rikuo Uozumi, un niño sin mucha ambición en la vida, toma un trabajo en una tienda de conveniencia. Los días pasan sin incidentes para Rikuo hasta que conoce a su ex novia y compañera de clase, pero especialmente gracias a la inusual Haru Nonaka y su mascota cuervo ...', 'uploads/animes/68101d8306827_3294.jpg', 'uploads/animes/68101d8306cae_3294 (1).jpg', 'Finalizado', NULL, NULL),
(57, 'Iseleve', ' Yuuya Tenjou ha sido un niño acosado desde el pasado. Vive en la casa de su querido abuelo mientras va a la escuela. Como es habitual, recibe un duro acoso, y se toma una larga ausencia de la escuela para tener algo de tiempo para curar sus heridas. Durante este largo tiempo de ausencia, aprovecha para limpiar la casa de su abuelo y va a una habitación a la que nunca había ido, donde su abuelo guardaba muchos objetos diferentes que recogía de sus viajes por el mundo. Mientras ordenaba los objetos, encuentra una puerta que no está en una pared entre los objetos. Por curiosidad abre esta puerta, lo que encontró al otro lado fue…', 'uploads/animes/68101e6682799_3779.jpg', '', 'Finalizado', NULL, NULL),
(58, 'Kenja no Mago', 'La historia empieza cuando un poderoso brujo y sabio, que salvó al mundo de la calamidad en numerosas ocasiones, se encuentra un bebé al que adopta y nombra como Shin. El bebé es en realidad un hombre de nuestro mundo reencarnado en el mundo del sabio. Este cria a Shin lejos de la sociedad y le enseña los entresijos de la magia. Una vez cumple los 15 años, el joven emprende su propio viaje pero el sabio se acuerda entonces que se ha olvidado de enseñarle sobre el sentido común y la forma en que funciona la vida. Así pues, sin experiencia ninguna con las relaciones personales, Shin llega a la capital del reino de Alsheid para apuntarse a la academia de magia.', 'uploads/animes/68101e9cc8cd8_3134.jpg', '', 'Finalizado', NULL, NULL),
(59, 'Honzuki no Gekokujou: Shisho ni Naru Tame ni wa Shudan wo Erandeiraremasen', ' Motosu Urano, una estudiante universitaria amante de los libros que acaba de obtener su certificación de Bibliotecaria y se suponía que debía ingresar al trabajo de sus sueños después de la graduación, fue asesinada durante un terremoto masivo que la aplastó debajo de una pila de su propia colección masiva de libros. Deseando reencarnarse para leer aún más, se reencarnó en un mundo con un bajo nivel de alfabetización y muy pocos libros, limitados solo a la nobleza del mundo. Mientras se reencarnaba como la hija de 5 años de un humilde soldado, Maine, no importa cuánto quiera leer, no hay forma de que haya libros. Si no hay libros, ¿qué haces? Los haces tú mismo, por supuesto ... Cuál es su objetivo, convertirse en bibliotecaria sin importar qué, y vivir una vida rodeada de libros. Para empezar, ella comienza a hacerlos.', 'uploads/animes/68101f0d2a444_3186.jpg', 'uploads/animes/68101f0d2a693_3186 (1).jpg', 'Finalizado', NULL, NULL),
(60, 'Dumbbell Nan Kilo Moteru?', 'La protagonista de la historia es Hibiki Sakura, una estudiante de preparatoria que adora comer, y Akemi Soryuin, la preciosa y carismática presidenta del consejo que es una fetichista de los músculos. El día que a Hibiki le preguntan si ha vuelto a ganar peso, decide ponerse en dieta absoluta y adelgazar durante el verano, así que se apunta a un gimnasio donde se encuentra con la presidenta, quien la introduce en el apasionante mundo del levantamiento de pesas.', 'uploads/animes/6810209c83b6f_3149.jpg', '', 'Finalizado', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `anime_generos`
--

CREATE TABLE `anime_generos` (
  `anime_id` int(11) NOT NULL,
  `genero_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `anime_generos`
--

INSERT INTO `anime_generos` (`anime_id`, `genero_id`) VALUES
(3, 1),
(3, 6),
(3, 11),
(3, 16),
(3, 28),
(3, 32),
(4, 1),
(4, 2),
(4, 5),
(4, 8),
(4, 34),
(4, 35),
(7, 2),
(7, 5),
(7, 8),
(7, 34),
(7, 35),
(8, 1),
(8, 6),
(9, 4),
(9, 5),
(9, 34),
(10, 3),
(10, 7),
(10, 11),
(10, 21),
(10, 41),
(11, 1),
(11, 2),
(11, 5),
(12, 15),
(14, 1),
(14, 3),
(14, 13),
(15, 5),
(16, 3),
(16, 7),
(16, 11),
(17, 1),
(17, 3),
(17, 5),
(18, 1),
(18, 4),
(18, 11),
(18, 13),
(20, 3),
(20, 5),
(20, 11),
(20, 44),
(21, 4),
(21, 8),
(21, 12),
(22, 3),
(22, 11),
(22, 13),
(23, 5),
(23, 11),
(23, 34),
(24, 1),
(24, 8),
(25, 3),
(25, 17),
(25, 24),
(26, 1),
(26, 2),
(26, 3),
(26, 5),
(26, 7),
(27, 1),
(27, 2),
(27, 5),
(27, 7),
(27, 35),
(28, 7),
(28, 8),
(28, 13),
(28, 26),
(29, 1),
(29, 6),
(30, 3),
(30, 6),
(30, 7),
(30, 11),
(30, 16),
(30, 21),
(31, 13),
(31, 23),
(31, 35),
(32, 5),
(32, 7),
(32, 11),
(32, 21),
(33, 3),
(33, 7),
(33, 11),
(33, 13),
(33, 24),
(34, 1),
(34, 2),
(34, 3),
(34, 5),
(35, 1),
(35, 2),
(35, 5),
(35, 21),
(37, 1),
(37, 6),
(38, 1),
(38, 5),
(38, 13),
(38, 31),
(39, 1),
(39, 8),
(39, 13),
(39, 31),
(39, 38),
(40, 7),
(40, 11),
(40, 24),
(41, 2),
(41, 3),
(41, 5),
(41, 12),
(41, 31),
(42, 1),
(42, 2),
(42, 4),
(42, 12),
(42, 31),
(43, 1),
(43, 3),
(43, 5),
(43, 11),
(43, 13),
(43, 41),
(44, 4),
(44, 9),
(44, 31),
(45, 1),
(45, 3),
(45, 8),
(45, 10),
(46, 4),
(46, 5),
(46, 23),
(46, 43),
(47, 2),
(47, 4),
(47, 5),
(47, 13),
(48, 1),
(48, 2),
(48, 5),
(48, 13),
(49, 1),
(49, 3),
(49, 8),
(49, 13),
(49, 28),
(50, 8),
(50, 9),
(50, 10),
(50, 11),
(50, 43),
(51, 1),
(51, 4),
(51, 8),
(51, 9),
(51, 10),
(51, 12),
(51, 23),
(52, 1),
(52, 2),
(52, 3),
(52, 5),
(52, 6),
(52, 13),
(53, 8),
(53, 9),
(54, 3),
(54, 5),
(54, 13),
(54, 38),
(55, 2),
(55, 3),
(55, 5),
(56, 4),
(56, 7),
(56, 12),
(56, 24),
(57, 1),
(57, 2),
(57, 5),
(57, 11),
(58, 1),
(58, 3),
(58, 5),
(58, 34),
(59, 5),
(59, 24),
(60, 3),
(60, 39);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `episodios`
--

CREATE TABLE `episodios` (
  `id` int(11) NOT NULL,
  `id_anime` int(11) NOT NULL,
  `numero_episodio` int(11) NOT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `embed_code` text DEFAULT NULL,
  `fecha_publicacion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `episodios`
--

INSERT INTO `episodios` (`id`, `id_anime`, `numero_episodio`, `titulo`, `embed_code`, `fecha_publicacion`) VALUES
(1, 3, 1, NULL, '<iframe src=\"https://mega.nz/embed/v7x0yQIT#w1JQYgKPaLP_YDeh9zbfHE6S9vH1yxoZk20ctGEQj5Y\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(2, 3, 2, NULL, '<iframe src=\"https://mega.nz/embed/v7x0yQIT#w1JQYgKPaLP_YDeh9zbfHE6S9vH1yxoZk20ctGEQj5Y\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(3, 3, 3, NULL, '<iframe src=\"https://mega.nz/embed/S6xCyYiS#SxsJ_OqJS6xYQVm45ntW0tenZ-QB1pmOSlXI--f3l4I\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(4, 3, 4, NULL, '<iframe src=\"https://mega.nz/embed/27hC3QST#ITfx1cnIne9Kyp3ZXisNBhIjxFjhpf3JlCEmRjxhRVU\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(5, 3, 5, NULL, '<iframe src=\"https://mega.nz/embed/67xGHCJQ#ZrTWxMnkwsa5Y3PhWEeulmQ7fWl1lf7WlfZDxvcBsFw\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(6, 3, 6, NULL, '<iframe src=\"https://mega.nz/embed/e7Yx2QiK#fsHW5YYSjsZCsjrpe-KtbOb33Kpo6vUpvwJQqtuJeeg\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(7, 3, 7, NULL, '<iframe src=\"https://mega.nz/embed/27IBWKAD#b-h8qqg2Hg1zcKHebF0vIYbsBGPXk2jg2LGa03nkYUo\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(8, 3, 8, NULL, '<iframe src=\"https://mega.nz/embed/T6IVTCzT#WyeYUrZGQOlTxJPGs-Z84OUnr9xXfyukuev5QMwVlzE\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(9, 3, 9, NULL, '<iframe src=\"https://mega.nz/embed/m6J1GAaA#nl0OWVTa95jomCQoHZL7ibPQaetnz7r8Uh3KNXyoAaM\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(10, 3, 10, NULL, '<iframe src=\"https://mega.nz/embed/rrIzxCqT#MCgAT2JlI-MYwVSjPTBGDtpLQjqv3V_rANols2u-n6Q\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(11, 3, 11, NULL, '<iframe src=\"https://mega.nz/embed/W6RX0arA#ceL8R9NrNCPTlfqhYxHNfrttxvU_3VAyti71mKHYLq8\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(12, 3, 12, NULL, '<iframe src=\"https://mega.nz/embed/fqBHSSRT#B8igjlHZlhFsM16S7YiiifQv68XXIKrZnismYNp1rAU\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(13, 4, 1, NULL, '<iframe src=\"https://mega.nz/embed/gIhigQjY#HrNnYcCzS4IZaK0OROhkEXoJKaWaJqWtt1b3GszhMR0\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(14, 4, 2, NULL, '<iframe src=\"https://mega.nz/embed/Qd5kWabQ#79vJhQpVVW62etY4jkpNpUgZvToq66cTqVSaGCyHhYM\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(15, 4, 3, NULL, '<iframe src=\"https://mega.nz/embed/MUwWzIgC#zkUmXTIYTgpjbExw81PpvUvaV7BnPVmbctTVHo6uRBc\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(16, 4, 4, NULL, '<iframe src=\"https://mega.nz/embed/sFxyDKaI#O3J5yRHGUA7t5Rt6nP_MqhBoDInxyLBehFGis02EDmg\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(17, 4, 5, NULL, '<iframe src=\"https://mega.nz/embed/FVoERYgD#MiXm_Opm6z3ssUDI5KTU5HX2hzkEEeHZw1ZPPMDw8Vo\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(18, 4, 6, NULL, '<iframe src=\"https://mega.nz/embed/QV5yUIST#onCy4DWOuy5O2Is--YH0wOaZg8kB0ZHG8pIXxITmu8o\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(19, 4, 7, NULL, '<iframe src=\"https://mega.nz/embed/MIgmgKiL#ollMGBOVuRmpnr399ZUHbxnah7Tt17Wt7NIazxoL7uE\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(20, 4, 8, NULL, '<iframe src=\"https://mega.nz/embed/wUoADKhT#gNcTxkol2EjAq-P21urW47bUBr0FCWhoQQRIDV1mZyM\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(21, 4, 9, NULL, '<iframe src=\"https://mega.nz/embed/gNxwVIDJ#r2m6iL0Xfz7uIP8ntFs0eUYLmeG00cnInVzUKsbj9kA\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(22, 4, 10, NULL, '<iframe src=\"https://mega.nz/embed/TIUz1IRb#cSzC5HfG2DD4jUNmNpfmw5of3D8EuGHGCL4RdZCRjes\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(23, 4, 11, NULL, '<iframe src=\"https://mega.nz/embed/AVh2HapR#DceVPkwigcyJZst81_9p3UNrqnixzdyw03zdirjOCas\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(24, 4, 12, NULL, '<iframe src=\"https://mega.nz/embed/MQpgQaCC#Z_EiNfAudKOvi4bLIWYSEO7UQ9CvbH5ITf7e3B5xoM4\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(25, 4, 13, NULL, '<iframe src=\"https://mega.nz/embed/VApgSAZI#7hiTwym4QIrP1VsJVYEV-7_R0ZFKTXNUDufHBapi87k\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(26, 7, 1, NULL, '<iframe src=\"https://mega.nz/embed/ezhSTK4L#srQLnKgdvNE43BU3HeEsT4dlSlDZ2bX9flp3mPNslno\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(27, 7, 1, NULL, '<iframe src=\"https://mega.nz/embed/ezhSTK4L#srQLnKgdvNE43BU3HeEsT4dlSlDZ2bX9flp3mPNslno\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(28, 7, 2, NULL, '<iframe src=\"https://mega.nz/embed/gIlzSYxb#lz2Hmc-8LRE35V6g6wI86Noje7V8N7HxJYFlOxYkOZ8\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(29, 7, 3, NULL, '<iframe src=\"https://mega.nz/embed/jn5yhAzR#LXFKxF-GdHGoaCHZj6pxscCG7rPVILcPXM1FS_9czEA\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>\r\n', NULL),
(30, 7, 4, NULL, '<iframe src=\"https://mega.nz/embed/ejwkxIAC#NHXDbWBVW_aeSltomF8xKJLlOx2RHRGRziaFuXyBrF0\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(31, 7, 5, NULL, '<iframe src=\"https://mega.nz/embed/Sj5ShCLI#hs59n76yqxmPhz-2TPLY6jDnc8vMGlIW9gLzuhUKbYc\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(32, 7, 6, NULL, '<iframe src=\"https://mega.nz/embed/2zxiGKxT#yFPbNgIz8HC1ECynUx7fn7i-Nb9AiicgK-fp4GdC2c4\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(33, 7, 7, NULL, '<iframe src=\"https://mega.nz/embed/Kipk2YbJ#Joe2tOgvCGlQdkfMFWQhBlIbVD5EIYK6gnCXd3ojTDM\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(34, 7, 8, NULL, '<iframe src=\"https://mega.nz/embed/H7oWwYSC#BckdW8n3XGY9FXLBWC9kzrvCvn4cC9yFwD9iZdpUcIk\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(35, 7, 9, NULL, '<iframe src=\"https://mega.nz/embed/SnwiySAB#uCbWUNxXdGPCXI-fFi68I7wLlr80fhE65xJGoj-lq48\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(36, 7, 10, NULL, '<iframe src=\"https://mega.nz/embed/SvpkFCRT#FnDokLtle88i07YhsVYRQ5DrIFBIG8kGcScp0CUAVjU\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(37, 7, 11, NULL, '<iframe src=\"https://mega.nz/embed/G2pklQpa#tcW2WrafOwvgOpL61x8G1G-VUgE4X36eF6rx5_Tz894\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(38, 7, 12, NULL, '<iframe src=\"https://mega.nz/embed/v6oWnYpK#ReJIEVOSvDi2TtSbGmR101knh9Ec5ohyJqYdPz4UEGQ\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(39, 7, 13, NULL, '<iframe src=\"https://mega.nz/embed/f3ZkRI5Q#MSliMevkMAocEpjtbAwlShUYrAL2hmWkBuh09oRIbFI\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(40, 37, 1, NULL, '<iframe src=\"https://mega.nz/embed/wHFWjAqY#1DgAvLbdpSL0mbfbjugM8EFIvebnOL9DoFAU4QunrME\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(41, 37, 2, NULL, '<iframe src=\"https://mega.nz/embed/oW01RIKK#2r6AMOQiRlH_TcWW2PDC29VmntKJOj1txOj-bKzT81I\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(42, 37, 3, NULL, '<iframe src=\"https://mega.nz/embed/8Td0xTLS#-nlGEa8ZvTPcKXqY23o0oAPxYSIOIX79MfYAdDWqC7E\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(43, 37, 4, NULL, '<iframe src=\"https://mega.nz/embed/tPU3wZbS#82ZJtKwDbE7FeRv7wqWlz_C2gKOkeG3SseUlmYmvtbg\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(44, 37, 5, NULL, '<iframe src=\"https://mega.nz/embed/5KkHTKjL#achFciI3ww0IPKyWvIGfLrJ9m6CiEPlwEvzzVz1CPBI\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(45, 37, 6, NULL, '<iframe src=\"https://mega.nz/embed/Re1gnASZ#2sk5MBX2-CuBilL8ci5WG3ob6GYkm6wmU_P62kgW-hY\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(46, 37, 7, NULL, '<iframe src=\"https://mega.nz/embed/5bsGDC4K#kUJH5qUE9kFgJoFoMG7C06y13uXVlnBm8O-5myoOU8Q\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(47, 37, 8, NULL, '<iframe src=\"https://mega.nz/embed/wS93zZYT#S0mTBuZQiw8RNtlfGA6e85Z6A-uFul_3KG2czo5n-X0\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(48, 37, 9, NULL, '<iframe src=\"https://mega.nz/embed/ZKUw3QTa#HKXUJZAPR1dkSW_oYpemw5ZCFTslXe0r7w_R9MJFLxw\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(49, 37, 10, NULL, '<iframe src=\"https://mega.nz/embed/wbNyXDia#Lw9KSqk-eGochZQBmH73G6WZdi_uqLt0z2juKV5Rl0I\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(50, 37, 11, NULL, '<iframe src=\"https://mega.nz/embed/RaUgnDYb#pYyq9oWffBybFv5hITjJef9ZQWjI8OmNVd1pmqWbETc\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(51, 37, 12, NULL, '<iframe src=\"https://mega.nz/embed/ZWd0iQoQ#DTwdyYVVUTyzjZYVylzSo75SdkURiR0ZgrDK9VJtQqU\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(52, 50, 1, NULL, '<iframe src=\"https://mega.nz/embed/UXcWUZZA#yYBFRRPsG-wiC35_PyWWbwczY2y-57BhD6KXc7d2osE\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(53, 50, 2, NULL, '<iframe src=\"https://mega.nz/embed/9WM3RSQb#LIbGC5dC5KwTaFf3mcFGnZo-fw_AAq5WircSGXz9xJU\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(54, 50, 3, NULL, '<iframe src=\"https://mega.nz/embed/sbtgnAgb#LEoTNrLiejeuPW5qCK_uXhX8slBGzFIr1Sv_ruD5VcE\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(55, 50, 4, NULL, '<iframe src=\"https://mega.nz/embed/NfVBXIrA#BzaZNTG7Kdfvg5zRlu8LL7xuS6N-UGoWYXPvifZWYd0\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(56, 50, 5, NULL, '<iframe src=\"https://mega.nz/embed/VTd00JqI#qzqYdq2iZk8SGpgbbtk9BQZ-jqGLzDEvYbQwq5PsJ0E\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(57, 50, 6, NULL, '<iframe src=\"https://mega.nz/embed/MWV2QARQ#YWAnLLNgbq1I8R3Ezpt05Qsx0Jexwvpc0OLIMuGljbw\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(58, 50, 7, NULL, '<iframe src=\"https://mega.nz/embed/AGdiEbzC#Thhc0Z5D2AG2l5nX_JqZobos1yQ9Lg4IsGUWU1WIW0c\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>\r\n', NULL),
(59, 50, 8, NULL, '<iframe src=\"https://mega.nz/embed/BLdGwYgY#JNlOjPHTZ_52vzZrdYivc0EzyitTkDuERLjwxeHEmrg\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(60, 50, 9, NULL, '<iframe src=\"https://mega.nz/embed/1WNRHTTB#59cJGBiC8SrNygi9QhblGR4-rHIhCLnPDgl6yD37gWo\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(61, 50, 10, NULL, '<iframe src=\"https://mega.nz/embed/QPtmDZKT#eZ7122gLKsZu4cl725TGTpram4qm3g6quuwZi4SyC_0\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(62, 50, 11, NULL, '<iframe src=\"https://mega.nz/embed/dLEVwQbR#3lfxkMgpEueg30NmK8xwHmWvwhTwvxUscZe1OHqSdgs\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(63, 50, 12, NULL, '<iframe src=\"https://mega.nz/embed/9K8UTBpJ#fiklySPLtz3ZgjNMg_8OSa15G8pWPL7QujwlXj8P4b0\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(64, 35, 1, NULL, '<iframe src=\"https://mega.nz/embed/IXFVxDiT#r6VAigBdODbEtThM_wuY_INkBXxwk0u9hX_vQqAFKZM\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(65, 35, 2, NULL, '<iframe src=\"https://mega.nz/embed/sSsjySrT#aC9yxPE-qW-DzipfPAaZFQGtR8mHKu85Hlq_Vc4qblc\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(66, 35, 3, NULL, '<iframe src=\"https://mega.nz/embed/oLNjFQ4D#atUxga-WDLw4o_CzZMmaFaMIZlDvnNtUxABufhwU51Y\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(67, 35, 4, NULL, '<iframe src=\"https://mega.nz/embed/BT03SRZD#PU-wmo9QNO1TOb0RRuKLWj_n5xR3-xz2jXwYCxTDoQ8\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(68, 35, 5, NULL, '<iframe src=\"https://mega.nz/embed/YPkCjJQK#POqcyhSwrhSOzcwFerhbuNTNL_qK0_3yMnl3VFpJDPs\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(69, 35, 6, NULL, '<iframe src=\"https://mega.nz/embed/tKEVCB7T#Y6nXAms5pvZjBkWJGRqPcDApjP1SdqExUBLeuJd1osc\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(70, 35, 7, NULL, '<iframe src=\"https://mega.nz/embed/qfpzxayJ#ByALYqOCODAYIKooUpib_tfi1SceEBPeH36aISxGZGU\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(71, 35, 8, NULL, '<iframe src=\"https://mega.nz/embed/WTpnjYrS#IMlFoONl-50aJALcRlHSLfW2NVNgoAhQUM3fAbjn0Mw\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(72, 35, 9, NULL, '<iframe src=\"https://mega.nz/embed/vexRUABA#kpkFcdaljE_fu2uvo8TIVbz8CQxu7y4jzIuOV7td33Q\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(73, 35, 10, NULL, '<iframe src=\"https://mega.nz/embed/uX4DwCKS#1U9Al2IiDWsn-bm9s_9bjKgQMXDowWzsoKLQMYjx2cg\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(74, 35, 11, NULL, '<iframe src=\"https://mega.nz/embed/fSwCjQBA#RBJUIAql0Spd38YZ0Bh7_tONc9EYuSE35CEvQn4D01M\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(75, 35, 12, NULL, '<iframe src=\"https://mega.nz/embed/mGRAjKaL#pnFl8eHtPKANhZ0cLTJccUtFWxKyjOcJxloUt5ZLM6k\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(76, 35, 13, NULL, '<iframe src=\"https://mega.nz/embed/v95xQZRa#fJ6vOQDuxXs9lSPBIMy5Zy-I_YaUxq2v2x9OEljCcKk\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(77, 12, 1, NULL, '<iframe src=\"https://mega.nz/embed/EXFWUKBb#EcIZ9Fxhm1ChFTxskqElyiHRTUfmi8dDEOceFWLoawQ\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(78, 12, 2, NULL, '<iframe src=\"https://mega.nz/embed/8Gc1BaLQ#rc9HxkAFH5CAuI6b3qoGJkzE6cSUnFSQrnpNGDGlmPY\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(79, 12, 3, NULL, '<iframe src=\"https://mega.nz/embed/hbs2hArS#DsPJk1V9wbLbwbfpSF7AcWXfYgnCqpyNTcHeBlMlWLc\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(80, 12, 4, NULL, '<iframe src=\"https://mega.nz/embed/IHdF0ATR#xX8QlW4kk5s6eZnfLCxxGcuOE_HBlygiJxmkvGE9tEc\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>\r\n', NULL),
(81, 12, 5, NULL, '<iframe src=\"https://mega.nz/embed/FT9k1JYB#broSWQGmQCTrFrKEBI1tliIIfDxcoKQUWzOm-NLdg14\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(82, 12, 6, NULL, '<iframe src=\"https://mega.nz/embed/lCE1GRTT#s9O8Mjee-v-_o57Zfcnn4tDhPboQCMjDr8jeOw09E9M\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(83, 12, 7, NULL, '<iframe src=\"https://mega.nz/embed/xflyxQJC#-ApKTBn5UoHS0I7EzfV0LTQmfD74kPEauqgd-wels4w\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(84, 12, 8, NULL, '<iframe src=\"https://mega.nz/embed/gaNAQRKS#u2GHBn3poLQfLmJ3oBSah2bs_yWrAsi9NKD1tANCKlo\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>\r\n', NULL),
(85, 12, 9, NULL, '<iframe src=\"https://mega.nz/embed/kGthxKZL#7vtjqZgXLIGMf4rRZGjEwdBnOWkrRuLe7k0Chm0e4xs\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(86, 12, 10, NULL, '<iframe src=\"https://mega.nz/embed/lKtiARiS#CvH6JtTEf6ur3NHixwd6cK8HqbtKo0vLrWlLL5MpxMM\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(87, 12, 11, NULL, '<iframe src=\"https://mega.nz/embed/5WVEHRhK#kxUiToOevuovx3A4sXtGOwMgXePyH7F0vU47N7zTWQg\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(88, 12, 12, NULL, '<iframe src=\"https://mega.nz/embed/gWlWBSSI#TDIQ6P27jtP_QIm2OBx0PWEb6XanvIUhJCjcXJx2YrA\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(89, 25, 1, NULL, '<iframe src=\"https://mega.nz/embed/seFwlKTJ#R9y-JoHLReX06RhsPBTgcop0CASYHob12JSsys9u7hA\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(90, 25, 2, NULL, '<iframe src=\"https://mega.nz/embed/JXMhxIRb#71HxrlnTkgnRTK3c8URGEksBauSIM6r1HPxjg4pKYzE\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(91, 25, 3, NULL, '<iframe src=\"https://mega.nz/embed/oWtllZ7C#YwYNvfjygmhlvK2U3D5YtTGmN-W5o0L4B45eyGVAMVA\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(92, 25, 4, NULL, '<iframe src=\"https://mega.nz/embed/MPVC2SxJ#bEg2tWRzf0Nbj_ZtEakME9ISUe-GaHXF-3sl8niHNpA\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(93, 25, 5, NULL, '<iframe src=\"https://mega.nz/embed/QW8DDb7A#1vhUglK4Kz08Mk3ub5Gq2M6YauYmKHNJznnXvhQXXDU\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(94, 25, 6, NULL, '<iframe src=\"https://mega.nz/embed/laNiEIjS#oJYPv4qzBP-s8f9h03CKiZrTXyzA8S1_bRaAAbFso1U\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(95, 25, 7, NULL, '<iframe src=\"https://mega.nz/embed/4nF1DLoR#v9f_1lUrcCxeGjGy-mnvc-EcquuPEBMTJeelHCjjIIQ\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(96, 25, 8, NULL, '<iframe src=\"https://mega.nz/embed/Mv1XWCSb#lyhgx9-zLd3wemngtFv1ppLLzSZ0KJ0xDs2QGmQm52Q\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(97, 25, 9, NULL, '<iframe src=\"https://mega.nz/embed/gTtXDJzQ#hn1Wz88MJu2DVY3WtIiSaebY9x_gAEfS5P0Id4pj_fo\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(98, 25, 10, NULL, '<iframe src=\"https://mega.nz/embed/wOsHjbaZ#BQTEhJ3r0Rz9qDabjwKsjkb00xPfSf6QtifXNcpl6Z4\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(99, 25, 11, NULL, '<iframe src=\"https://mega.nz/embed/NSdRSLCS#yoUgeowqTUCS8lGZ60xKSiVvxFfKqzZDscPq80EkMiU\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(100, 25, 12, NULL, '<iframe src=\"https://mega.nz/embed/0CdVRIwQ#P802aZtauXJq8-t3uVNOIM7EGBmPTAIZ1IIYK6v-71o\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(101, 22, 1, NULL, '<iframe src=\"https://mega.nz/embed/BrciUJza#18_7pjtXOmNTUKyNF6xhV2bFi236Fse_rEdqJrjPQmM\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(102, 22, 2, NULL, '<iframe src=\"https://mega.nz/embed/9H9DWZST#HfXWaG5gl6c70MDpg0Mcq8ucjOrEoGK1s4s4enFr-VE\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(103, 22, 3, NULL, '<iframe src=\"https://mega.nz/embed/xiF2WCzB#R6CtiH6FO4xwUSSRPsMF_7w8ZUfwd11vLSPunXy05NE\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(104, 22, 4, NULL, '<iframe src=\"https://mega.nz/embed/0DlHgD4K#_0rNXZlHFUhyyzQfgeyC-GbdRVuPGDG1cCR8lP_3uAE\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(105, 22, 5, NULL, '<iframe src=\"https://mega.nz/embed/RfswhA5Q#jmB-pE9qZLZ4MuYO9SbXd-N2fSnXDFhEGEV6oGkqvb0\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(106, 22, 6, NULL, '<iframe src=\"https://mega.nz/embed/tTchWIIL#jJw6-ArHke4_KiLUAl0yjbRmHxqoIWkhWb7n8h3TZuo\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(107, 22, 7, NULL, '<iframe src=\"https://mega.nz/embed/FCEERBRa#9tISpzVKyz_RuIb44AkIDQaha5c9mzbX8w5JfHknNRY\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(108, 22, 8, NULL, '<iframe src=\"https://mega.nz/embed/lbE01B5S#_syaYU0WRVJvaFjN-nKLsqOrOj7EzauqGxhq9zn_2F0\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(109, 22, 9, NULL, '<iframe src=\"https://mega.nz/embed/wn0DxDAK#BCQf0klJ8KvZLn_ldBIVu5Xpf8wLvpu4E96tGTYAiO8\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(110, 22, 10, NULL, '<iframe src=\"https://mega.nz/embed/A29AWSqD#CLQS-NVrCWyImxOq78zhcMDKK_WtxysLFddtLvIoCus\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(111, 22, 11, NULL, '<iframe src=\"https://mega.nz/embed/hily3JSC#YVVujzWSMrbBq7c4p07mw-yD4MFNovWJZgnQ68Qn6QU\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(112, 22, 12, NULL, '<iframe src=\"https://mega.nz/embed/dn8GlKSD#mtt6gafpdUvPFmcy46bwTu5gAEbnV6s7oODRxn46_cE\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(113, 24, 1, NULL, '<iframe src=\"https://mega.nz/embed/1e8CmDJQ#IeVExP6uFRqnq9m3a3UtESnqteRUmAu5IQN9Bhgsg1Q\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(114, 24, 2, NULL, '<iframe src=\"https://mega.nz/embed/1G8ziYQY#gHUnywM3QAQNoWH0ULzmQMfFBAOl4WeFwICuOUuzngQ\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(115, 24, 3, NULL, '<iframe src=\"https://mega.nz/embed/0CN3xIbT#aE0DU62aHKjPqnwq7vy_wmwndwX9bCrYkLltuoWi8KY\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(116, 24, 4, NULL, '<iframe src=\"https://mega.nz/embed/NPlgxCAA#YhgmBuKZxnVXKQrrh9zPYaNkqiQljJK3SPlwk9kv0k8\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(117, 24, 5, NULL, '<iframe src=\"https://mega.nz/embed/gD9EmS6K#kVmgQ0K_kNd6E5fzxpVt7uHDvR5HCkQQfV7uK7BTN2E\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(118, 24, 6, NULL, '<iframe src=\"https://mega.nz/embed/UPUgmTqY#LVmhBtVtJ84MHPrMKeJ3DstTwY66mLWJDwHM6BgrTAo\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(119, 8, 1, NULL, '<iframe src=\"https://mega.nz/embed/hKclAQLY#EYEMnNW8mIxsmYQRAihUUwO8EvWHyhgI-09yQCT4sxQ\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(120, 8, 2, NULL, '<iframe src=\"https://mega.nz/embed/pflGVZYK#62rOvrSDyiwVS52RpqyA8TD4ugXMdVDulWbQ0ORqYuY\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(121, 8, 3, NULL, '<iframe src=\"https://mega.nz/embed/sHtRmAZQ#JeNX5v8U0eXd9Y6UxBpcF45kpwPx___0rs1Ecl_LdRo\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(122, 8, 4, NULL, '<iframe src=\"https://mega.nz/embed/leEQVbiI#Ay9qnyCD0xWImRERSPFe39nCUCN3_UyDmpMs-PnHDYE\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(123, 8, 5, NULL, '<iframe src=\"https://mega.nz/embed/4HNmyCjK#i7MswFNkzRoq1-BzYsNbXoJTYxrfb531c8h_3apobuM\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(124, 8, 6, NULL, '<iframe src=\"https://mega.nz/embed/hD9XAIKZ#w12xfEtSVi-Zm-fAp8RnfDTDyg_A1fQy1MNg_Lw7aac\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(125, 30, 1, NULL, '<iframe src=\"https://mega.nz/embed/qUQVxIZI#OoT-aNpFYTzIFUJXaWajUhlTHgt6RCgwGAUVUm4PTZI\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(126, 30, 2, NULL, '<iframe src=\"https://mega.nz/embed/DQJD2axK#MaEr2hN5nahyPqoIIFyGRE5CvAEOZCSbGywZu-nBuDg\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(127, 30, 3, NULL, '<iframe src=\"https://mega.nz/embed/fVIh2SAS#jHhiAkAEkzTNOxy9jPH-Zmq-L-iUx8HX4eR2N7Eo3ms\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(128, 30, 4, NULL, '<iframe src=\"https://mega.nz/embed/2EBzhKIK#YTAT3LflcrhPXCtngxhvZWhU2crzy8Sa_CqwIazB5Ow\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(129, 30, 5, NULL, '<iframe src=\"https://mega.nz/embed/vNQlDYoD#BIR0HShm-UCjGmuoEB6pfRPnv_jIDYF8oadji3AMH3Y\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(130, 30, 6, NULL, '<iframe src=\"https://mega.nz/embed/fRIHFYqQ#bQ2WyTGYBoL1pCLfiD0WE9Ce-cnrzuc-F_pM2ay03BI\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(131, 30, 7, NULL, '<iframe src=\"https://mega.nz/embed/6cIzCSoL#lY6S0iBfgE8BiObGAndkyY_xkSn10b3hjKIArYSwf84\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(132, 30, 8, NULL, '<iframe src=\"https://mega.nz/embed/2UYHDAJC#u_6eorApAH_-Drp-yfw_7IDCYJefvux-HFv6quskl1E\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(133, 30, 9, NULL, '<iframe src=\"https://mega.nz/embed/zcQnRYJR#sKzScRLquTjAatO21iK2DkcUEpew5gCYuhBG0in1L38\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(134, 30, 10, NULL, '<iframe src=\"https://mega.nz/embed/LRRjDQIY#5bBDzNjz0G43lQyCSf8xnjJGnGcogZC7Tp4_9MeIccg\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(135, 30, 11, NULL, '<iframe src=\"https://mega.nz/embed/PZI3SSRR#g5ckR0HJm8wHGw728a6ghDOomryR2Ey40OOZORqlfyg\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(136, 30, 12, NULL, '<iframe src=\"https://mega.nz/embed/WVBHgCDC#7h8yXH7ulYINWhCFIhX7gbn9VCjzbd4DI0Eg4VSu0QQ\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(137, 60, 1, NULL, '<iframe src=\"https://mega.nz/embed/s4pCDA7C#nj7aU8SFcKMS4l7u_YdtWmU8MYKVdaLChmRZwjNSpjA\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(138, 60, 2, NULL, '<iframe src=\"https://mega.nz/embed/1lpQSYiA#vS2EIT8AEK9TGMibew0fn6DRNAO-7QgygQ0-mg2FkL0\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(139, 60, 3, NULL, '<iframe src=\"https://mega.nz/embed/koxSnCDJ#oweO6hppEGKJJaOG5rxrQemlPtUMTyyQZ0Ld5TH9JbM\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(140, 60, 4, NULL, '<iframe src=\"https://mega.nz/embed/cloGBQ5J#TlsUHo2t2bzfzFYKOqGo3MM3A3ksXZyhtengfMgKxeg\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(141, 60, 5, NULL, '<iframe src=\"https://mega.nz/embed/QZhQjRjK#eQHQsAS6IAMOvdMRy7erPiEW7ibuheepf-I9mtj3FMg\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(142, 60, 6, NULL, '<iframe src=\"https://mega.nz/embed/Q85ygIjb#DbC3-HXTgUzxsiz0j6QT6rZpLJTjP_AVkq0W5EGOxhY\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(143, 60, 7, NULL, '<iframe src=\"https://mega.nz/embed/1og03a6D#RClVyX1fMv01CwbJQax4xFmg8O8ovAG1jfnd7BYVxAk\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(144, 60, 8, NULL, '<iframe src=\"https://mega.nz/embed/yaBEhaAD#TTUa6d6gz7eIe7oMug-sCzRdqLNgBfXsFzeYrHkJVMI\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(145, 60, 9, NULL, '<iframe src=\"https://mega.nz/embed/TaZ2WCKS#nWXw-dxSe9umV_-ptJVy9Y7gM6ouMYcvPNMaNzPbQNM\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(146, 26, 1, NULL, '<iframe src=\"https://mega.nz/embed/7IgUma5Z#sBR2fQDkrlB_OEajhUat2aW3sjRAFFcAfVqcZ_nYQjk\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(147, 26, 2, NULL, '<iframe src=\"https://mega.nz/embed/aZgQgATD#lEHOALQvTmpP2azRDFWrZ_hHAlD0MFzcdVm1dqlYMUI\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(148, 26, 3, NULL, '<iframe src=\"https://mega.nz/embed/eEhWxKJY#0Q2MSVwf5ualKshHfUIsWwPL6c-WFvsF2P98EUwptXs\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(149, 26, 4, NULL, '<iframe src=\"https://mega.nz/embed/7cwi0K4B#uZq18dCoEZuISnnpZxG2tTPyNh1SSvQx6ZfLLrZ_uwg\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(150, 26, 5, NULL, '<iframe src=\"https://mega.nz/embed/3F4wQChC#LisC-KH_ykaOQ7D8cIacmtB82QupDwOVzu9y1aA4Gow\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(151, 26, 6, NULL, '<iframe src=\"https://mega.nz/embed/nVowgChT#MK06fZW9l4xRNrGQ43m7IAeoLrUSgwGVkutoGb50aS8\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(152, 26, 8, NULL, '<iframe src=\"https://mega.nz/embed/Ld5QTCzJ#ftV_YfagaMA6PyvbyxOCY1FdFZY1axo9QyC_2q2dmMc\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(153, 26, 8, NULL, '<iframe src=\"https://mega.nz/embed/nRo2gSYa#-OQxkJpsP48zB_Hzr_vlBJsHPmEhcgmf8ZSI1kgo9Bk\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(154, 52, 1, NULL, '<iframe src=\"https://mega.nz/embed/hd4GDSKQ#l1Rkr8M_5AdY-LdJ9qep41roKmbBHkUh2nBE8tG08bM\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(155, 52, 2, NULL, '<iframe src=\"https://mega.nz/embed/wVhWXQDQ#9MIQudwYQVTN4MHbDnVVpv0PEGyBok9XI2DXcpO-YVQ\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(156, 52, 3, NULL, '<iframe src=\"https://mega.nz/embed/EApkzaqK#_p-1ZCZGk7y9RmHxo6DGFpAKfGUvfhGfDcHcw7GOMh0\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(157, 52, 4, NULL, '<iframe src=\"https://mega.nz/embed/pQhQ0S7K#ucD4s2ot2jbxWEMDQqvO9ILO4ydnBvlQbCRGVYx86Jg\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(158, 52, 5, NULL, '<iframe src=\"https://mega.nz/embed/NUhkGYIC#Hc_Y-64GrlzcIG6l7EcuUPmsRUx_WvjnoGOp03ir6EE\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(159, 52, 6, NULL, '<iframe src=\"https://mega.nz/embed/sRpCnIbC#iNQ13Jz9OFsnPWtRkH7JwurhVufR8prMxmkJQgI2cyM\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(160, 54, 1, NULL, '<iframe src=\"https://mega.nz/embed/QbVjyKwB#0fN50R3GMrjm0m3D1reC9vnBsjPPSUNMzkK6R5lFl0I\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(161, 54, 2, NULL, '<iframe src=\"https://mega.nz/embed/1fkH3YqR#wek0g9Y7cMPyp7fAcaPnoD0sqgAD_FhpJqAjQgB95sQ\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(162, 54, 3, NULL, '<iframe src=\"https://mega.nz/embed/EKFz2Bob#Xikgk3QsToxvIQnKtlvITlpzI-Bzf43NfH8YRIyZxKE\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(163, 54, 4, NULL, '<iframe src=\"https://mega.nz/embed/UDknFSqR#8DTiyBnujO_NzvFMqTInbH3OIwFBQDX13QnJ3C0DJOM\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(164, 54, 5, NULL, '<iframe src=\"https://mega.nz/embed/5XN2DbIC#X8mCR4wDR8a7xlynfj_A__oFL2clmWvjX3KKBt_tP4M\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(165, 54, 6, NULL, '<iframe src=\"https://mega.nz/embed/pC0HDBrZ#IcvqxXfekG1HmKLAL1cFYTnRhatB-ZgzHu1r4RXW99U\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(166, 59, 1, NULL, '<iframe src=\"https://mega.nz/embed/DeBSAC6Q#OmNPr7nt_TRzrIViD_z82Q1EOK6o1LHyw8IByAzXoKY\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(167, 59, 2, NULL, '<iframe src=\"https://mega.nz/embed/HOAQhKgZ#LgywA7uT6fhv1_LvW2F_AVhgiBYBnb2Ewe49vr2B2tY\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(168, 59, 3, NULL, '<iframe src=\"https://mega.nz/embed/zCZkCYoI#vEhmgiSHOsoV8Ahv4NxD2k1oHW2VH5215egSnC0H52M\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(169, 59, 4, NULL, '<iframe src=\"https://mega.nz/embed/kloVGaIZ#tAA8hSpT1p-KCOIdL4EopejOjM9hAVsrlqMMB1VYOZo\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(170, 59, 5, NULL, '<iframe src=\"https://mega.nz/embed/8pwh2ATY#J1ep1wZhXM02lNLlemFfYi6AnOdbVllSmPqRjbr8iXE\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(171, 59, 6, NULL, '<iframe src=\"https://mega.nz/embed/9soBgaSJ#DNOqYY_t6X9ON3KguiRpOWinhCkqXzmqPzpyRV2RL9c\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(172, 33, 1, NULL, '<iframe src=\"https://mega.nz/embed/8m0DhQqD#zq51gF8fXobmAy9D949iS7AT6Xya0N8ku7capaZEdfI\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(173, 33, 2, NULL, '<iframe src=\"https://mega.nz/embed/s3dHmJBB#oQ7Kem1Qul-kp6kbX_V1CnGM6F1mjEYLP4eRwqxFJ5M\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(174, 33, 3, NULL, '<iframe src=\"https://mega.nz/embed/tf1STDSb#WLxk0AY1mCa_CPWN0au0yUiyMKQcNnc_TodBZ-s5f9c\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(175, 33, 4, NULL, '<iframe src=\"https://mega.nz/embed/APMwiRwK#dFR3c4A8N-45AKCtzkbCkTKvDfzMz5paHmkEd1EFmSA\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(176, 33, 5, NULL, '<iframe src=\"https://mega.nz/embed/kq1n1bYJ#FhPGFm_jOIX_Dp9m8-rbTF8TSJLHXgWEj2EHQou1Pwk\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(177, 33, 6, NULL, '<iframe src=\"https://mega.nz/embed/1jMXQDzI#2ipV27wRyBL3xejaQFJy7BMe9UXDNxbfLxIcYDwwRuo\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(178, 57, 1, NULL, '<iframe src=\"https://mega.nz/embed/FuMD2bBD#3xtgU29XSRGCoUZl5_MSzl6VmnNCki9DujqrCzKkSNE\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(179, 57, 2, NULL, '<iframe src=\"https://mega.nz/embed/RfUCGKwJ#_WptWmoeK5rI94ExLlBbM-wTVBa7wHvRh7IXuROdeo8\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(180, 57, 3, NULL, '<iframe src=\"https://mega.nz/embed/FGsDTbJB#VVoJuXWkTjJ43oXFF_ZgHGe3Hkl-5wTLIlxOfA7vdDw\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(181, 57, 4, NULL, '<iframe src=\"https://mega.nz/embed/EX1kzLIQ#0oZVhuWzXVH7OmaDHSR43g19QMK2YQ7OjP1l2XPx0L8\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(182, 57, 5, NULL, '<iframe src=\"https://mega.nz/embed/wfF0yIaT#NAFqERgPvUcOy7fevWknwvs-P4iqVJwMaEbNDfZ7ykc\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(183, 57, 6, NULL, '<iframe src=\"https://mega.nz/embed/JH8jyKxQ#R0EA2zO0FInQxuJ_XNK25LnFCr364ODC7DzU4AnsXrI\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(184, 38, 1, NULL, '<iframe src=\"https://mega.nz/embed/BK9VxAqZ#uDlr9gTvqN2UyTtAy3wCPjQHfMwCl0zrs3LfLbT8Z-U\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(185, 38, 2, NULL, '<iframe src=\"https://mega.nz/embed/1X0TnSYD#rs216_Z5-eLxhi7eQrdp6hZD00zft5hqrZSamARdTN8\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(186, 38, 3, NULL, '<iframe src=\"https://mega.nz/embed/9q0kRBIR#f018Hl9WxGMzZIhMu5wPgzOORt6c-yVwVfiQZvQv8eg\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(187, 38, 4, NULL, '<iframe src=\"https://mega.nz/embed/FDlAWDzZ#iG9uP56WS8khFKsFKDqFSFFbpt6cgyZKaR898EfB5NE\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(188, 38, 5, NULL, '<iframe src=\"https://mega.nz/embed/UPEhzC7Y#HKJjav1yotuNzEWf3VsZ-0om3LkdZv3_uz-1UrySYeg\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(189, 38, 6, NULL, '<iframe src=\"https://mega.nz/embed/dPt2hS6I#OMIOKeSybFrek-Z4cmMLsTi_8014zy1jiNPeHCqZkuQ\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(190, 17, 1, NULL, '<iframe src=\"https://mega.nz/embed/VDckhTxI#B_5rmT37ZEyqoftNdcYanoArb7JLYPo0_P5PSFKGIsw\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(191, 17, 2, NULL, '<iframe src=\"https://mega.nz/embed/FrVUEZ5J#5CAVxWJlN4SrIuOOO80is8haNS3_lb8e89ZSHPfkM-Q\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(192, 17, 3, NULL, '<iframe src=\"https://mega.nz/embed/dfdUCCoS#ja_Eu4C8c6ozPs6vE9L7nFpLTmk5BUIiDek-R_0QAe8\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(193, 17, 4, NULL, '<iframe src=\"https://mega.nz/embed/UWNmxTwB#crWtkhxozbjING2tCPCUVjMXoGo0MgRIzPq1CnxhexI\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(194, 17, 5, NULL, '<iframe src=\"https://mega.nz/embed/ZWt2iRzC#8GmzTKZU5ZXZkCcu0ujndS2wEjUKtgCK9GAjoGcckbA\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(195, 17, 6, NULL, '<iframe src=\"https://mega.nz/embed/pG9whCib#zcEUIYULbM2fcjOBzu3Iq0ZfKrcZoLAQE4L2YjEPc8M\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(196, 58, 1, NULL, '<iframe src=\"https://mega.nz/embed/rvQkwCoJ#cdsJnmL4xhxGG8bTkoqXRucL5Em2-ZhgPuk2SjtZGGU\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(197, 58, 2, NULL, '<iframe src=\"https://mega.nz/embed/q6ZglKzZ#f5KKSBJseqiAeapbefA1Pr7G4sT4AjZz8U1mLmWwOuQ\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(198, 58, 3, NULL, '<iframe src=\"https://mega.nz/embed/irQySCyA#JKUWmj9KmAuDN_2KdCbP86xFP3UB5BX9M8_rFjt_kdw\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>\r\n', NULL),
(199, 58, 4, NULL, '<iframe src=\"https://mega.nz/embed/L7ACmQJC#IC4Yjemiml-gqKeaoNlFCbzKhyu1JFjVh4S8UVP0i2A\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(200, 58, 5, NULL, '<iframe src=\"https://mega.nz/embed/ziY0RSjC#z4SLkuGB56OnwXdM25UQqgtSaoSdKWX_cR7d5O1Zo1A\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(201, 58, 6, NULL, '<iframe src=\"https://mega.nz/embed/7qAGjITR#C-vY0PA5MaHrh825j6a3VIRUedBUOUkzz2p1lrNt6Eg\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(202, 39, 1, NULL, '<iframe src=\"https://mega.nz/embed/13tz3b7S#d285j03ojbv-AUrdcfjZV1ErOda61-Pif9olRA1f2uc\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(203, 39, 2, NULL, '<iframe src=\"https://mega.nz/embed/ovU0VDIa#sppONiJRVzYqyppoWw5d9wSA5CK1yDL6-oz9zqILiqw\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(204, 39, 3, NULL, '<iframe src=\"https://mega.nz/embed/Fj92AK7T#55lvXrWR1eY5dtL0IZbrsDve0CYSoW6igKyK4MOe0P0\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(205, 39, 4, NULL, '<iframe src=\"https://mega.nz/embed/sLU0BTSS#7eYBVUnwfzJOcuiCJK8e9iQzCeqrOvlM50_Ek6qyqSQ\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(206, 39, 5, NULL, '<iframe src=\"https://mega.nz/embed/gytmWDTQ#Nj1uTgJt-qAnv8bL80EHVnROH4H1a0RCklE8LdZyBhc\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(207, 39, 6, NULL, '<iframe src=\"https://mega.nz/embed/Nz0m2JLJ#HISMuwM7EADpPxvrLc7L3tpxUljNyAq2_6VWN9EgFfc\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(208, 10, 1, NULL, '<iframe src=\"https://mega.nz/embed/5TlCiT6Y#vD0ZJEaYNEh27IZtF5qI0lZcx1JC6tD-swbnvTrNE-s\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(209, 10, 2, NULL, '<iframe src=\"https://mega.nz/embed/BX0BDBBJ#FETeQdVyJ4tkp5WAHEj3j8F2oWdf1b6dF9MX54IOwCs\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(210, 10, 3, NULL, '<iframe src=\"https://mega.nz/embed/kWMlFJjC#EP-T1MOxU6aCyFRLCKaOyuSG3gfBj87D6KAK2BGMCQw\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(211, 10, 4, NULL, '<iframe src=\"https://mega.nz/embed/4eUEDawR#zaCJabLajPzz6xIfCcvrwyhdhohirfxLas_FCW6yMoM\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(212, 10, 5, NULL, '<iframe src=\"https://mega.nz/embed/IDcyCTqL#J5lrAssGaBO37M2eR944QxrEapOOEExhIgQLQ-Ysnfo\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(213, 10, 6, NULL, '<iframe src=\"https://mega.nz/embed/huM3CSQS#6aRivrxO8A7uhsQilI19yyt7EPgctCwoR6Fw1pj54uk\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(214, 10, 7, NULL, '<iframe src=\"https://mega.nz/embed/0ndyVQwL#d7bNRc2rXDw5v2UK-lCpt9AWqNCQ5sVHS5UzGdvB8vM\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(215, 10, 8, NULL, '<iframe src=\"https://mega.nz/embed/tL1HwbII#NllI_0ZZB1R9tb6IIvHRGaSLKulTlWTM2QlzkiNS4YE\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(216, 10, 9, NULL, '<iframe src=\"https://mega.nz/embed/o7clmKyb#1BFfJw5Z8SqNQ9mBSisnWE2CjNuTjuMzLMGFMkGOKa8\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(217, 10, 10, NULL, '<iframe src=\"https://mega.nz/embed/EDcw0LaC#wISoEhjVzexwBdFXqhR30ZHBIfmTX3VTmCzm5mEhY-Q\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(218, 10, 11, NULL, '<iframe src=\"https://mega.nz/embed/0isCASYB#tFqE7fMT3wmh-5y2bEUCQwMd0ArJEKAorv8y6mN4x_0\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(219, 10, 12, NULL, '<iframe src=\"https://mega.nz/embed/xqsjXapK#Hf8nQ_f8E1XuaeS70hH59W4rDwTT8XMSsvW2rpYnUhA\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(220, 55, 1, NULL, '<iframe src=\"https://mega.nz/embed/o3dm0ASQ#PX_fW_V8FCCNHwmWjP7Sui3LTF_v4rKFbAUFZRmbuFc\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(221, 55, 2, NULL, '<iframe src=\"https://mega.nz/embed/8jtSgLrI#TnCws3gyZdwxcKR-w49nktkdot2ikmlLHlo0DeMzrwo\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(222, 55, 3, NULL, '<iframe src=\"https://mega.nz/embed/9eVQxLgT#Iz3ck8N22Hq020gK0HYtCNMvZf6VVD5G0aNXAIb1vaA\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(223, 55, 4, NULL, '<iframe src=\"https://mega.nz/embed/FOVwRbhZ#D7hyGU-pTEkFrbf6mFMKqTdE3HrWGsj1EhorUEhAE6M\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(224, 55, 5, NULL, '<iframe src=\"https://mega.nz/embed/RvFQTSRA#e-qoxcZDq2HFm2dcwCniBLEXtGzPuhsytLVMXpRqL8Q\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(225, 55, 6, NULL, '<iframe src=\"https://mega.nz/embed/VuMBiRIB#v--LzJOnq7xgldaIevxeyctbS_C1gNotCLqNKIrAY1E\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(226, 44, 1, NULL, '<iframe src=\"https://mega.nz/embed/xG8i0SIa#Are63LF8T_rD9UgfURKFv2GqyU3JsMq_17SKzcbpmw8\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(227, 44, 2, NULL, '<iframe src=\"https://mega.nz/embed/xH8XkRyS#YoIRPmZmqr-oZjxQEgd43SDGBDyBSyA5Mmr2EH1Z52g\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(228, 44, 3, NULL, '<iframe src=\"https://mega.nz/embed/AXll1Ria#VKO_DEkQsP94XUfmA5VX0ha3oR_AJZZQCFqeQbkMf-s\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(229, 44, 4, NULL, '<iframe src=\"https://mega.nz/embed/AHswzKiB#iRfLJBpX-wZOuUtNaqMpE2zlEPDixBP1KQphYOWUVIo\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(230, 44, 5, NULL, '<iframe src=\"https://mega.nz/embed/1G92HRCK#3iEAt-7kiETMu9REiaHCbpp4yVqWPKTs2GmN0YsXhk4\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(231, 44, 6, NULL, '<iframe src=\"https://mega.nz/embed/JmdzgR4C#qFTCZc9YYKy6drHHNHFG6gjhWQ5faHr6E47G5YPqesY\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(232, 29, 1, NULL, '<iframe src=\"https://mega.nz/embed/BHVDibDL#rMmmfOiTljHK50SeBJZtAY4iqXDXpr1KZ8iFD7da3uk\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(233, 29, 2, NULL, '<iframe src=\"https://mega.nz/embed/ELUBkShS#yZlvo9yu75Ey6VClYYDDHtmfMLo-FefOUvkycKh0Y7Q\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(234, 29, 2, NULL, '<iframe src=\"https://mega.nz/embed/IG0WVRKR#EEmz28-JQ0-Hx468zrZPciStYFVHyYAv8o1qesLizPQ\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(235, 29, 4, NULL, '<iframe src=\"https://mega.nz/embed/AblRkCSL#UiKX0SAmVZfY4QXoDetSysE6fbpB028bKT0mIYevAMo\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(236, 29, 5, NULL, '<iframe src=\"https://mega.nz/embed/IOdUlLaD#Ilwt7PVM2HEdVRBPmr1sJg2NpvhFMA-P-RhZPyTmpHk\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(237, 29, 6, NULL, '<iframe src=\"https://mega.nz/embed/8eM2XRLZ#dHgXzrnXrEAMHxVYNPPSKIuOqVqfxTn6k0bh1Uw-upc\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(238, 23, 1, NULL, '<iframe src=\"https://mega.nz/embed/eApxkAJZ#lXUosefCo-2W-h9fRPqsBks2O3_PtpHpVDemc09MeBQ\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(239, 23, 2, NULL, '<iframe src=\"https://mega.nz/embed/tylzRTDR#vXddCHJUrT303YfF8av1vzog6Nqq9LKgegNdQT5BPxM\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(240, 23, 3, NULL, '<iframe src=\"https://mega.nz/embed/8AxDUKwb#C1d7yB46FkKK2mI5bsLK9LvjocU9kbPwY07fmPdAIrE\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(241, 23, 4, NULL, '<iframe src=\"https://mega.nz/embed/lIwhwQpJ#V8YEsYw6nQq6mcEEqgb3Y26b9ww0FodzimTPefiyTcw\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(242, 23, 5, NULL, '<iframe src=\"https://mega.nz/embed/wqFnHZqD#VtGWBbtbbb27QuIVUce56MuBoS9GzKCVSpUFg-SYdus\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(243, 23, 6, NULL, '<iframe src=\"https://mega.nz/embed/BI4hnCbZ#WTbQo4ax9Lu_t-fdV0TjCmQ2VJVVK3fFCO87tTLI-08\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(244, 43, 1, NULL, '<iframe src=\"https://mega.nz/embed/NC8zHbiD#d5NEU6KRWvWa-zP-Hf7LqB75FqpaoQhHDBg2v3rMsFA\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(245, 43, 2, NULL, '<iframe src=\"https://mega.nz/embed/QW8jiAwC#TX24uqoZ3fektWcEzpyMK1DPqWX3WbAAjzF_DC_eDk8\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(246, 43, 3, NULL, '<iframe src=\"https://mega.nz/embed/5HFQEAKY#95iLDfTS449Loy-t0lyxpsPBHdzlTiqeghATwlXaE0k\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(247, 43, 4, NULL, '<iframe src=\"https://mega.nz/embed/xOEAjKgR#3ptDoabot9qdQMPXjzVT9392yprQ7-gLdRVF1LB1Ze4\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(248, 43, 5, NULL, '<iframe src=\"https://mega.nz/embed/NfNAgBxY#Ua6A0glUHwcr12O_1Es0XU9-nnygPytXZV_A_USAfDc\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(249, 43, 6, NULL, '<iframe src=\"https://mega.nz/embed/wbEmhQjQ#OIEja-DoALLUDlgfUxj5wCFQjSW7WaQ2VKRncH9QzCU\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(250, 9, 1, NULL, '<iframe src=\"https://mega.nz/embed/g2EkhLbK#GFgG-OQ2GDkGfSBmfAU-abS-H4VJimQWEDaODR-fAkk\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(251, 9, 2, NULL, '<iframe src=\"https://mega.nz/embed/F70WjAxJ#zT1y-QWx5IDxF7rcu-cJHQj-erb1wtCWsbBh7Q858t0\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(252, 9, 3, NULL, '<iframe src=\"https://mega.nz/embed/xS9hwRQQ#-QQtDwH6GqURAyHiTvthTUGnwvmQOZO3SsoWcjnoJJw\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(253, 9, 4, NULL, '<iframe src=\"https://mega.nz/embed/tPFVFLYR#jKgquKUOVXl6-sxNPqQbr7e7xjsr-9ArTh6RTZiJlWA\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(254, 9, 5, NULL, '<iframe src=\"https://mega.nz/embed/pDsHiaIa#OV4tk9jw64QoO9j8NZQd-9A5_Hs8jgcKMtp9FAARGR8\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(255, 9, 6, NULL, '<iframe src=\"https://mega.nz/embed/crUizQZK#sX6XPPHKqskaLnd63UU4lDl5UTT2MLtKZ749Xtwi83M\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(256, 9, 7, NULL, '<iframe src=\"https://mega.nz/embed/16dQWAqZ#eFnZK00NceYUZJcnEM1d3amRZQfh8j7wM25Qq-4AQQo\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(257, 9, 8, NULL, '<iframe src=\"https://mega.nz/embed/InkQhYia#cKb3KBfNwxbG6-wsYM_SL6IePlmwF7DIWB8_LU9lX0A\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(258, 9, 9, NULL, '<iframe src=\"https://mega.nz/embed/4zEA3CgI#U8NWGtooFwLG_sIPHMnFDif9hlfWqA8rN00etV7kscM\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(259, 9, 10, NULL, '<iframe src=\"https://mega.nz/embed/sfU22ZxR#gXr9_Jtmv1DY2106vhi1X1aN5kBYEedOrNsKZVOV9Hs\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(260, 9, 11, NULL, '<iframe src=\"https://mega.nz/embed/tKNVXBgL#R7hwvwAEAfVZNVXx2rD6l8nD1yYO5siHCjz-597jilU\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(261, 11, 1, NULL, '<iframe src=\"https://mega.nz/embed/4Htk2RgA#kBb0nNIIJiOZYcClwRmSAmWO-qljwlPgpgjuTilRcoE\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL);
INSERT INTO `episodios` (`id`, `id_anime`, `numero_episodio`, `titulo`, `embed_code`, `fecha_publicacion`) VALUES
(262, 11, 2, NULL, '<iframe src=\"https://mega.nz/embed/9CVjxIRJ#suYaujR65YCeYNW8QkUxQb2AXqtPfcm8W_epBZ5baNI\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(263, 11, 3, NULL, '<iframe src=\"https://mega.nz/embed/0rs3GCiS#hPTJymiDdTMqycbJCuqDSDRyDQ2X3KRAAIEZhyTg_S0\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(264, 11, 4, NULL, '<iframe src=\"https://mega.nz/embed/oeVE1arD#GhGhTAjTgm_oZpQZZnLu5LMJbYue7VL-ZWcry51amss\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(265, 11, 5, NULL, '<iframe src=\"https://mega.nz/embed/AzcFiAKQ#kvnEum1HrxSYIHvxpCsOvjEZbD3yZquqnVLSBOojRf0\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(266, 11, 6, NULL, '<iframe src=\"https://mega.nz/embed/t7EAkRAA#wfk2Cz96cIByWG3aGEZXGMeQ_C6x5LXuMZdisK9hWy4\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(267, 21, 1, NULL, '<iframe src=\"https://mega.nz/embed/oXlzVaJI#blIGtiZn4OmCx3k4co4BGA8ecbRMnngw99pFzxgJeVc\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(268, 21, 2, NULL, '<iframe src=\"https://mega.nz/embed/AOtj2L5a#D15xpdWlD6HHhjtWo7Voofw7AvOSx-lfa57WX0pEIUI\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(269, 21, 3, NULL, '<iframe src=\"https://mega.nz/embed/of0klToa#ERnKZXjui-8E7Uxzjktq3dbMQRSIR-r37GhtxlYB74E\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(270, 21, 4, NULL, '<iframe src=\"https://mega.nz/embed/Qi1gARaA#rD1Jd76UrpKwyGtii_0J4ofm9Ilt5xM-pIS8fNU75YU\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(271, 21, 5, NULL, '<iframe src=\"https://mega.nz/embed/Bb8z3ZBY#e8NP1GNla7DuZZ_XImXzwbLpnSxz5XBSz3t6JcMd86g\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(272, 21, 6, NULL, '<iframe src=\"https://mega.nz/embed/B6FE0QbC#X8k_a4oSO4H23SlFnRCBa7WCOeZGZDtOqIVJ3tpRQwQ\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(273, 32, 1, NULL, '<iframe src=\"https://mega.nz/embed/thlBUTaJ#eLlv0jK3jz54HRQTb12IrC3VUwkMvcrLDoyYBFEclR4\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(274, 32, 2, NULL, '<iframe src=\"https://mega.nz/embed/d9kUgLoD#6Z7JvuecnjtBeAUw3FY-3RzCBfCTnJm3ZO_Ky9Fegjg\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(275, 32, 3, NULL, '<iframe src=\"https://mega.nz/embed/gstmjb4Q#L6sAt-zKPuujza31kOGT56aF7hvVmvhIWdhKJRGE0ag\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(276, 32, 4, NULL, '<iframe src=\"https://mega.nz/embed/9scHVYaJ#T-lE0HPut6AcjwE6fwFo0yKzRE6Ob7hLvCuSmZyGL8w\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(277, 32, 5, NULL, '<iframe src=\"https://mega.nz/embed/85dlRCKb#WYikN10kIcDdKHhNZtDSNt9o48K83BC8HoIH2b67beA\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(278, 32, 6, NULL, '<iframe src=\"https://mega.nz/embed/Rocz2JRR#PpyQMF8CNv5v1fPZHWmCl9rMhXOX2wexN6vVLxWB14E\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(279, 41, 1, NULL, '<iframe src=\"https://mega.nz/embed/gPsmkIKK#ZeP88QOCQGbG112QtTWusEdGvIBEb0HGlTjkg-0sS0w\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(280, 41, 2, NULL, '<iframe src=\"https://mega.nz/embed/xDMxDQSL#SFaBtyhbCW9mlUOM8I33RYpDlHqJ9l0y9ROHTRKll0c\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(281, 41, 3, NULL, '<iframe src=\"https://mega.nz/embed/NL0j2Joa#AGcQTpAA0cqfawEjv8L9J4x4VrjLsRgtd2fFZAeMBDo\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(282, 41, 4, NULL, '<iframe src=\"https://mega.nz/embed/NC9lBCRI#ol5Sa6Us0o8_1wBnNWwLuBvAHJMQkxNARiqHd3Hr48c\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(283, 41, 5, NULL, '<iframe src=\"https://mega.nz/embed/lDk1jJiB#OCHxmmwUXRraWgj273Cx_Cg55Y_AzhHVqFaDxo-BvMw\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(284, 41, 6, NULL, '<iframe src=\"https://mega.nz/embed/xS9wXRqZ#anPoWJ2mMoowHYoiaByxl-5j3kL6GEjJcQ42HnVyVRk\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(285, 46, 1, NULL, '<iframe src=\"https://mega.nz/embed/490lhIiR#NvtbmGdsG0y16HKEZ9zOfZYj-qHtM4uWVw4y9yU7edM\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(286, 46, 2, NULL, '<iframe src=\"https://mega.nz/embed/c8tF1KYB#nxf1X-UXp5BZ0d7ldWA7k2cplZEgk49lVuMPWMsPDOQ\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(287, 46, 3, NULL, '<iframe src=\"https://mega.nz/embed/YoshxIDL#Nj28HvXRcDLzVU6KA1_jpdYy05vPvyGxJtEy64_6Ul8\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(288, 46, 4, NULL, '<iframe src=\"https://mega.nz/embed/pw8z3A6I#xaJ7qe4J_pDEKNsTmrstqUtlthLK9dBdDsgBdlXw8aM\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(289, 46, 5, NULL, '<iframe src=\"https://mega.nz/embed/gxshSQRb#-Pnn8FnaSAdyFKoCwmfMuOQRDbz3xF1xvMnXvCsGZQI\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(290, 46, 6, NULL, '<iframe src=\"https://mega.nz/embed/R11nFYYB#PZ7kR7lws4eQq6kTVljfe3WfdWTYxiiQ9xjBRXVyW0s\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(291, 48, 1, NULL, '<iframe src=\"https://mega.nz/embed/EqcH1TzB#7wpzSCyq132WakhW-OyxNW-8i7ugsqjBD-slt618IfQ\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(292, 48, 2, NULL, '<iframe src=\"https://mega.nz/embed/BfMnxDKb#Oa5wXHq9OstjiJ_eI2au9cqWfrMyLOyLIJ2WDCxcOwk\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(293, 48, 3, NULL, '<iframe src=\"https://mega.nz/embed/lXkkBSSY#H0070kDSe_auutYou_nkz1mdI593ouFBir_P09R7UUg\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(294, 48, 4, NULL, '<iframe src=\"https://mega.nz/embed/0HFVCYZa#cqLiw4KsUK79CE1qjSRMJCFFqkRcvH5dNyjaaSrLRq0\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(295, 48, 5, NULL, '<iframe src=\"https://mega.nz/embed/QLNjECCZ#CkmohtkPfU5wNCAfFmCul5gAX9SR65N48gJr-QPHp9U\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(296, 48, 6, NULL, '<iframe src=\"https://mega.nz/embed/8fMEzIpS#L29ARb8QA3gJqU2neQOY1i-QHBk32ioJhaz-kOcDjng\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(297, 34, 1, NULL, '<iframe src=\"https://mega.nz/embed/ebJWyaSZ#-dbV1eLz1U43H-j6b-yp8dgCswzSgxK4QPNh8Luifjw\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(298, 34, 2, NULL, '<iframe src=\"https://mega.nz/embed/SaRCmSYK#hSizeJ7xO26N-ch0Ddrc1y9VrEbDGmvgoU8UdWPNNE4\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(299, 34, 3, NULL, '<iframe src=\"https://mega.nz/embed/Pk42zIpA#RA5p7J9AI7sx-rUvwTy8C_wY8RdgGzUHISyOeyzOqs8\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(300, 34, 4, NULL, '<iframe src=\"https://mega.nz/embed/DtMD1YoR#En8hdtGh8unXAwUi6B0Upb0vUX8lLjWYgoY9RJJELYQ\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(301, 34, 5, NULL, '<iframe src=\"https://mega.nz/embed/S4UDTASJ#D1E9egn0rvOPaiDbPDqlEcLqmOaci4uyD36Rj2Z_WVg\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(302, 34, 6, NULL, '<iframe src=\"https://mega.nz/embed/2kdDRaIT#4ZKNWKcQFfRR8m75r6PaFrsESNjtMRg8q9iC90DSVrs\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(303, 40, 1, NULL, '<iframe src=\"https://mega.nz/embed/hD8HUJwY#09SzX_qPM16xfGEUtiliyyBVSTwYgTQli42Qjxn0uaE\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(304, 40, 2, NULL, '<iframe src=\"https://mega.nz/embed/EGcjXarQ#oIh5j1RaNWNLQJg4uGi2-89jynhdK46-w-qDJT_8cpM\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(305, 40, 3, NULL, '<iframe src=\"https://mega.nz/embed/xPlxSIDL#8OrUQixQaBZX3K90NKX1kwPAlX51y_EupDcP-iBhHVE\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(306, 40, 4, NULL, '<iframe src=\"https://mega.nz/embed/hyVVhDqB#OGKoZzdnFHYSb-WHoMAa0gPgExO8IppRh5QI-TYCAmA\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(307, 40, 5, NULL, '<iframe src=\"https://mega.nz/embed/x7tiHAhQ#5RESciYssthDacKrEqktgRprVqm2xQk14g5kKdXKops\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(308, 40, 6, NULL, '<iframe src=\"https://mega.nz/embed/hKMUDAKJ#-vdi0QFUA0LLs81uqk0w6I8FYll4oFWcZ-Xk_Gct3NU\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(309, 47, 1, NULL, '<iframe src=\"https://mega.nz/embed/Q7USRDiT#M4vBIHTFdA2-mJ6ajPR-1RTaHHjkI-7awbO7XfwLp8E\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(310, 47, 2, NULL, '<iframe src=\"https://mega.nz/embed/tekm1AJQ#TtPMKejoqXjpKj4zfy0ExzoVi_JRNbbDxBHBueQVCs8\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(311, 47, 3, NULL, '<iframe src=\"https://mega.nz/embed/N60CXIIZ#sWJdICHwtUD-U17c_fZV48OETWiDgImll_KEVDykYPg\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(312, 47, 4, NULL, '<iframe src=\"https://mega.nz/embed/gS1VHQSC#z46HhsKKQQG9SBXEy2C6tMi4BQMEmIkCRaQrOYOHS-8\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(313, 47, 5, NULL, '<iframe src=\"https://mega.nz/embed/AqdRiThC#Ffkz5lv2HrxFCrMOrp4Q3YfvJpJ6zWs120NOYiOylWQ\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(314, 47, 6, NULL, '<iframe src=\"https://mega.nz/embed/FbswmbqL#8Q0kDTxcwru919TQqdIMuH5e6uBBHzAPj1t1t5c6RfU\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(315, 14, 1, NULL, '<iframe src=\"https://mega.nz/embed/EldHnKKI#8rEccIsOm9A5T-zBX_kJTawAyzZD2CbOBzkg3VgpsfE\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(316, 14, 2, NULL, '<iframe src=\"https://mega.nz/embed/o81CnC4b#Hx2t7y_f3ZXfTj9nvQocBaoDNhkLchiq4tNKSw742o8\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(317, 14, 3, NULL, '<iframe src=\"https://mega.nz/embed/8tE0kahY#440Yp89VeyUcFLbJ6ugASI0vtnKZLuML1RhEvy_RgX0\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(318, 14, 4, NULL, '<iframe src=\"https://mega.nz/embed/h4cUhTwL#1GAyTk6_ad-B6R22-zo1eH1bMQoTGy2MD8WB9iawn64\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(319, 14, 5, NULL, '<iframe src=\"https://mega.nz/embed/V9932B4Z#fKo9wMfkQV4GdDtbGx49iTu8cWaO10qufi6Itwgs_E4\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(320, 14, 6, NULL, '<iframe src=\"https://mega.nz/embed/Qr1ghTzZ#n9G2KCwQUHmY90KLeiKP0DT9pm92eJZnBD8ykNZzpFQ\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(322, 53, 1, NULL, '<iframe src=\"https://mega.nz/embed/97UmwDLb#69GWiCSPubDJF66TnMsKrQlDVkrzNT3afHuhyVIS_tE\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(323, 53, 2, NULL, '<iframe src=\"https://mega.nz/embed/IvdS3bpQ#yV4D4ufnz5jS7CN2aQrZNM3mcW_Xa8X2OImoqofbXYA\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(324, 53, 3, NULL, '<iframe src=\"https://mega.nz/embed/g69FVYxS#OzHByibRw1Ufg3WT5XHpNAZaUjJ5MFANOjUmxvtVlEk\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(325, 53, 4, NULL, '<iframe src=\"https://mega.nz/embed/1TUE1LJD#leSndQfhtjOurvSmsEc8shBLIrIwC1x-MBmsfX9g9j4\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(326, 53, 5, NULL, '<iframe src=\"https://mega.nz/embed/oSsFhZrC#OO8KlD11E2ggXlSAGJUyS4cC10GfKYIIaF7ssoDl5Iw\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(327, 53, 6, NULL, '<iframe src=\"https://mega.nz/embed/NCFDTDSC#i_CVtHYB97SxrE3_A0f6LLved_DnttFANh0igIYTWio\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(328, 27, 1, NULL, '<iframe src=\"https://mega.nz/embed/wp8UQD7K#8hJYgksxcVZhsQNAAFNmYR30U1SVfz3hugHG2W3orEQ\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(329, 27, 2, NULL, '<iframe src=\"https://mega.nz/embed/chFBGa4S#39M4aKbD2sssQ_wXNvZAQAejoqwG0VqTE5Z8AjEx0x4\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(330, 27, 3, NULL, '<iframe src=\"https://mega.nz/embed/5xEF2RJa#8z_Ysmd54JFNziS4glg9gY_pm_qW8go7ucV8NupJv0o\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(331, 27, 4, NULL, '<iframe src=\"https://mega.nz/embed/R99TyLIY#A5XwCEUBOZh3vtRITYGnpotn6F-3o8D1kgw0DmQ0Hhs\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(332, 27, 5, NULL, '<iframe src=\"https://mega.nz/embed/Noty0QiD#oJeHq-43FRI1r_A-MZ8mWHxgFiOHbzWkBcTEG4jbK_0\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(333, 27, 6, NULL, '<iframe src=\"https://mega.nz/embed/oPkDTQJA#0SziKpo_wGYSER5f5uwTumPUqWReyaFoB4bicZguKDU\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(334, 15, 1, NULL, '<iframe src=\"https://mega.nz/embed/FDNBTbha#BPjPdcupSSpchz550W7990KMf7xwHL_gu3F0x19RSI0\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(335, 15, 2, NULL, '<iframe src=\"https://mega.nz/embed/5WdnFaIb#bkPPKkd-QrgGfWcTIeMwmbax7u-df41MGhbwk_hvpDU\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(336, 15, 3, NULL, '<iframe src=\"https://mega.nz/embed/JH1WAbDA#UffEfZcEj6im6EojEBYsPsxJvm8dQg2dWW-6QFG6LB4\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(337, 15, 4, NULL, '<iframe src=\"https://mega.nz/embed/IeEzxBIL#Jfk5VlzF2UvHPZBXoR8yz-jvKuQlTQGlFIS0ZMfa0iI\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(338, 15, 5, NULL, '<iframe src=\"https://mega.nz/embed/BGdg1BBS#0H0FsARHbafHaItwW2djefSxwhNaKEuUPC5qfCNkoPc\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(339, 15, 6, NULL, '<iframe src=\"https://mega.nz/embed/9OkDVY7a#h8bXLnVGIYtzmcFCDRhINsRQozdxON1oMltSVMREBhw\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(340, 51, 1, NULL, '<iframe src=\"https://mega.nz/embed/lrN00BRD#Q2NdNW-6qq27q9pX_bGHQh-TeNGvYpl9oFwffxq0PvU\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(341, 51, 2, NULL, '<iframe src=\"https://mega.nz/embed/E6t1AawR#sgM99C_j8-T1nTwX56Z2zM7lAMUMxhQDUdbdGvKrhao\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(342, 51, 3, NULL, '<iframe src=\"https://mega.nz/embed/Bv912JoQ#1fr1v0RMozCwvE1ExaUy-ELam80TKMMlE_K5gvgQeKU\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(343, 51, 4, NULL, '<iframe src=\"https://mega.nz/embed/47lRUJra#Lgu10RFgF1KYDRCHCKNro2iquDTXFYlrtW2OYQmSrEI\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(344, 51, 5, NULL, '<iframe src=\"https://mega.nz/embed/h2EBXJrJ#Nc9433XteKsAgIb_DfWPrpePrXPUVMEknXMztYsTmro\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(345, 51, 6, NULL, '<iframe src=\"https://mega.nz/embed/h2kTnK7Y#0AayV0im14L7JvE8DRkwUqCh8WMYcLksJa3stJ9hwFc\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(346, 31, 1, NULL, '<iframe src=\"https://mega.nz/embed/hydVnT4T#i_PKT3_caW9NHc6Y7_rk3drYFrBAT2gO7JdkVYF1-8c\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(347, 18, 2, NULL, '<iframe src=\"https://mega.nz/embed/U2cnmSAK#1zPY9Nk2EKVZyeyFd0TrBgJYoUUy7w-FvHHUuQ97VY4\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(348, 31, 3, NULL, '<iframe src=\"https://mega.nz/embed/tSd0QTQT#x44ULQCI1he717L0_xVnCnAFRIs_0J_iDv4XGyzdpZ0\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(349, 31, 4, NULL, '<iframe src=\"https://mega.nz/embed/0vcnwarD#_XC7Bg4BKMM5r3i3PVP3phuKg5mLBGmNkCxyD703j9M\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(350, 31, 5, NULL, '<iframe src=\"https://mega.nz/embed/c2kUiBJa#at8jaq-2Cr3Ka_9etvReT3SC3J8C2F2ReL_rN9ReJ08\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(351, 31, 6, NULL, '<iframe src=\"https://mega.nz/embed/knVm3YJZ#w_n4vUaeh7CGUS3DwvPi2-Ir2WlWM3Q3Jp7QDId-FlA\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(352, 49, 1, NULL, '<iframe src=\"https://mega.nz/embed/138xBSaZ#XyM_wQvbVTiStiH0RpnnQQ5c1IA_0VG7un8WPlLEMBw\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(353, 49, 2, NULL, '<iframe src=\"https://mega.nz/embed/JfNBiQTA#mibcFwtEfU6JYCuxKzgciWn1jh_XoWAHmhX4_yiEN3Y\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(354, 49, 3, NULL, '<iframe src=\"https://mega.nz/embed/BLNWSKoJ#9xWq7t8kxpinb9fuq94FRfXF-Om-OJwY1ySw5Z3tt38\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(355, 49, 4, NULL, '<iframe src=\"https://mega.nz/embed/MHtTlBrZ#bUSI_bJ7ZGmVVXvTgFRkyaowGrEN3bH8vuvgzIrJB5k\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(356, 49, 5, NULL, '<iframe src=\"https://mega.nz/embed/wetUmJDa#QRvzMZIgnp_8Jo1WXzj2OpARPGOiDUXwpnq102qAebM\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(357, 49, 6, NULL, '<iframe src=\"https://mega.nz/embed/pmszWZjT#96efcCY-XZA6t53EabQIa2X4349cffAoGHpoZ9ChNcI\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(358, 42, 1, NULL, '<iframe src=\"https://mega.nz/embed/arI3wayA#hSzqrNMvxga-6tWbUAZYjUAk0TAoF40INwU1oxjjVBk\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(359, 42, 2, NULL, '<iframe src=\"https://mega.nz/embed/DjRDwKST#JnA2R-T1ygCRwdb2fwkO5pjdWpSdYsP51sy0__jfdCg\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(360, 42, 3, NULL, '<iframe src=\"https://mega.nz/embed/a3QFlShS#Dj_FGKuBYil637C67tEIAGeKopHL0jrtVstTgF3-iTs\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(361, 42, 4, NULL, '<iframe src=\"https://mega.nz/embed/m1gS3SiL#SBuRKrXhKM1AICajEBhCjaridX2V67uS7AizFuVdZM4\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(362, 42, 5, NULL, '<iframe src=\"https://mega.nz/embed/66QRTS6B#Izsuk6DSvxMa52ar0sgDHnX-rvkwPzPYkE28ugPwGzA\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(363, 42, 6, NULL, '<iframe src=\"https://mega.nz/embed/juQxnSIJ#ORjRfWJRA9TI_KvaYhR5V42pFZMsZf9huufudWAbf8A\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(364, 20, 1, NULL, '<iframe src=\"https://mega.nz/embed/sjcCARiQ#JmOwcM3eEamfmtdFqJyFoS-CB4nMrfznr3IbeTVn8HE\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(365, 20, 2, NULL, '<iframe src=\"https://mega.nz/embed/0X9AXAgR#wgfqyKuh5qAq6raS2IrhDuVFjLiI2HSBrSufNfTC6XQ\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(366, 20, 3, NULL, '<iframe src=\"https://mega.nz/embed/0X9AXAgR#wgfqyKuh5qAq6raS2IrhDuVFjLiI2HSBrSufNfTC6XQ\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(367, 20, 4, NULL, '<iframe src=\"https://mega.nz/embed/QLcEVbwT#t1BvIBFc_9APH1DaPmTScc_Px4GCqEd81IGL6T81mC0\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(368, 20, 5, NULL, '<iframe src=\"https://mega.nz/embed/cG9CGSCB#2SxflcjS8R-5N567k8bpJnbJ-QoO7yIIFDfMR4zJ8cg\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(369, 20, 6, NULL, '<iframe src=\"https://mega.nz/embed/RSlhARAB#Hus3N_f98yVLo3t50imTqk4GzwvrbADk8n5cRsjHGVk\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(370, 56, 1, NULL, '<iframe src=\"https://mega.nz/embed/SihGhAzb#mI_B-5nj_zh6eUr2vvlwkvm198U5rxGIJ-OX4rNWJcg\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(371, 56, 2, NULL, '<iframe src=\"https://mega.nz/embed/SZYFUCrL#asIL04RcUKqkcZNZXAdT5h8wyRjIgfId1ptu8gEzQPw\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(372, 56, 3, NULL, '<iframe src=\"https://mega.nz/embed/mdIHRAzA#VeO_BzKJn0x2Fxqy16XMqmRJpWDEcuL8W6aVshc6QUk\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(373, 56, 4, NULL, '<iframe src=\"https://mega.nz/embed/fAIXkCCQ#1484TfiDYoL3GHlFtsijy2odpGwSQaBOQj4czURSurQ\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(374, 56, 5, NULL, '<iframe src=\"https://mega.nz/embed/ORAjwYaZ#sslaMm-_-NDPv5NS4jBuTvYG4qWEQ5s0VWW9b8-WDmU\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(375, 56, 6, NULL, '<iframe src=\"https://mega.nz/embed/qRYVAIBY#MwEVuwizh0G92aZCr1WeMtk8Zw-GVqQk48QkFd83Ia8\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(376, 28, 1, NULL, '<iframe src=\"https://mega.nz/embed/cP9TDQST#Ib_SZMOPxjqpmqAkeVLdiEMam6U9buFHsvWMmg4m3sI\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(377, 28, 2, NULL, '<iframe src=\"https://mega.nz/embed/QSkXHJ5C#8_IA7GfSwAs_VVza53ulTYFwP-ueXg-Kw8iONciPuM4\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(378, 28, 3, NULL, '<iframe src=\"https://mega.nz/embed/BDtWRYwR#bINw9CbzDNsb61j6j5KVdk7VqWIkpcu7p_g78jXMyxw\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(379, 28, 4, NULL, '<iframe src=\"https://mega.nz/embed/QDc3wKYD#vB3m1VYvdr2bKE6RdYBeA0ahd-L242GnTKkq3_PBOE8\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(380, 28, 5, NULL, '<iframe src=\"https://mega.nz/embed/5n0CBQIb#lHQbMUBPN3hSqW20Jtk39ngF9UnMejOgJYLQscD9bPQ\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(381, 28, 6, NULL, '<iframe src=\"https://mega.nz/embed/4vM1WQ6L#XwI98ys5J0p7m5oal5Yrvkf6ft3ni8qepApO5XYDD90\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(382, 16, 1, NULL, '<iframe src=\"https://mega.nz/embed/tntFiZRT#JJYrEJRjDScVgcD7zT-mJFqLONKs20O7o7LLpJ43t4A\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(383, 16, 2, NULL, '<iframe src=\"https://mega.nz/embed/t3szmBBL#PhNAXu-V62RkQugrL1BQOwIxl_kvveUcvm9KkZF7rGo\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(384, 16, 3, NULL, '<iframe src=\"https://mega.nz/embed/Er9yzAIQ#YuMlKfgHrsy5LDtbpcXr0Vq9UkfByVuhNgy8OPRWXeo\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(385, 16, 4, NULL, '<iframe src=\"https://mega.nz/embed/Nv9jyJBZ#LqKUUNtyGVWPJECiYxvVcTrL8dVNJDmHIoYzJXLz0ws\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(386, 16, 5, NULL, '<iframe src=\"https://mega.nz/embed/ouNyHQiA#VDRGBLEoJU9tvu5pkZaxH191MIA_oHDxeiVk5JNWu3I\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(387, 28, 6, NULL, '<iframe src=\"https://mega.nz/embed/w7kRwYAZ#3UUGvs9h7MYetCSscrsrfrFvJqD1s1J-yfLkLS2jj5k\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(388, 45, 1, NULL, '<iframe src=\"https://mega.nz/embed/sSEjiAyB#q-uZbL2m2SQAPkVTCxJrhaozXcYOvIW87ESiTW8apMs\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(389, 45, 2, NULL, '<iframe src=\"https://mega.nz/embed/5XdwUKpI#3YTEovAXssT2uOJEmhjOcEURzmRWNrbdYipNP1uq8Ok\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(390, 45, 3, NULL, '<iframe src=\"https://mega.nz/embed/J2EWVb5T#UVHmWo2MFUXm_K0DQXMrG7BwVumyjd0_B7c1sCn8UQE\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(391, 45, 4, NULL, '<iframe src=\"https://mega.nz/embed/o6sxQSqJ#nVkkABP3B-EGcbljIX0MQJqbfx3Z2MT4LlyunGcwgTY\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(392, 45, 5, NULL, '<iframe src=\"https://mega.nz/embed/YucHUBQS#OMIfT99X_HWl8BCE3KRgLN_m8puUUE9oecPkKHdoLLI\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL),
(393, 45, 6, NULL, '<iframe src=\"https://mega.nz/embed/UeNwzTTI#ctlSqNA_5Ji42DHm567uCY0UHGrvSRcq5ZrwU0DlGJU\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `favoritos`
--

CREATE TABLE `favoritos` (
  `user_id` int(11) NOT NULL,
  `anime_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `generos`
--

CREATE TABLE `generos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `generos`
--

INSERT INTO `generos` (`id`, `nombre`, `created_at`) VALUES
(1, 'Acción', '2025-04-19 23:39:48'),
(2, 'Aventura', '2025-04-19 23:39:48'),
(3, 'Comedia', '2025-04-19 23:39:48'),
(4, 'Drama', '2025-04-19 23:39:48'),
(5, 'Fantasía', '2025-04-19 23:39:48'),
(6, 'Ciencia Ficción', '2025-04-19 23:39:48'),
(7, 'Romance', '2025-04-19 23:39:48'),
(8, 'Sobrenatural', '2025-04-19 23:39:48'),
(9, 'Misterio', '2025-04-19 23:39:48'),
(10, 'Terror', '2025-04-19 23:39:48'),
(11, 'Escolares', '2025-04-19 23:39:48'),
(12, 'Seinen', '2025-04-19 23:39:48'),
(13, 'Shounen', '2025-04-19 23:39:48'),
(14, 'Shoujo', '2025-04-19 23:39:48'),
(15, 'Deportes', '2025-04-19 23:39:48'),
(16, 'Mecha', '2025-04-19 23:39:48'),
(17, 'Musical', '2025-04-19 23:39:48'),
(18, 'Isekai', '2025-04-19 23:39:48'),
(19, 'Cyberpunk', '2025-04-19 23:39:48'),
(20, 'Gore', '2025-04-19 23:39:48'),
(21, 'Harem', '2025-04-19 23:39:48'),
(22, 'Josei', '2025-04-19 23:39:48'),
(23, 'Psicológico', '2025-04-19 23:39:48'),
(24, 'Recuentos de la vida', '2025-04-19 23:39:48'),
(25, 'Slice of Life', '2025-04-19 23:39:48'),
(26, 'Vampiros', '2025-04-19 23:46:48'),
(27, 'Zombies', '2025-04-19 23:46:48'),
(28, 'Superpoderes', '2025-04-19 23:46:48'),
(29, 'Artes Marciales', '2025-04-19 23:46:48'),
(30, 'Samuráis', '2025-04-19 23:46:48'),
(31, 'Histórico', '2025-04-19 23:46:48'),
(32, 'Militar', '2025-04-19 23:46:48'),
(33, 'Tragedia', '2025-04-19 23:46:48'),
(34, 'Magia', '2025-04-20 23:08:55'),
(35, 'Juegos', '2025-04-20 23:08:55'),
(36, 'Carreras', '2025-04-20 23:08:55'),
(37, 'Demencia', '2025-04-20 23:08:55'),
(38, 'Demonios', '2025-04-20 23:08:55'),
(39, 'Ecchi', '2025-04-20 23:08:55'),
(40, 'Espacial', '2025-04-20 23:08:55'),
(41, 'Parodia', '2025-04-20 23:08:55'),
(42, 'Policia', '2025-04-20 23:08:55'),
(43, 'Suspenso', '2025-04-20 23:08:55'),
(44, 'Yuri', '2025-04-22 02:26:50');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mangas`
--

CREATE TABLE `mangas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  `portada` varchar(255) DEFAULT NULL,
  `estado` enum('En emisión','Finalizado','Próximamente') DEFAULT NULL,
  `fecha_publicacion` date DEFAULT NULL,
  `descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `mangas`
--

INSERT INTO `mangas` (`id`, `nombre`, `imagen`, `portada`, `estado`, `fecha_publicacion`, `descripcion`) VALUES
(1, 'Jujutsu Kaisen', 'uploads/mangas/Jujutsu Kaisen/portada1.jpg', 'uploads/mangas/Jujutsu Kaisen/portada1.1.jpg', 'En emisión', NULL, 'Yuji Itadori es un joven con habilidades físicas excepcionales que se ve arrastrado al mundo de las maldiciones. Después de encontrar un poderoso objeto maldito, se ve obligado a unirse a la escuela Jujutsu para entrenar como hechicero y combatir estas criaturas oscuras. A medida que descubre secretos y enfrenta desafíos, Yuji debe tomar decisiones que podrían cambiar su vida para siempre.'),
(2, 'Angel Beats', 'uploads/mangas/Angel Beats/cover.jpg', 'uploads/mangas/Angel Beats/fondo.jpg', 'Finalizado', NULL, 'Una historia conmovedora ambientada en el más allá, donde jóvenes con traumas no resueltos luchan contra su destino. Con acción, drama y comedia, \"Angel Beats\" mezcla emoción y batallas en una escuela especial para almas perdidas.'),
(3, 'Another', 'uploads/mangas/Another/cover.jpg', 'uploads/mangas/Another/fondo.png', 'Finalizado', NULL, 'Una serie de misterio y terror que sigue a un estudiante transferido que descubre una maldición mortal en su clase. A medida que los alumnos empiezan a morir, él y sus compañeros intentan desentrañar un oscuro secreto.'),
(4, 'Blend S', 'uploads/mangas/Blend S/cover.jpg', 'uploads/mangas/Blend S/fondo.png', 'Finalizado', NULL, 'Una comedia ligera centrada en un café temático donde cada camarera tiene una personalidad “especial” para entretener a los clientes. La protagonista, Maika, debe interpretar a una chica sádica… aunque es todo lo contrario.'),
(5, 'Blue Lock', 'uploads/mangas/Blue Lock/cover.jpg', 'uploads/mangas/Blue Lock/fondo.jpg', 'En emisión', NULL, 'Después de una humillante derrota en el Mundial, Japón busca al mejor delantero egoísta a través del polémico programa Blue Lock. Una competencia intensa donde solo el más hambriento por anotar podrá triunfar.'),
(6, 'Chainsaw Man', 'uploads/mangas/Chainsaw Man/cover.jpg', 'uploads/mangas/Chainsaw Man/fondo1.jpg', 'En emisión', NULL, 'Denji, un joven cazador de demonios con deudas, es traicionado y muere… solo para renacer con una motosierra como corazón. Ahora, como Chainsaw Man, enfrenta amenazas sobrenaturales mientras busca una vida normal.'),
(7, 'Dandadan', 'uploads/mangas/Dandadan/cover.jpg', 'uploads/mangas/Dandadan/fondo.png', 'En emisión', NULL, 'Una aventura sobrenatural que combina lo paranormal, lo absurdo y lo emocionante. Momo y Okarun enfrentan fantasmas, alienígenas y entidades extrañas en un manga lleno de humor, romance y acción explosiva.'),
(8, 'Edens Zero', 'uploads/mangas/Edens Zero/cover.jpg', 'uploads/mangas/Edens Zero/fondo.jpg', 'Finalizado', NULL, 'Una aventura espacial épica de Hiro Mashima que sigue a Shiki y sus amigos mientras exploran el universo en busca de Mother.'),
(9, 'Horimiya', 'uploads/mangas/Horimiya/cover.jpg', 'uploads/mangas/Horimiya/fondo.jpg', 'Finalizado', NULL, 'Una historia tierna y divertida sobre las relaciones de pareja en la vida escolar, con un enfoque en la doble vida de los protagonistas.'),
(10, 'Jigokuraku', 'uploads/mangas/Jigokuraku/cover.jpg', 'uploads/mangas/Jigokuraku/fondo.jpg', 'Finalizado', NULL, 'Un ninja condenado a muerte y una verdugo viajan a una isla misteriosa en busca del elixir de la vida, enfrentando horrores sobrenaturales.'),
(11, 'Kage no Jitsuryokusha ni Naritakute', 'uploads/mangas/Kage no Jitsuryokusha ni Naritakute!/cover.jpg', 'uploads/mangas/Kage no Jitsuryokusha ni Naritakute!/fondo.jpg', 'En emisión', NULL, 'Un joven obsesionado con operar desde las sombras vive su fantasía en un mundo de magia... sin saber cuán real se vuelve.'),
(12, 'Kimetsu no Yaiba', 'uploads/mangas/Kimetsu no Yaiba/cover.jpg', 'uploads/mangas/Kimetsu no Yaiba/fondo.jpg', 'Finalizado', NULL, 'Tanjiro Kamado lucha contra demonios tras perder a su familia, decidido a salvar a su hermana Nezuko convertida en uno de ellos.'),
(13, 'Kusuriya no Hitorigoto', 'uploads/mangas/Kurusiya no Hitorigoto/cover1.jpg', 'uploads/mangas/Kurusiya no Hitorigoto/fondo.jpg', 'En emisión', NULL, 'Maomao, una farmacéutica inteligente, se ve envuelta en los misterios de la corte imperial al aplicar su conocimiento médico.'),
(14, 'Lycoris Recoil', 'uploads/mangas/Lycoris Recoil/cover.jpg', 'uploads/mangas/Lycoris Recoil/fondo.jpg', 'Finalizado', NULL, 'Chisato y Takina, agentes encubiertas de una organización secreta, enfrentan misiones mientras desarrollan una estrecha amistad.'),
(15, 'Mashle', 'uploads/mangas/Mashle/cover.jpg', 'uploads/mangas/Mashle/fondo.jpg', 'Finalizado', NULL, 'En un mundo donde la magia lo es todo, Mash, sin magia pero con fuerza bruta, busca convertirse en un Visionario Divino.'),
(16, 'Oshi no Ko', 'uploads/mangas/Oshi no Ko/cover.jpg', 'uploads/mangas/Oshi no Ko/fondo.jpg', 'En emisión', NULL, 'Una mirada oscura y compleja al mundo del entretenimiento japonés, con misterio, drama y reencarnaciones inesperadas.'),
(17, 'Rakudai Kishi no Cavalry', 'uploads/mangas/Rakudai Kishi/cover.jpg', 'uploads/mangas/Rakudai Kishi/fondo.gif', 'Finalizado', NULL, 'Ikki Kurogane, un caballero sin talento mágico, demuestra su valía con esfuerzo y determinación en un torneo escolar.'),
(18, 'Re:Zero kara Hajimeru Isekai Seikatsu', 'uploads/mangas/Re.Zero kara Hajimeru Isekai Seikatsu/cover.jpg', 'uploads/mangas/Re.Zero kara Hajimeru Isekai Seikatsu/fondo.jpg', 'En emisión', NULL, 'Subaru es transportado a otro mundo donde cada muerte lo regresa al pasado, enfrentando retos mentales y emocionales.'),
(19, 'Solo Leveling', 'uploads/mangas/Solo leveling/cover.jpg', 'uploads/mangas/Solo leveling/fondo.jpg', 'Finalizado', NULL, 'Jin-Woo, un cazador débil, obtiene una habilidad única que le permite subir de nivel solo, volviéndose imparable.'),
(20, 'Sono Bisque Doll wa Koi wo Suru', 'uploads/mangas/Sono Bisque Doll Wa Koi wo Suru/cover.jpg', 'uploads/mangas/Sono Bisque Doll Wa Koi wo Suru/fondo.jpg', 'En emisión', NULL, 'Un joven artesano conoce a una extrovertida fan del cosplay, y juntos descubren el valor de aceptar sus pasiones.'),
(21, 'Sousou no Frieren', 'uploads/mangas/Sousou no Frieren/cover.jpg', 'uploads/mangas/Sousou no Frieren/fondo.jpg', 'En emisión', NULL, 'Después de la victoria sobre el Rey Demonio, la elfa maga Frieren emprende un viaje para comprender mejor la vida y los sentimientos humanos.'),
(22, 'Spy x Family', 'uploads/mangas/Spy x Family/cover.jpg', 'uploads/mangas/Spy x Family/fondo.jpg', 'En emisión', NULL, 'Un espía, una asesina y una telépata forman una familia falsa para cumplir sus misiones, con resultados inesperadamente conmovedores.'),
(23, 'Tokyo Ghoul', 'uploads/mangas/Tokyo Goul/cover.jpg', 'uploads/mangas/Tokyo Goul/fondo.jpg', 'Finalizado', NULL, 'Kaneki se convierte en mitad ghoul tras un accidente y debe aprender a vivir entre humanos y monstruos con su nueva identidad.'),
(24, 'Yesterday wo Utatte', 'uploads/mangas/Yesterday wo Utate/cover.jpg', 'uploads/mangas/Yesterday wo Utate/fondo.jpg', 'Finalizado', NULL, 'Una historia melancólica sobre amor no correspondido, juventud y encontrar un propósito en la vida adulta.'),
(25, 'Yofukashi no Uta', 'uploads/mangas/Yofukashi no Uta/cover.jpg', 'uploads/mangas/Yofukashi no Uta/fondo.jpg', 'En emisión', NULL, 'Un joven insomne conoce a una misteriosa vampiresa que lo lleva a descubrir la libertad de la noche y el deseo de convertirse en vampiro.'),
(26, 'Zom 100', 'uploads/mangas/zoom 100/cover.png', 'uploads/mangas/zom100/fondo.jpg', 'En emisión', NULL, 'Akira decide vivir su vida al máximo haciendo una lista de cosas que siempre quiso hacer, todo durante un apocalipsis zombi.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `manga_capitulos`
--

CREATE TABLE `manga_capitulos` (
  `id` int(11) NOT NULL,
  `id_manga` int(11) DEFAULT NULL,
  `nombre_capitulo` varchar(255) DEFAULT NULL,
  `enlace_pdf` varchar(500) DEFAULT NULL,
  `capitulo_inicio` int(11) DEFAULT NULL,
  `capitulo_fin` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `manga_capitulos`
--

INSERT INTO `manga_capitulos` (`id`, `id_manga`, `nombre_capitulo`, `enlace_pdf`, `capitulo_inicio`, `capitulo_fin`) VALUES
(141, 6, 'Tomo 1', 'https://drive.google.com/file/d/17pmtiwFj3FcBV-QaXw1vJar6V3qH6T6h/view', 1, 7),
(142, 5, 'Tomo 1', 'https://drive.google.com/file/d/17Rp8DnnDtDslmvVJckA285jgTeUA4opZ/view', 1, 4),
(143, 5, 'Tomo 2', 'https://drive.google.com/file/d/1SJq_Xb4A3xHNbTjwuRs0k9pMao1YmvMq/view', 5, 13),
(145, 5, 'Tomo 3', 'https://drive.google.com/file/d/1zPEIBITh8rXusCF2EtYpwVsNj50xSO-f/view', 14, 22),
(146, 5, 'Tomo 4', 'https://drive.google.com/file/d/11YUcVJ1AuaM-ZtiXXTf3gpJVSscuBYLE/view', 23, 31),
(147, 5, 'Tomo 5', 'https://drive.google.com/file/d/1Z6pK0J6phMBj5LnJDmAPZTBgFn1yJmxC/view', 32, 40),
(148, 6, 'Tomo 2', 'https://drive.google.com/file/d/1aYDxq445h1wACNVQRjwFVyNbPbDXvUL9/view', 8, 16),
(149, 6, 'Tomo 3', 'https://drive.google.com/file/d/1wIIHkPoouPrhM_hnOrGoPPdSbXQhG40x/view', 17, 25),
(150, 6, 'Tomo 4', 'https://drive.google.com/file/d/1Yy4JPrYcM7pbn1tBJPRn5fajuOvhYgwW/view', 26, 34),
(151, 6, 'Tomo 5', 'https://drive.google.com/file/d/1UwEr2EapeZpeRcBZSutyFJxd19bz6lp7/view', 35, 43),
(152, 10, 'Tomo 1', 'https://drive.google.com/file/d/1voITE4vTrqNlrE28jt1Ogym_JQwwCTa4/view', 1, 10),
(153, 10, 'Tomo 2', 'https://drive.google.com/file/d/1wxp55OrprlEye1pdbkoULHQAF3TELSSi/view', 11, 20),
(154, 10, 'Tomo 3', 'https://drive.google.com/file/d/1gRTV0mFC2DzftX1KakP9goc3XB79Qq7U/view', 21, 32),
(155, 12, 'Tomo 1', 'https://drive.google.com/file/d/17y2xSTsOi29BZpZkMhau4lvVdcvpa50m/view', 1, 7),
(156, 12, 'Tomo 2', 'https://drive.google.com/file/d/1JSKaXtQGD-ngsuaP5J2RyttSdTnZNYlv/view?usp=drive_link', 8, 16),
(157, 12, 'Tomo 3', 'https://drive.google.com/file/d/1sbBqtLsEnwmLcHQ-vpF8v3O5uGvyMGFe/view?usp=drive_link', 17, 25),
(158, 12, 'Tomo 4', 'https://drive.google.com/file/d/1sbBqtLsEnwmLcHQ-vpF8v3O5uGvyMGFe/view?usp=drive_link', 26, 34),
(159, 12, 'Tomo 5', 'https://drive.google.com/file/d/17KfkulV_M-Z-2ilD2sP2FmrYYxkpA9IA/view?usp=drive_link', 35, 43),
(160, 13, 'Tomo 1', 'https://drive.google.com/file/d/13ensw_A67G4vfw3SAexUQNFdT9Q5LenT/view?usp=drive_link', 1, 4),
(161, 13, 'Tomo 2', 'https://drive.google.com/file/d/17smgSlFfvDPXvuoQDK4liD-MCXxLZqpt/view?usp=drive_link', 5, 8),
(162, 13, 'Tomo 3', 'https://drive.google.com/file/d/16dMY2vePM-_hfW-4gSQWZ8P8lYmT3ny2/view?usp=drive_link', 9, 14),
(163, 13, 'Tomo 4', 'https://drive.google.com/file/d/1nLKuHYVAo-FTjdHkodhvKA6cZsn1AZaa/view?usp=drive_link', 15, 20),
(164, 13, 'Tomo 5', 'https://drive.google.com/file/d/10-AFYJmY3lYJkCx5EmRAS5CBcYb6eolP/view?usp=drive_link', 21, 26),
(165, 16, 'Tomo 1', 'https://drive.google.com/file/d/1OF4HnnlAzddAASXU5IyDJZ8JFzC1dxVu/view?usp=drive_link', 1, 10),
(166, 16, 'Tomo 2', 'https://drive.google.com/file/d/12wnEEpnQjZITJPyy8QI_mMcjKpRxwGIO/view?usp=drive_link', 11, 20),
(167, 16, 'Tomo 3', 'https://drive.google.com/file/d/1XA5KcWAwxOz30m3-8sCUeJlZp34tIv3S/view?usp=drive_link', 21, 30),
(168, 16, 'Tomo 4', 'https://drive.google.com/file/d/1Ndb1fWT2vROSHVv6WrSzbnsNXk2-HoG2/view?usp=drive_link', 31, 39),
(169, 16, 'Tomo 5', 'https://drive.google.com/file/d/1ccCnyNCGGCvVUJCEhlQSCmX8Lk7aJuYL/view?usp=drive_link', 40, 48),
(170, 2, 'Tomo 1', 'https://drive.google.com/file/d/1xfLCZYPoAdgGNvFi2CJG7UhJEqL_KYC3/view?usp=drive_link', 1, 12),
(171, 2, 'Tomo 2', 'https://drive.google.com/file/d/1YHg1ozFovotczB9MHbZpTyTlVAlYPew2/view?usp=drive_link', 11, 0),
(172, 2, 'Tomo 3', 'https://drive.google.com/file/d/1gTf52qBK9w3n9ygMl3B91pnc7PuHqYd0/view?usp=drive_link', 21, 33),
(173, 3, 'Tomo 1', 'https://drive.google.com/file/d/1O6E-5n5Gup2yUQu10auXLWSm7ZTI8500/view?usp=drive_link', 1, 0),
(174, 3, 'Tomo 2', 'https://drive.google.com/file/d/1UOg6FHfmDN_MyN5fp0N65wrfKgHaJVPZ/view?usp=drive_link', 2, 0),
(175, 3, 'Tomo 3', 'https://drive.google.com/file/d/1N4ZMVqiV2PStr_sYC_8DwZH6CDJa2pR-/view?usp=drive_link', 3, 0),
(176, 3, 'Tomo 4', 'https://drive.google.com/file/d/1TgihxOeBtACWMtXLUgXVXOBe80AnGYXh/view?usp=drive_link', 4, 0),
(177, 4, 'Tomo 1', 'https://drive.google.com/file/d/19nZlkaw-Cdqxy231d4R4-jvNXCR-Ut2a/view?usp=drive_link', 1, 14),
(178, 4, 'Tomo 2', 'https://drive.google.com/file/d/1OYMw3xrTRYgDrH6R6bRcWRGi1Qp7Njjq/view?usp=drive_link', 15, 28),
(179, 4, 'Tomo 3', 'https://drive.google.com/file/d/1xgvlxvCcW1vAVsuNIwojB0K0YSc_vEAs/view?usp=drive_link', 29, 41),
(180, 7, 'Tomo 1', 'https://drive.google.com/file/d/19iU5ppQ47YFrkwEv7nAiNfxLRxoaihrb/view?usp=drive_link', 1, 6),
(181, 7, 'Tomo 2', 'https://drive.google.com/file/d/1wOR3KbWgsqjnXtWWpAglYfL2UY5t7Jic/view?usp=drive_link', 7, 15),
(182, 7, 'Tomo 3', 'https://drive.google.com/file/d/1-8R-Utps9sZcY6PLmoetAI8a09uXW0Af/view?usp=drive_link', 16, 23),
(183, 8, 'Tomo 1', 'https://drive.google.com/file/d/1il-EJOGbFPPNcxES2IZKCZFW-ltlhQVr/view?usp=drive_link', 1, 4),
(184, 8, 'Tomo 2', 'https://drive.google.com/file/d/1cpGRdXFtU-2Lw7VEAha4xsiCsrk1DpO8/view?usp=drive_link', 5, 14),
(185, 8, 'Tomo 3', 'https://drive.google.com/file/d/1nnUTWN3JDUiWPRjsmGpJGPrSwBO-Bi5P/view?usp=drive_link', 15, 23),
(186, 9, 'Tomo 1', 'https://drive.google.com/file/d/1pr17ydBe_tUvDvTm1wG4zDPjGyG2ca7i/view?usp=drive_link', 1, 10),
(187, 9, 'Tomo 2', 'https://drive.google.com/file/d/1EW09BuVT04G68wak9exkpVKBOlQhwaq3/view?usp=drive_link', 11, 20),
(188, 9, 'Tomo 3', 'https://drive.google.com/file/d/1Zz0_0wi7AUnxhw_XrVOwR0cqhD6jX-7l/view?usp=drive_link', 21, 30),
(192, 1, 'Tomo 1', 'https://drive.google.com/file/d/1xjD7DNIPtixR1dF-0ExfBOZWuxgH5RsL/view?usp=drive_link', 1, 7),
(193, 1, 'Tomo 2', 'https://drive.google.com/file/d/1QlTf2aqu8A8cZGab9mS6zniN9DQk3qXj/view?usp=drive_link', 8, 16),
(194, 1, 'Tomo 3', 'https://drive.google.com/file/d/1vTSbs-WHPJKXdzaYwDo6PEkjApYOanVG/view?usp=drive_link', 17, 25),
(195, 11, 'Tomo 1', 'https://drive.google.com/file/d/1W7lghzIfE6hZiAvI8bgVhwh4_enbssdv/view?usp=drive_link', 1, 5),
(196, 11, 'Tomo 2', 'https://drive.google.com/file/d/1yWXicTqeQodi0GNkyf_YMP4jF0my_jFF/view?usp=drive_link', 6, 10),
(197, 11, 'Tomo 3', 'https://drive.google.com/file/d/1QbSCjLtwvbjztHTm1_3aqJ6FzV8QqRKj/view?usp=drive_link', 11, 16),
(198, 14, 'Tomo 1', 'https://drive.google.com/file/d/1ccZE7Zct4GgPkVzqj-oywWW3-rlui56n/view?usp=drive_link', 1, 4),
(199, 14, 'Tomo 2', 'https://drive.google.com/file/d/1lyGwhFhfyX7n9CTqSnUcVCETN96BnGIt/view?usp=drive_link', 5, 8),
(200, 14, 'Tomo 3', 'https://drive.google.com/file/d/1HUn76OW86nqetUkQmTdSCEuoeeYZt4-Y/view?usp=drive_link', 9, 13),
(201, 15, 'Tomo 1', 'https://drive.google.com/file/d/1pXiMkTx4B4uJd8WSrJmqVoEleptv8Z5W/view?usp=drive_link', 1, 8),
(202, 15, 'Tomo 2', 'https://drive.google.com/file/d/1PPo6mnhQAhwt0_Abb1tc0P098hp503CL/view?usp=drive_link', 8, 15),
(203, 15, 'Tomo 3', 'https://drive.google.com/file/d/1WLajXlehmc4HqEaPCjBcqQtR_Lnpstgj/view?usp=drive_link', 16, 23),
(204, 17, 'Tomo 1', 'https://drive.google.com/file/d/1un6Pe3olBKrGu6RsAA1k62tyvn2gPLZF/view?usp=drive_link', 1, 4),
(205, 17, 'Tomo 2', 'https://drive.google.com/file/d/14g_TanHNSdNF34x1Fp_rCYobZBpD2FhX/view?usp=drive_link', 5, 8),
(206, 17, 'Tomo 3', 'https://drive.google.com/file/d/1KVzCUj1srhsruvHUCXyX-ce7NzNv4hfs/view?usp=drive_link', 9, 13),
(207, 18, 'Tomo 1', 'https://drive.google.com/file/d/1SprqNcfsI_S4hoseRncPbHZYBc1B1M8F/view?usp=drive_link', 1, 5),
(208, 18, 'Tomo 2', 'https://drive.google.com/file/d/1QTAn3EWZdPHgga3nvZ75Avy0mDkrkZES/view?usp=drive_link', 6, 10),
(209, 18, 'Tomo 3', 'https://drive.google.com/file/d/1wuIt-GwtgFhl-lASkzXmR6aCLLhlFwNq/view?usp=drive_link', 11, 15),
(210, 21, 'Tomo 1', 'https://drive.google.com/file/d/1gm-zv7-MN5c5i5mNKHkOHEdOgTprW48u/view?usp=drive_link', 1, 8),
(211, 21, 'Tomo 2', 'https://drive.google.com/file/d/1QUiUMobbdNpKoNT0MVpiVJl7uUg_wVt3/view?usp=drive_link', 9, 17),
(212, 21, 'Tomo 3', 'https://drive.google.com/file/d/1ndyLz6tea1EbCGEhYP6bakHRU6Y2e55M/view?usp=drive_link', 18, 27),
(213, 25, 'Tomo 1', 'https://drive.google.com/file/d/1yuDz78MEjjUPxDSbXy19Bu9M764z1P6F/view?usp=drive_link', 1, 0),
(214, 19, 'Tomo 1', 'https://drive.google.com/file/d/1xTFqX07ARN_yWecWbby3Yu-5cYpCF5y8/view?usp=drive_link', 1, 5),
(215, 19, 'Tomo 2', 'https://drive.google.com/file/d/1dpOdEsz2bcrfY6eUDZh5kBRjerfVTcfE/view?usp=drive_link', 6, 10),
(216, 19, 'Tomo 3', 'https://drive.google.com/file/d/1SXoved6dsEzrBLVGhycoBBVWWQE7cG__/view?usp=drive_link', 11, 15),
(217, 20, 'Tomo 1', 'https://drive.google.com/file/d/1ZklUG2DKgQ079OYH9qWwgWG8jHRU-30o/view?usp=drive_link', 1, 7),
(218, 20, 'Tomo 2', 'https://drive.google.com/file/d/1uU7an5xCVDUkHlY2UrBeaPe8TLvheELA/view?usp=drive_link', 8, 16),
(219, 20, 'Tomo 3', 'https://drive.google.com/file/d/1nVUsAoQHW6fJ6oz4VXHaRKDrhpRCHN_2/view?usp=drive_link', 17, 25),
(220, 20, 'Tomo 3', 'https://drive.google.com/file/d/1nVUsAoQHW6fJ6oz4VXHaRKDrhpRCHN_2/view?usp=drive_link', 17, 25),
(221, 22, 'Tomo 1', 'https://drive.google.com/file/d/1gcPPUOuvSXTFY79xAIczu-pCF3e3OF-7/view?usp=drive_link', 1, 5),
(222, 22, 'Tomo 2', 'https://drive.google.com/file/d/1FIcgjtrTa3WrE8nztuyuloROJEt58-dA/view?usp=drive_link', 6, 11),
(223, 22, 'Tomo 3', 'https://drive.google.com/file/d/1f2IKhSnEaZKQkqhsqjsmzxaGAta3GYrV/view?usp=drive_link', 12, 17),
(224, 23, 'Tomo 1', 'https://drive.google.com/file/d/1K8CA65Tzg5yZHFtINWMlsSrixF4C9Fsh/view?usp=drive_link', 1, 0),
(225, 24, 'Tomo 1', 'https://drive.google.com/file/d/1Yc0Cs1lxedejmkM8o68fZ1tWH7bBsgCb/view?usp=drive_link', 1, 9),
(226, 24, 'Tomo 2', 'https://drive.google.com/file/d/1PjQo07a1baZmz-rrAPL-QvNxXPm5jz6W/view?usp=drive_link', 10, 20),
(227, 24, 'Tomo 3', 'https://drive.google.com/file/d/1vuAv12AMZOyhW1mScV-4G47SEpTFD1Di/view?usp=drive_link', 21, 30),
(228, 26, 'Tomo 1', 'https://drive.google.com/file/d/1zktJBHinDtRnBDNJIdoP-C70_tBRZKH7/view?usp=drive_link', 1, 3),
(229, 26, 'Tomo 2', 'https://drive.google.com/file/d/1mdaswjbzcvC7vcmNyTMQJguRzVbgI_8p/view?usp=drive_link', 4, 7),
(230, 26, 'Tomo 3', 'https://drive.google.com/file/d/1ZmrzYaw8wF4okRwojC5uKmqIsis7vIlm/view?usp=drive_link', 8, 11);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `manga_generos`
--

CREATE TABLE `manga_generos` (
  `manga_id` int(11) NOT NULL,
  `genero_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `manga_generos`
--

INSERT INTO `manga_generos` (`manga_id`, `genero_id`) VALUES
(2, 1),
(2, 3),
(2, 4),
(2, 11),
(2, 8),
(3, 11),
(3, 9),
(3, 8),
(3, 43),
(3, 10),
(4, 3),
(4, 24),
(5, 15),
(6, 1),
(6, 8),
(7, 1),
(7, 3),
(7, 13),
(7, 8),
(8, 1),
(8, 2),
(8, 6),
(8, 3),
(8, 5),
(8, 13),
(9, 3),
(9, 11),
(9, 24),
(9, 7),
(9, 13),
(10, 1),
(10, 5),
(10, 31),
(10, 13),
(1, 1),
(1, 38),
(1, 11),
(1, 13),
(1, 8),
(1, 10),
(11, 1),
(11, 3),
(11, 5),
(13, 4),
(13, 31),
(13, 9),
(12, 1),
(12, 38),
(12, 31),
(14, 1),
(14, 6),
(15, 1),
(15, 3),
(15, 11),
(15, 5),
(15, 41),
(15, 13),
(16, 4),
(16, 12),
(16, 8),
(17, 1),
(17, 39),
(17, 11),
(17, 5),
(17, 7),
(18, 4),
(18, 5),
(18, 23),
(18, 43),
(19, 1),
(19, 2),
(19, 5),
(21, 2),
(21, 4),
(21, 5),
(21, 13),
(20, 11),
(20, 24),
(20, 7),
(22, 1),
(22, 3),
(22, 13),
(23, 1),
(23, 4),
(23, 9),
(23, 23),
(23, 12),
(23, 8),
(23, 10),
(24, 4),
(24, 24),
(24, 7),
(24, 12),
(25, 7),
(25, 13),
(25, 8),
(25, 26),
(26, 1),
(26, 3),
(26, 8),
(26, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `novelas`
--

CREATE TABLE `novelas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  `estado` enum('En emisión','Finalizado','Próximamente') DEFAULT NULL,
  `volumen` varchar(50) DEFAULT NULL,
  `ruta` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `novelas`
--

INSERT INTO `novelas` (`id`, `nombre`, `descripcion`, `imagen`, `estado`, `volumen`, `ruta`) VALUES
(1, 'Ascendance of a Bookworm', 'Cuenta la historia de Urano Motosu, una apasionada lectora que, tras morir en un terremoto, renace en un nuevo mundo donde los libros son escasos y valiosos. Ahora como Myne, una niña pobre, Urano decide dedicarse a crear y distribuir libros para poder leer y compartir su amor por la lectura, desafiando el sistema social y buscando la forma de acceder a la información y al conocimiento que siempre ha deseado.', 'uploads/images/68136a5094c43_aoab.jpg', 'En emisión', NULL, NULL),
(2, 'Debut or Die', 'Un estudiante que, después de prepararse para los exámenes de servicio civil, se encuentra tres años atrás en el pasado, en un cuerpo desconocido. El protagonista, ahora con una ventana de estado que muestra una amenaza, es forzado a convertirse en ídolo debido a un \"estado anormal: Debut o muerte\"', 'uploads/images/68136ab879be8_Debut-or-Die.png', 'En emisión', NULL, NULL),
(4, 'Omniscient Reader\'s Viewpoint', 'Kim Dokja, un joven que durante 13 años ha sido el único lector de la novela web \"Tres Maneras de Sobrevivir al Apocalipsis\". Cuando Dokja lee el último capítulo, la novela se vuelve realidad y él se encuentra dentro del mundo de la historia. Dokja, como único lector, posee conocimientos sobre el desarrollo de la trama, lo que le permite sobrevivir y guiar a otros en esta nueva realidad apocalíptica.', 'uploads/images/681369c04ec00_orv.jpg', 'Finalizado', NULL, NULL),
(5, 'ToraDora', 'La historia de Toradora! empieza con el protagonista masculino, Ryūji Takasu, quien está frustrado por tratar de verse bien al entrar a segundo año de secundaria. A pesar de su personalidad gentil, sus ojos los hacen parecer un delicuente intimidante, de manera que se siente sin posibilidades de encajar, especialmente entre sus compañeros. Tras haber sido saludado por su madre con resaca en la mañana, Ryūji va a la escuela y está feliz al encontrarse con quien será su compañero de curso y mejor amigo Kitamura Yūsaku, y la chica de la que está enamorado, Minori Kushieda. De todos modos, ahí es cuando inesperadamente choca con \"el animal más peligroso y de más alto riesgo de la escuela\" -Taiga Aisaka- quien también va a estar en este curso, y es una buena amiga de Minori.', 'uploads/images/img15.jpg', 'Finalizado', NULL, 'uploads/toradora-novela-1.pdf'),
(6, 'Villains Are Destined to Die', 'La hija ilegítima de un rico hombre de negocios logra huir de su horrible familia… solo para acabar convertida en Penelope Eckart, la villana de un juego de simulación de citas. En él debe ganarse el afecto de uno de los objetivos masculinos antes de que la verdadera princesa regrese; y si fracasa, ¡morirá!', 'uploads/images/68136a7daa1fd_vadtd.jpg', 'En emisión', NULL, NULL),
(7, 'Arena', 'Un estudiante de examen de empleo civil de 29 años se despierta en una habitación blanca en blanco y se encuentra con un ángel bebé. Este ángel bebé le informa que murió mientras dormía debido a una enfermedad cardíaca como su padre y su abuelo. Al recordar a su mamá y su última conversación, dice que se enfrentará a una serie de pruebas de vida o muerte que le ofrece el ángel bebé. A partir de este momento deberá arriesgar su vida y luchar en el escenario llamado \'Arena\'. Y cada vez que supere una prueba, obtendrá habilidades y armas para aumentar su fuerza. Todo para pasar las pruebas y recuperar su vida. Esta es su historia de sus luchas en la \'Arena\'.', 'uploads/images/img3.jpg', 'Finalizado', NULL, 'uploads/arena.pdf'),
(8, 'Second Life Ranker', 'El hermano gemelo de Yeon-woo desapareció hace cinco años, solo para que su reloj de bolsillo cayera repentinamente en las manos de Yeon-woo. En el interior, Yeon-woo encontró un diario oculto. \"Para cuando escuches esto, supongo que ya estaré muerto ... Obelisco, la Torre del Dios Sol, es un mundo donde se cruzan varios universos y dimensiones. El hermano de Yeon-woo había muerto después de ser traicionado mientras subía a la Torre, y después de enterarse de la verdad, Yeon-woo decidió subir a la torre con la ayuda del diario de su hermano.\"De ahora en adelante, soy Cha Jeong-woo\".', 'uploads/images/secondliferanker.png', 'En emisión', NULL, 'uploads/Second Life Ranker Capítulos del 01 al 100.pdf'),
(9, 'Cazador Suicida de la Clase SSS', 'La historia sigue a Kim Gong-ja, un hombre común que se convierte en cazador para ascender en la Torre, buscando venganza contra el \"Emperador de la Llama\". La trama se centra en Kim Gong-ja, quien, tras sufrir una derrota, decide regresar a un punto anterior en el tiempo para evitar su muerte y vengarse del Emperador.', 'uploads/images/68136b8c02e9d_scsh.png', 'En emisión', NULL, NULL),
(10, 'Epoch of Twilight', '¿Alguna vez pensaste que el estado del mundo tal como es actualmente podría volver a las leyes de los antiguos? Cuando una serie de extraños incidentes que comenzaron con la desaparición de su amigo llevaron a Luo Yuan a cuestionar la posibilidad de un apocalipsis, se ve envuelto en medio de un caos de escala global.La evolución ha convertido la flora y la fauna de la vasta y abundante Tierra en algo que nunca se había visto antes. Casualmente, los Homo Sapiens dominantes terminaron en el fondo de la cadena alimenticia. De misterio a crisis, ¿descubrirá Luo Yuan un medio para salvar a la humanidad al competir hasta la cima de la cadena alimenticia? ¿O luchará de acuerdo con la ley de la jungla? Es el comienzo de la era de la supervivencia del más apto.', 'uploads/images/epoch-e1609478756746.jpg', 'Finalizado', NULL, 'uploads/epoch-of-twilight-01-100.pdf'),
(11, 'Sword Art Online', 'Era imposible escapar hasta que se «despejara», Perder significaría una verdadera «muerte» -. Sin saber la «verdad» de este misterioso MMO de nueva generación llamado: «Sword Art Online», cerca de diez mil usuarios se conectaron, abriendo las cortinasde esta cruel batalla a muerte. Participando solo en SAO, el protagonista Kirito había aceptado inmediatamente la «verdad» de este MMO.\r\nY en el juego, en el gigantesco castillo flotante llamado «Aincrad», se distinguió como un jugador en solitario. Con el objetivo de limpiar el juego para llegar al piso más alto, Kirito arriesgadamente continuó solo. Debido a una invitación insistente de una guerrera y experta de estoques,Asuna, se unió a ella… Ese encuentro produjo una oportunidad para sacar de su destino a Kirito.', 'uploads/images/swordart.jpg', 'En emisión', NULL, 'uploads/Sword Art Online 02.pdf'),
(12, 'Hataraku maou-sama', 'Después de recibir una buena paliza por parte de la heroína Emilia, el Rey Demonio y su general se retiran a toda prisa a un universo paralelo... ¡sólo para aterrizar en medio del bullicioso Tokio de hoy en día! Al carecer de la magia necesaria para volver a casa, los dos se ven obligados a asumir identidades humanas y a llevar una vida normal hasta que encuentren una solución mejor. Y para llegar a fin de mes, Satanás encuentra un empleo remunerado en un local de comida rápida cercano. Con su diabólica mente puesta en ascender en la cadena alimentaria de la administración, ¿qué será de su sed de conquista?', 'uploads/images/image.jpg', 'En emisión', NULL, 'uploads/[WP] Hataraku Maou-sama! - Volumen 01.pdf'),
(13, 'Overlord', 'Detalla sobre Satoru Suzuki, cuyo avatar de juego conocido como Momonga, un jugador de YGGDRASIL de repente encuentra su conciencia atrapada en su avatar y todos los NPC a su alrededor comienzan a ganar consciencia. Él debe luchar para encontrar una manera de sobrevivir en este nuevo mundo.', 'uploads/images/ef452298e6554b68f7aa70a0c45c2fee.jpg', 'En emisión', NULL, 'uploads/Overlord Volumen 1.pdf'),
(14, 'Kenja no Mago', 'Gracias a los distintos tipos de magia, la raza humana se ha salvado de calamidades muchas, muchas veces. Reteniendo sus recuerdos de su vida anterior, un niño, Shin, fue recogido por un anciano conocido por el mundo como \"Magi\". Shin fue criado por el Magi, que se había retirado a un lugar apartado, como su nieto. Con los recuerdos de su vida pasada, absorbió el arte del Magi y creció hasta ser capaz de desarrollar su propia magia. Entonces, el abuelo le dijo que tiene que ser independiente cuando llegue a la edad de 15 años. \"Ah, se me olvidó enseñarle el sentido común.\" El nieto que había crecido hasta pasar el nivel de una persona normal, carecía de sentido común; el sentido común del mundo. Así que para aprender a socializar, va a la Reino de la ciudad de Earlshide para ser admitido en la Academia de Magia Avanzada Earlshide.', 'uploads/images/uYRZ2Gy.png', 'Finalizado', NULL, 'uploads/Kenja no Mago volumen 1.pdf'),
(15, 'Sovereign of Judgment', 'Un genio de la lucha. En sexto grado, Choi Hyuk mató a alguien. Luego le prometió a su madre que nunca volvería a pelear. Pasó sus días de escuela siendo intimidado y mirando fijamente por la ventana. Un día, apareció un anillo en medio de su salón de clases. Choi Hyuk, ahora un estudiante de secundaria que había pasado toda su vida expiando sus pecados, ahora se enfrentaba a una decisión: matar o ser asesinado.', 'uploads/images/f2cf07115fe2f9f903a29.jpg', 'Finalizado', NULL, 'uploads/Sovereign Of Judgment Capitulo 1 al 30.pdf'),
(16, 'Isekai de Cheat Skill wo Te ni Shita Ore wa ', 'Tenjo Yuuya ha sido un chico acosado desde el pasado. Vive en la casa de su amado abuelo mientras va a la escuela. Como de costumbre, recibe una fuerte intimidación, y toma una ausencia prolongada de la escuela para tener tiempo para curar sus heridas. Durante este largo tiempo de ausencia, aprovecha la oportunidad para limpiar la casa de su abuelo y se dirige a una habitación a la que nunca antes había ido, donde su abuelo guarda muchos objetos diferentes que recogió de sus viajes alrededor del mundo. Mientras estaba arreglando los objetos, encontró una puerta que no estaba en una pared entre los objetos. Por curiosidad, abre esta puerta, lo que encontró al otro lado fue …', 'uploads/images/1.png', 'En emisión', NULL, 'uploads/Isekai de Cheat Skill wo Te ni Shita Ore wa Volumen 1.pdf'),
(17, 'Praise the Orc ', '¡Alabado sea el Orco! Se trata de Jung Ian, propietario de un café con un pasado oscuro, saltando al mundo de la realidad virtual para proteger a su hermana de cualquier depredador. Sin embargo, las cosas pueden no ser tan simples como él originalmente cree que sean. Presenciando mientras explora las tierras de Elder Lord como un orco, una especie etiquetada como el \"error del creador del juego\", ¡derrotando a todos y cada uno delante de él!', 'uploads/images/praise-the-orc.jpg', 'Finalizado', NULL, 'uploads/praise-the-orc-capitulos-1-120.pdf'),
(18, 'El Legendario Escultor de la luz lunar', 'El personaje principal de la historia es Lee Hyun, un joven muy trabajador que adolece una vida de pobreza. Forzado a trabajar durante su niñez y adolescencia para proporcionar sustento a su abuela y hermana menor, desarrollo como principal característica su tenacidad, la cual se refleja también en su participación del popular juego MMORPG, Continente de Magia. En este juego, bajo el alias Weed, obtiene el reconocimiento absoluto como el mejor jugador, pero al llegar a la edad adulta en la cual se puede unir al mercado laboral decide vender su personaje en una subasta en línea, obteniendo un monto de 3 millones de dólares. Pero pierde casi todo este dinero cuando debe enfrentar el pago de una deuda obtenida por sus difuntos padres y sus intereses a unos prestamistas. Esto desemboca en su decisión de obtener dinero del juego VR-MMORPG, Royal Road, recientemente activo y que posee la tecnología de simulación de realidad más avanzada del planeta.', 'uploads/images/24aac8e59f7dba7a20784ff8c962babf.jpg', 'En emisión', NULL, 'uploads/el-legendario-escultor-de-la-luz-lunar-volumen-1.pdf'),
(19, 'Otherworldly Evil Monarch', 'Jun Xie era el asesino número uno de la tierra moderna. Sus habilidades y conocimiento en el campo de asesinato no tenían igual, sus logros no tenían precedentes, su reputación aterraba a todo el bajo mundo. Sin embargo, durante una misión para recuperar un tesoro místico, ocurrió un accidente…Ahora se llama Jun Moxie, un joven de dieciséis años con un súper nivel en libertinaje, único heredero de la decadente Familia Jun. Una familia de héroes valerosos de la que solo queda un anciano abuelo, un tío lisiado y un libertino como único heredero! Aceptando las críticas y las miradas frías de este mundo con una sonrisa, comienza su nuevo viaje! Su vida se verá marcada por su propia voluntad! Se alzará hasta lo más alto! ¡El Monarca Malvado Jun Xie!¡Con esta copa brindo por aquellos a los que maté en mi vida pasada. Perdonadme, pero no hay oportunidad para ustedes de lograr venganza. Gulp!¡Con esta copa brindo por aquellos a los que les arrebataré la vida en mi nueva vida. Perdonadme, pero estan destinados a morir en mis manos. Salud!', 'uploads/images/sddefault.jpg', 'Finalizado', NULL, 'uploads/Otherworldly Evil Monarch 01-100 (1).pdf'),
(20, 'Danmachi', 'La enorme Ciudad laberinto Orario, es la puerta de entrada al enorme laberinto subterráneo conocido comúnmente como «Calabozo». Su extraño nombre provoca emoción, un lugar para ganar honor, y tal vez incluso un romance con una chica hermosa. Un lugar donde las personas contienen la respiración, con la esperanza de obtener todo lo que desean, un lugar donde un joven solitario se encuentra con una pequeña «Diosa».«¡Muy bien, Bell-kun, sígueme! ¡Es hora de que comience el rito de iniciación de la «Familia»!»\r\n«¡Sí! ¡Sere más fuerte!» El encuentro predestinado de un chico que quiere convertirse en Aventurero, y la Diosa fracasada que ni siquiera tiene un solo seguidor.', 'uploads/images/01.jpg', 'En emisión', NULL, 'uploads/Dungeon ni Deai wo Motomeru no wa Machigatteiru Darou ka Vol. 01.pdf'),
(21, 'Isekai Ryouridou', 'El protagonista principal es Tsurumi Asuta de 17 años de edad y cursa segundo año de secundaria. Trabajaba como aprendiz de cocinero en \"Tsurumi-ya\"un pequeño restaurante manejado por su padre.Un día, \"Tsurumi-ya\" es afectado por un incendio, Asuta se zambulló dentro de la tienda que se quemaba para salvar el cuchillo Santoku de su padre y ahí es donde él encontró su final, cuando volvió en si estaba en medio de una selva extraña.Entonces fue atacado por una bestia parecida a un jabalí, pero Asuta fue salvado por una chica llamada Ai Fa que se autodenominaba a si misma como \"gente de Morihen\". Fue entonces cuando se dio cuenta de que estaba en otro mundo. ', 'uploads/images/isekai-ryouridou-01.jpg', 'En emisión', NULL, 'uploads/Isekai Ryouridou - Volumen 01.pdf'),
(22, 'Tensei Shitara Slime Datta Ken', 'Mikami Satoru, de solo 37 años de edad, se encuentra estancado en un trabajo sin futuro, infeliz con su vida diaria, pero después de morir a manos de un ladrón, despierta en un reino fantástico... ¡como un monstruo Slime! Como se aclimatará a su nueva existencia, sus hazañas con los otros monstruos desencadenan una serie de eventos que cambiarán su nuevo mundo para siempre.', 'uploads/images/681367302e766_that-time-i-got-reincarnated-as-a-slime-vol1-tensei-shitara-suraimu-datta-ken.jpg', 'En emisión', NULL, NULL),
(23, 'Classroom of the Elite', 'Kiyotaka Ayanokōji, un estudiante de la Clase D de la prestigiosa Escuela Metropolitana de Formación Avanzada de Tokio, una escuela utópica donde los estudiantes tienen gran libertad. La escuela está diseñada para formar a la próxima generación de líderes, pero internamente funciona como una rígida jerarquía donde la Clase D es considerada la menos capaz. Ayanokōji, aunque aparentemente inútil, es en realidad muy inteligente y posee habilidades ocultas que lo impulsan a navegar por la complejidad del sistema escolar', 'uploads/images/6813689cbb18b_cote.png', 'En emisión', NULL, NULL),
(24, 'La Basura de la Familia del Conde', 'Kim Rok Soo vivió una vida miserable e insignificante hasta que renació en una novela de fantasía. Desafortunadamente, adoptó el cuerpo de Cale Henituse, un villano menor que recibe la paliza de su vida del personaje principal, Han Choi', 'uploads/images/6813695bbfbff_totcf.jpg', 'En emisión', NULL, NULL),
(25, 'Mushoku Tensei', 'Un NEET otaku de 34 años de edad es expulsado de su casa por su familia. Es virgen, un buen tipo regordete, poco atractivo y sin dinero, encontrando que su vida va por el camino a su fin. Luego recordó que su vida podría ser en realidad mucho mejor si él hubiera puesto más esfuerzo en la oscura historia de su vida. Justo cuando estaba a punto de arrepentirse, vio un camión en movimiento a gran velocidad, y tres estudiantes de secundaria en su trayectoria. Reuniendo todas las fuerzas que tenía, él trató de salvarlos y terminó siendo atropellado por el camión, terminando rápidamente su vida. La próxima vez que abrió los ojos, él había reencarnado en un mundo de espadas y magia como Rudeus Greyrat. Nacido en un nuevo mundo, una nueva vida, Rudeus decidió que, \"Esta vez, realmente voy a vivir mi vida al máximo sin arrepentimientos\".De este modo se inicia el viaje de un hombre que anhela reiniciar su vida.', 'uploads/images/img1.jpg', 'Finalizado', NULL, 'uploads/Mushoku Tensei v01 - Español.pdf'),
(26, 'Re:Zero', 'Natsuki Subaru, un hikikomori que es teletransportado a otro mundo. Al llegar, es asesinado y descubre que puede retroceder en el tiempo a su muerte, un poder que él llama \"Regreso por muerte\". Subaru utiliza este poder para proteger a sus amigos y evitar que se repitan los eventos trágicos que ha experimentado, mientras que se esfuerza por comprender la naturaleza de este nuevo mundo y las fuerzas que lo amenazan.', 'uploads/images/681369eb700a7_Re_Zero.jpg', 'En emisión', NULL, NULL),
(28, 'TBATE', 'El Rey Grey tiene fuerza, riquezas y prestigio, es incomparable en un mundo gobernado por la habilidad marcial. Sin embargo, la soledad siempre está cerca de aquellos con gran poder. Bajo el atractivo exterior de un rey poderoso yace el caparazón de un hombre, desprovisto de propósitos y voluntad. Reencarnando en un nuevo mundo lleno de magia y monstruos, el rey obtiene una segunda oportunidad para revivir su vida. Sin embargo, corregir los errores de su pasado no será su único desafío. Ya que bajo la paz y la prosperidad de este nuevo mundo existe una corriente subterránea que amenaza con destruir todo por lo que ha trabajado, poniendo en duda su rol y sus razones para volver a nacer.', 'uploads/images/img16.jpg', 'En emisión', NULL, NULL),
(29, 'Date a Live', 'Hace treinta años un extraño fenómeno llamado Terremoto espacial devastó el centro de Eurasia, llevándose consigo la vida de al menos 150 millones de personas. Desde entonces, pequeños terremotos espaciales se han ido manifestando alrededor del mundo. Shidou Itsuka, un estudiante de secundaria aparentemente normal se encuentra con una chica en el epicentro de un terremoto espacial y es informado por su hermana Kotori que esta chica es uno de los espíritus que causan los terremotos espaciales cuando estos aparecen en el mundo. También se entera que su hermana es la capitana de la nave Ratatoskr y quien lo recluta para hacer uso de su misteriosa habilidad para sellar los poderes de los espíritus y evitar que se vuelvan una amenaza para la humanidad. Sin embargo, hay un inconveniente: para sellar un Espíritu, debe hacer que se enamore de él.', 'uploads/images/img17.jpg', 'En emisión', NULL, 'uploads/[KKLR] Date A Live 01.pdf'),
(30, 'Kumo Desu Ga. Nani Ka?', 'La historia sigue a una clase de estudiantes que muere en una misteriosa explosión y reencarna en otro mundo, donde una chica, Kumoko, se convierte en una araña en una mazmorra.', 'uploads/images/68136afa84e08_siassw.jpg', 'Finalizado', NULL, NULL),
(31, 'Solo Leveling', 'Hace 10 años, despues de que la \'Puerta\' conectase el mundo real con un mundo lleno de monstruos, algunas de las personas comunes y corrientes recibieron el poder para poder pelear dentro de las puertas. Son conocidos como \'Los cazadores\'. Sin embargo, no todos los cazadores son poderosos. Mi nombre es Sung Jinwoo, un cazador de rango E. Un cazador que tiene que arriesgar su vida en las mazmorras de más bajo nivel.Pero al no tener ninguna habilidad para mostrar, apenas soy capaz de ganar el dinero necesario luchando en las mazmorras de bajo nivel... ¡Al menos hasta que encontré una mazmorra oculta dentro de una mazmorra de rango D! Al final, cuando ya había aceptado mi muerte, de repente recibí un poder extraño, un registro de búsqueda que solo yo podía ver, ¡Un secreto para subir de nivel que solo yo conozco! Si entrenaba de acuerdo con mis misiones y cazaba monstruos, mi nivel aumentaría.¡Cambiando del Cazador más débil al Cazador de rango S más fuerte!', 'uploads/images/images.jpg', 'Finalizado', NULL, 'uploads/solo-leveling-volumen-1.pdf'),
(32, 'Kusuriya no Hitorigoto', 'Maomao, una joven boticaria que es secuestrada y vendida al harén imperial. Allí, utiliza sus conocimientos de medicina y herboristería para desentrañar los misterios y secretos que se ocultan dentro de las paredes del palacio, especialmente los relacionados con la salud de los hijos del emperador.', 'uploads/images/68136be01f3ca_apd.jpg', 'En emisión', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `novela_generos`
--

CREATE TABLE `novela_generos` (
  `novela_id` int(11) NOT NULL,
  `genero_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `novela_generos`
--

INSERT INTO `novela_generos` (`novela_id`, `genero_id`) VALUES
(0, 0),
(2, 4),
(2, 18),
(4, 2),
(4, 5),
(4, 7),
(4, 18),
(5, 3),
(5, 7),
(5, 11),
(6, 1),
(6, 2),
(6, 5),
(6, 18),
(7, 1),
(7, 2),
(7, 6),
(7, 9),
(8, 1),
(8, 2),
(8, 5),
(8, 8),
(9, 1),
(9, 5),
(9, 8),
(10, 1),
(10, 2),
(10, 5),
(10, 29),
(11, 2),
(11, 5),
(11, 6),
(11, 7),
(12, 1),
(12, 2),
(12, 3),
(12, 5),
(13, 5),
(13, 9),
(14, 1),
(14, 2),
(14, 5),
(14, 7),
(15, 1),
(15, 2),
(15, 5),
(15, 6),
(15, 12),
(16, 1),
(16, 5),
(16, 9),
(16, 18),
(17, 1),
(17, 3),
(17, 5),
(17, 29),
(18, 2),
(18, 4),
(18, 5),
(18, 6),
(19, 1),
(19, 3),
(19, 5),
(19, 29),
(20, 1),
(20, 2),
(20, 3),
(20, 5),
(21, 1),
(21, 2),
(21, 3),
(21, 5),
(22, 2),
(22, 5),
(22, 6),
(22, 18),
(23, 4),
(23, 11),
(23, 23),
(24, 2),
(24, 5),
(24, 18),
(24, 31),
(25, 1),
(25, 5),
(25, 6),
(26, 2),
(26, 5),
(26, 18),
(26, 23),
(27, 2),
(27, 3),
(27, 6),
(27, 18),
(28, 4),
(28, 5),
(28, 18),
(28, 31),
(29, 1),
(29, 2),
(29, 3),
(29, 6),
(30, 2),
(30, 3),
(30, 5),
(30, 18),
(31, 1),
(31, 3),
(31, 5),
(31, 29),
(32, 3),
(32, 4),
(32, 7),
(32, 31);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('user','admin') DEFAULT 'user',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `profile_image` varchar(255) DEFAULT 'default_profile.png'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `role`, `created_at`, `updated_at`, `profile_image`) VALUES
(1, 'admin', 'admin@aetheris.com', '1234567890', 'admin', '2025-04-21 22:07:16', '2025-04-21 22:07:16', 'default_profile.png'),
(2, 'Akira', 'akira@aetheris.com', '$2y$10$kkiDk/zLnRJmh8ThVKjpn.HN2FXe02keBOfi6L2XtCMK2CFVnnD8a', 'admin', '2025-04-21 22:49:12', '2025-04-28 20:55:01', 'profile_2_1745873346.gif'),
(3, 'aki', 'aki@aetheris.com', '$2y$10$HjHP7CYhvil/VzR3pMCsCuJqWmrM0oXxaSSCmW.EAtYkovZFpBSmy', 'user', '2025-04-21 23:08:06', '2025-04-21 23:08:06', 'default_profile.png'),
(5, 'jeimy', 'jeim30@aetheris.com', '$2y$10$e5dSbEnhjzR0bTYmXRwqPOv/h8zTXuOzdYz4Rxn09jkjV8dsgna/a', 'admin', '2025-05-03 14:29:58', '2025-05-03 14:30:16', 'default_profile.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `volumenes`
--

CREATE TABLE `volumenes` (
  `id_volumen` int(11) NOT NULL,
  `id_novela` int(11) NOT NULL,
  `numero_volumen` int(11) NOT NULL,
  `ruta_volumen` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `volumenes`
--

INSERT INTO `volumenes` (`id_volumen`, `id_novela`, `numero_volumen`, `ruta_volumen`) VALUES
(7, 29, 1, 'https://drive.google.com/file/d/1xCDMIGKHF6AgBSiq5ghFrKNYQs7dYn-A/view'),
(9, 29, 2, 'https://drive.google.com/file/d/1og-dpjCf3fRFe6P-QkHq2tZpJ1Bc7QED/view'),
(11, 25, 1, 'https://drive.google.com/file/d/1_ijPdD6CpTbY8szKWKPjOqjkT0biR8R1/view'),
(12, 5, 1, 'https://drive.google.com/file/d/1YoPYBkGGAu1SiXyH46bxHKajo3C5NMcE/view'),
(13, 5, 2, 'https://drive.google.com/file/d/1uLw-MM59_4rZAkERX2GL2XdGFNMBgqgE/view'),
(14, 28, 1, 'https://drive.google.com/file/d/1xICFxHj6b2x2iwGp1pzxtDczapd6MeXs/view'),
(15, 28, 2, 'https://drive.google.com/file/d/1plunC1AgnGuE2xlu8MvGmnDF33RpvCnV/view'),
(16, 25, 2, 'https://drive.google.com/file/d/1nPHbxChrZ4rSAe4YqsPEpTQna5NCDTCb/view'),
(17, 7, 1, 'https://drive.google.com/file/d/1us2dFvCeqSssrx9wh2a98_c9NrUunupx/view'),
(18, 7, 2, 'https://drive.google.com/file/d/13ROft8fveKc4z0FVlmz0VjTD4tN3PSdZ/view'),
(19, 8, 1, 'https://drive.google.com/file/d/1zqmIYfpjEzTw__aleV1yIyhEJpTdTc48/view'),
(20, 8, 2, 'https://drive.google.com/file/d/1nR4ztjQ3v4W3k2EZ7cbqmqsd_UoEucQr/view'),
(21, 31, 1, 'https://drive.google.com/file/d/1wfPLDEC1TW4rctit3Uid6m0hDmAtT1Fl/view'),
(22, 31, 2, 'https://drive.google.com/file/d/1UJl1dDkEKEwVlTvQbkdNtmXgs-4qE_sX/view'),
(23, 10, 1, 'https://drive.google.com/file/d/1dlp8qDSHV5ezclpxQGaQFbToDiDqi-Ve/view'),
(24, 10, 2, 'https://drive.google.com/file/d/1JTCKL_YmBhyyT3BBnOIYmzJsM-_Lr0Cv/view'),
(25, 11, 1, 'https://drive.google.com/file/d/1grHcUZmokBNGUZx3NK0N2Pk-QsNzaRpp/view'),
(26, 11, 2, 'https://drive.google.com/file/d/1-izE2jLeU3sOL1vs-aixQXWB0GvSL1qA/view'),
(29, 13, 1, 'https://drive.google.com/file/d/1-dWpdX8ImuFhNSUF5eMl3ooQug-fpdFf/view'),
(30, 13, 2, 'https://drive.google.com/file/d/1z9oQx0iMNC0IXCGexRdCbD4rJSsVL_Wj/view'),
(31, 14, 1, 'https://drive.google.com/file/d/108X71nrdyUctpqA-JQKuDl-i3AYiIGke/view'),
(32, 14, 2, 'https://drive.google.com/file/d/19p3His37SjzF_4RDsK0eYLW7E5GY3C0M/view'),
(33, 15, 1, 'https://drive.google.com/file/d/1-UZku5XfPJbT9nU1YyspMbpTt0mKPFko/view'),
(34, 15, 2, 'https://drive.google.com/file/d/1e8-7AEQinEMZ_PMtIFNfDJ-hKY6SM4lJ/view'),
(35, 16, 1, 'https://drive.google.com/file/d/1TGa5Ci7lTR5tAhUXJ2Lltfz2nWTH4R9U/view'),
(36, 16, 2, 'https://drive.google.com/file/d/1PcafhSVbV7ZfCby_tuWof7s1InhApUQI/view'),
(37, 17, 1, 'https://drive.google.com/file/d/1EX0yHkBdIY7y3FQKXdeJSv95aJDLSV7T/view'),
(38, 17, 2, 'https://drive.google.com/file/d/1Vqntp4b1tV_KRqK3M46P80FgQuVFdSwJ/view'),
(39, 18, 1, 'https://drive.google.com/file/d/1Niz-GFyt5_Ge6gJ5K_AsNtheEYKvFJHd/view'),
(40, 18, 2, 'https://drive.google.com/file/d/1eniqLMtOv_yAQzOgOm1zyXuB61nUt3GX/view'),
(41, 19, 1, 'https://drive.google.com/file/d/1rUmA4ynSiUzX_AGJzw6ih5roLacIXieW/view'),
(42, 19, 2, 'https://drive.google.com/file/d/1m1In6LD42kxvsDh4j6nNKEzZ6DZqEB_V/view'),
(43, 20, 1, 'https://drive.google.com/file/d/1f9or2Df9CG-ixp9F-ru3Z8dvPOAbMt5E/view'),
(44, 20, 2, 'https://drive.google.com/file/d/1LaaomBp9fdPtQVNeOFD2JpRyOD0ByvUd/view'),
(45, 21, 1, 'https://drive.google.com/file/d/1Eun33PjHK_aQ5MX55E3UoyLfmpKL1SMJ/view'),
(46, 21, 2, 'https://drive.google.com/file/d/1LuRriJKT_FXw7BuULE-ju5h2jOjycdBS/view'),
(47, 29, 3, 'https://drive.google.com/file/d/1aawF6mJlrV5RJgMqV1iKzP0YjQ8-bO6w/view'),
(48, 29, 4, 'https://drive.google.com/file/d/183ZWKMGy795kRdVLaO8r0nfDdEZ9_IRN/view'),
(49, 29, 5, 'https://drive.google.com/file/d/1nKGdDi2c7gNHmTmXepZiM1-BjYU5cXN0/view'),
(50, 29, 6, 'https://drive.google.com/file/d/1Lrv0MPLzLynH3zTpdszIJqIIjhRIoQWX/view'),
(51, 29, 7, 'https://drive.google.com/file/d/1aMZG8vECb9UYIjupMYeMoGTn2xbxMygw/view'),
(52, 29, 8, 'https://drive.google.com/file/d/12TSrUklsv_cjBfvL1gQ8NAdmDlFj4SU2/view'),
(53, 29, 9, 'https://drive.google.com/file/d/1yMUMVut0cT-ixGApgNu1OsYKh2O1cvKq/view'),
(54, 29, 10, 'https://drive.google.com/file/d/1Mav0SExTpf1H_OliYmzi1S1MfKzGp9s1/view'),
(55, 29, 11, 'https://drive.google.com/file/d/1fRXoP0bHIko-G_ek3ljEDmofiCeRZ1rv/view'),
(56, 29, 12, 'https://drive.google.com/file/d/1KTYQqxRaAhHIzWJZSCIkcMNZ8n735Atr/view'),
(57, 29, 13, 'https://drive.google.com/file/d/12OgUFAtMhY_XgD9E4N5Nh3GTqZ0p6FwT/view'),
(58, 29, 14, 'https://drive.google.com/file/d/12WS6NvhU2pVziq4qaYMTsUTlu5h7RG8d/view'),
(59, 29, 15, 'https://drive.google.com/file/d/1Q8MIjzjEk4xwYcOlIYQCBLiWsudtV5BF/view'),
(60, 29, 16, 'https://drive.google.com/file/d/1exObXXqsGcbkjyices2GlzlkJ2VkCSYS/view'),
(61, 25, 3, 'https://drive.google.com/file/d/14RbaO5cCTsJeL-QRWQz_dEDdyOkMMy8E/view'),
(62, 25, 4, 'https://drive.google.com/file/d/11x2FU7Z4llzFw-PQRkfRmqLzO0SuVFz8/view'),
(63, 25, 5, 'https://drive.google.com/file/d/1A90fXAf93oBWh-9SbrShcuHQo9j6WZg_/view'),
(64, 25, 6, 'https://drive.google.com/file/d/1Kb0JEYthQ4NB_1CJ4o0iRpdXks8qYsx9/view'),
(66, 5, 3, 'https://drive.google.com/file/d/1RtjB7eORV6u5OlE6gePL-0OckTwte7Yg/view'),
(67, 5, 4, 'https://drive.google.com/file/d/1_Tiwduea1QOvflEMSheOx-CeQOS4bK8U/view'),
(68, 5, 5, 'https://drive.google.com/file/d/1bkh84zTg_R01uoCIpda0qBx6W0oRODL4/view'),
(69, 5, 6, 'https://drive.google.com/file/d/1wcQEiI5N-iFFYS5JVdNIlHDAwKI5Rwkw/view'),
(70, 5, 7, 'https://drive.google.com/file/d/10X32F8neGz5Rcoo4f6yU5GB8YgAOj9nK/view'),
(71, 5, 8, 'https://drive.google.com/file/d/1WGfwyu5_6U3922DywNvGZ9lhjFV1WesM/view'),
(72, 5, 9, 'https://drive.google.com/file/d/16hCyXQjp0fO0FOjV4OQvEoU9msPqgn1a/view'),
(73, 5, 10, 'https://drive.google.com/file/d/1jr3pGPrh-YRb9Nh6mIMEB-RAcHO1dB6A/view'),
(74, 28, 3, 'https://drive.google.com/file/d/1VkEwId0AEXvDGMHu6uNPhHnurnt7_H4p/view'),
(75, 28, 4, 'https://drive.google.com/file/d/1Btvl0SmU_KhWdJkNBuw2B1BRFEmp3Gby/view'),
(76, 28, 5, 'https://drive.google.com/file/d/1480GUw31ivvv3T8KDCTNvisvflyybl0O/view'),
(77, 28, 6, 'https://drive.google.com/file/d/1SxGTVAQdJdLiazMb8eq4B3aFSN_190CS/view'),
(78, 28, 7, 'https://drive.google.com/file/d/1uUKVA-RSS6TT9pALprtQgx7G9xJZzlh0/view'),
(79, 28, 8, 'https://drive.google.com/file/d/1CSQPhorFk46XQAgJ5uE1SH73a16xxDJc/view'),
(80, 28, 9, 'https://drive.google.com/file/d/1fNUGonPH-njANDqDiM9k55AtIg5QJnCM/view'),
(81, 28, 10, 'https://drive.google.com/file/d/11O-YyYrhf8hbtOMhEKLhuta78CD_SpI5/view'),
(82, 28, 11, 'https://drive.google.com/file/d/1z04kSuW-RIBkBXLTgsnRAFwO0buZUAcA/view'),
(83, 7, 3, 'https://drive.google.com/file/d/1cJ6m0k2nDUYkEQ3NbSKsIdZEbn5o14SP/view'),
(84, 7, 4, 'https://drive.google.com/file/d/1CnuWO5fv8qi6dDAP23tVKLge66DY1zNQ/view'),
(85, 7, 5, 'https://drive.google.com/file/d/1-Ww8uhi98Nw39aCyuSv60kcKd8kcg11y/view'),
(86, 7, 6, 'https://drive.google.com/file/d/1l5wtnmFRhX-2CniDsceWgpCIVs8mtfBm/view'),
(87, 7, 7, 'https://drive.google.com/file/d/18IL3pM3p1IiVIi2vhJ9S5Tom2CZk9UOQ/view'),
(88, 8, 3, 'https://drive.google.com/file/d/1bKMJy7LeC08sPtD6tGstyrl8I1LQrdrS/view'),
(89, 8, 4, 'https://drive.google.com/file/d/1J50Sitlp1d-Ied45IfIjgpjvvrmCKODw/view'),
(90, 31, 3, 'https://drive.google.com/file/d/1aHmPT7Ygr_NNbRz2RNyjIAVL6jFKpGeF/view'),
(91, 31, 4, 'https://drive.google.com/file/d/1JV-OstVUdOeOjU8ClsOnsNBECqM_iFFk/view'),
(92, 31, 5, 'https://drive.google.com/file/d/1wA3_NUqEYZFBo_WR9L6biqBHAPqA1_Nk/view'),
(93, 31, 6, 'https://drive.google.com/file/d/17kgMJJdPJojNLgbKtyoguB-LNLEDLWNG/view'),
(94, 31, 7, 'https://drive.google.com/file/d/1H7eFqGP0aephKC-9haejD8FmqO6Y9t1G/view'),
(95, 31, 8, 'https://drive.google.com/file/d/177Ug9txuVaqRHR_DuaqQnuJ_yB9RUsAs/view'),
(96, 31, 9, 'https://drive.google.com/file/d/1rxLkcx-oEvHgB61ieON-xKofrodBoK09/view'),
(97, 31, 10, 'https://drive.google.com/file/d/19Vz8jkCu76Kd1-gdhIelkWcUC-j-CCJm/view'),
(98, 10, 3, 'https://drive.google.com/file/d/1vo9pyXStfeXdRtSVdhA3ood3suhpMsx-/view'),
(99, 10, 4, 'https://drive.google.com/file/d/1XaF_3JknlegOsbyaguAli9c4Lrl8-gX8/view'),
(100, 20, 3, 'https://drive.google.com/file/d/1jhURvR5YwFMY4r8BbwhkqTCVRVHc4R-X/view'),
(101, 20, 4, 'https://drive.google.com/file/d/1uQKGxrnGR_56FaacRWlWvfmUUci2k3MK/view'),
(102, 20, 5, 'https://drive.google.com/file/d/1jTb_TxZrckslz1SXDan4YUpT9mBcAyfk/view'),
(103, 20, 6, 'https://drive.google.com/file/d/1-NI_a33qpt5DtFKNyow82MGNxVip7i2T/view'),
(104, 20, 7, 'https://drive.google.com/file/d/1RuYrYZhPcHNrM8njisvgjDfdwqIBOiGy/view'),
(105, 11, 3, 'https://drive.google.com/file/d/1nJ8KU_ziZfa_N5g42XPEE8jzz7xOeZXU/view'),
(106, 11, 4, 'https://drive.google.com/file/d/1FyY1M4Q7mKp6Js5cTcvu9RRglXprbhBv/view'),
(107, 11, 5, 'https://drive.google.com/file/d/17XikLQlzhV2KkNTnk46jqjLTfZBMJkkb/view'),
(108, 11, 6, 'https://drive.google.com/file/d/1Il_8D9KinFP4Q_1kk3IrBcs5hqKre9ga/view'),
(109, 12, 3, 'https://drive.google.com/file/d/1AvGlknRmT4HeEf-6Um7qd1b4_r1M5gE_/view'),
(110, 12, 4, 'https://drive.google.com/file/d/1cKigTR-EJf8gRmpTE1mruDoULN6CCYYg/view'),
(111, 12, 5, 'https://drive.google.com/file/d/1mwM2QdwH6sG4BLhjtrQGyl9xPgTbF5Sk/view'),
(112, 12, 6, 'https://drive.google.com/file/d/1xu4JEg9q4TrlfrNH9jpn7EB2AdwdZNan/view'),
(113, 15, 3, 'https://drive.google.com/file/d/1jDNLNSzXwYmosQ9Tp7BaiBzAn_h_0c_8/view'),
(114, 15, 4, 'https://drive.google.com/file/d/11GYXJ1GqK_xRKjfp4MnsTH0ocBS2xzZa/view'),
(115, 15, 5, 'https://drive.google.com/file/d/15qRXJkBZUlc4IvMi7zANwMIJF9G7EW3u/view'),
(116, 15, 6, 'https://drive.google.com/file/d/1ekHkASyKW8i_5xmtuw_AU4E4KUfdNa-4/view'),
(117, 15, 7, 'https://drive.google.com/file/d/1DCh6vq_AJNmGmVPA8tbBs2CIpEj52oFe/view'),
(118, 16, 3, 'https://drive.google.com/file/d/1fY62HtZJ-mfn6BZGxwkB5FZ1tjN_hGlo/view'),
(119, 16, 4, 'https://drive.google.com/file/d/1sovV9xr06cimrkU8CX6y883G4L_-IqKd/view'),
(120, 16, 5, 'https://drive.google.com/file/d/1U2ILEsuOpsrDXZFDVLo6UpPd_uaLDtOK/view'),
(121, 16, 6, 'https://drive.google.com/file/d/1MhDsfJlJj6v6hwRRY5nZLFqrKnP_2x8K/view'),
(122, 16, 7, 'https://drive.google.com/file/d/1oeDiFIGbqgcoO7NcYAap9IEFbHlpRXX8/view'),
(123, 16, 8, 'https://drive.google.com/file/d/1f7VzUxk96zGH3TmqUZ-ePcBxEXiSOJSo/view'),
(124, 18, 3, 'https://drive.google.com/file/d/1DT8NZSKKbT1fwHkgcsk55ownD1XK5STD/view'),
(125, 18, 4, 'https://drive.google.com/file/d/1GM8c2qUCZPnxTI1m1zB9WFShAsGD0Wyw/view'),
(126, 18, 5, 'https://drive.google.com/file/d/1VsvCOPhw4rllDby_8Pj_rHHgU1aDKXRZ/view'),
(127, 18, 6, 'https://drive.google.com/file/d/1Xj45tcsAh1ppd7iei0ckKrC2O6lcCL7y/view'),
(128, 18, 7, 'https://drive.google.com/file/d/1m71Qys4agLawx42VrktpKX0xYCMwMLeS/view'),
(129, 18, 8, 'https://drive.google.com/file/d/1ioJxc2Wg64vjBzPqTpsxmQ03qCFow0j7/view'),
(130, 18, 9, 'https://drive.google.com/file/d/19ZwxyAyo1FimIbmCzvSJ4UJd5NAiuhaT/view'),
(131, 18, 10, 'https://drive.google.com/file/d/1ygQ0KMINBU9KkZNWavLi-tH4gGIZDIz0/view'),
(132, 19, 3, 'https://drive.google.com/file/d/1hRDLX2lx3d5WHle8eSANn_QpAAaGLcXF/view'),
(133, 19, 4, 'https://drive.google.com/file/d/17QG1iVhcODlbArWSh8FSZa7CgvBqV98w/view'),
(134, 19, 5, 'https://drive.google.com/file/d/1BapLnh6Bw1l-gMhXS4M9al8jo6TSkHtT/view'),
(135, 19, 6, 'https://drive.google.com/file/d/14Rv80ClrQ9mQKLhSGMNirYAZXiPEqc6z/view'),
(136, 19, 7, 'https://drive.google.com/file/d/1Rr74JuSnwPBaoVLu0frFVflpt2GZwiDz/view'),
(137, 21, 3, 'https://drive.google.com/file/d/1LM48hg1RflJ_1IYeZblpdNXC030RIkMg/view'),
(138, 21, 4, 'https://drive.google.com/file/d/10IxiBRvlbwcWUYIvG5AmugXvxr_1gC16/view'),
(139, 21, 5, 'https://drive.google.com/file/d/18UbY3Fx6_Gs9pYaJetJf3RX1BJxl56qQ/view'),
(140, 21, 6, 'https://drive.google.com/file/d/1xSLtGkHRGJVpWcAYKOk7TzJp8l3iF3c4/view'),
(141, 21, 7, 'https://drive.google.com/file/d/1fYm9n7iLDScn4-kDK7Hio10FkbeIVaHQ/view'),
(142, 21, 8, 'https://drive.google.com/file/d/1JSvscm_hn1RMEri0ZxqV-7vgQPNHaT6R/view'),
(143, 21, 9, 'https://drive.google.com/file/d/1qui-XiNyjNdqylksW6UiX-9dBKs_G-TW/view'),
(144, 21, 10, 'https://drive.google.com/file/d/1lNi3XFASMfO7O12lsEY45h_w9UZRHaLv/view'),
(145, 21, 11, 'https://drive.google.com/file/d/1-zIBoTMqex1jSTwzbOFvjMEQWGiDYWlf/view'),
(146, 22, 1, 'https://drive.google.com/file/d/1xU0QFMvBnlecSMzGN6J6ZoOLsnznVfOK/view'),
(147, 22, 2, 'https://drive.google.com/file/d/1MWQepK-LoimvbFg5wSC1dOovm2VESh_2/view'),
(148, 22, 3, 'https://drive.google.com/file/d/1hebY8jsvNsULj4N3fHJk0jOsiKmdDKs7/view'),
(149, 22, 4, 'https://drive.google.com/file/d/1ze4p_Ud3q-FpYTCvl06F-EgdSgXSmiDG/view'),
(150, 22, 5, 'https://drive.google.com/file/d/1-o9JOb6GlanK3PEq-4n464zFZJv0Uo32/view'),
(151, 22, 6, 'https://drive.google.com/file/d/1KY5ulFC4rnCU-NWhGIczi804g23CS6rj/view'),
(152, 22, 7, 'https://drive.google.com/file/d/1qhuS5zGpRbDJ3S4xsC6W7WNywtql8Hnl/view'),
(153, 22, 8, 'https://drive.google.com/file/d/1lGaS-t9aUv-XvQCnHMlULTJZG4Q693TU/view'),
(154, 22, 9, 'https://drive.google.com/file/d/1LG4u53o9bMSfffTqrFqM4aU3slqt9GtP/view'),
(155, 22, 10, 'https://drive.google.com/file/d/1W2E7VFioqkOeiVTb_cM2-XT3oETkX5Df/view'),
(156, 22, 11, 'https://drive.google.com/file/d/1dZgkc4IjOf1y6rAl3DyzmvgPJRZ_bCdX/view'),
(157, 23, 0, 'https://drive.google.com/file/d/1fBdyclGK6mBLT2LPsBtvUJzelmO5d7CJ/view'),
(158, 23, 1, 'https://drive.google.com/file/d/1Zy9oKtEhfSvXCkJYW65ox2kF2Gn0rFjo/view'),
(159, 23, 2, 'https://drive.google.com/file/d/1_14SwdU3UXqQdA0pJe1Cmn7r2FCsdrEf/view'),
(160, 23, 3, 'https://drive.google.com/file/d/1_1aInaagEMy_Paa49A66GlkAwXGObRWy/view'),
(161, 23, 4, 'https://drive.google.com/file/d/1_N79rtelmhwrcJSecySQO451qHy_A1OI/view'),
(162, 23, 5, 'https://drive.google.com/file/d/1_Ray0iyUx59KW0d6ZFsk53dtT1nzWVRb/view'),
(163, 23, 6, 'https://drive.google.com/file/d/1_VCd5t2WvrK_D_0GuAHZT0-yt2_bdF1K/view'),
(164, 23, 7, 'https://drive.google.com/file/d/1_pUny0CST7nyZ-P_2bjfNKHWgHpuODwO/view'),
(165, 24, 1, 'https://drive.google.com/file/d/156q6-OzWQdD7A8CfMDp-3rr3VJk37d9O/view'),
(166, 26, 1, 'https://drive.google.com/file/d/1wvL6NGCu1cAy576VDsRAXo72vJjFdj7K/view'),
(167, 26, 2, 'https://drive.google.com/file/d/1Za6Lv7bWD91RmI3XdGEflqBck7XCRqQq/view'),
(168, 26, 3, 'https://drive.google.com/file/d/1kM2SZMpXqNGHt-jWcaPiWgCapi6jnjsE/view'),
(169, 26, 4, 'https://drive.google.com/drive/u/0/folders/1lKC_YiwKbn0Q-PtGHkPu1Jb__XWCWzPv'),
(170, 26, 5, 'https://drive.google.com/drive/u/0/folders/1lKC_YiwKbn0Q-PtGHkPu1Jb__XWCWzPv'),
(171, 26, 6, 'https://drive.google.com/drive/u/0/folders/1lKC_YiwKbn0Q-PtGHkPu1Jb__XWCWzPv'),
(172, 26, 7, 'https://drive.google.com/file/d/1MBumt4nOMuy7uRp4AlGtBPgBSmjKtFgf/view'),
(173, 26, 8, 'https://drive.google.com/file/d/1MS1V_UsGChVhnW8drpq1Z50XlbOX-e3k/view'),
(174, 26, 9, 'https://drive.google.com/drive/u/0/folders/1lKC_YiwKbn0Q-PtGHkPu1Jb__XWCWzPv'),
(175, 30, 1, 'https://drive.google.com/file/d/18OgFpwczWMoTikb0G-1EjZ0DQcnVw1Jk/view'),
(176, 30, 2, 'https://drive.google.com/file/d/1MeSJPZVVh0C3_t7CQLG6h23xTir0BtgX/view'),
(177, 30, 3, 'https://drive.google.com/file/d/1Gx09EklizPzEvsSpx10lDtOe5hanXCrB/view'),
(178, 30, 4, 'https://drive.google.com/file/d/1VRqCS-GjaGGtTd4wwUNk6WC3MYBiGZKS/view'),
(179, 30, 5, 'https://drive.google.com/file/d/18ymxuSnMAIGy_IrkVYzy-XMPQfJFmHE1/view'),
(182, 32, 1, 'https://drive.google.com/file/d/1rJGZ9dNHUUGs_bgdNB-w30uxL2PjX953/view'),
(184, 22, 12, 'https://drive.google.com/file/d/1y99HPh6yBHGLZL9j84moDrtsWMASaZd_/view'),
(185, 22, 12, 'https://drive.google.com/file/d/1y99HPh6yBHGLZL9j84moDrtsWMASaZd_/view'),
(186, 32, 2, 'https://drive.google.com/file/d/1rJiW0kRlmsIx016wlsA2KFr7farBIT6s/view'),
(187, 32, 3, 'https://drive.google.com/file/d/1_7y5Pqt5JUjRs1tlvjhX_WxOq6kQRgEe/view'),
(188, 32, 4, 'https://drive.google.com/file/d/1Sw09mF-_jj46WBhojIshgOdLBb4lqMx4/view'),
(189, 32, 5, 'https://drive.google.com/file/d/1IJvl9geO6hmlji2pNNSgAZhZ-jvm6QCX/view'),
(190, 32, 6, 'https://drive.google.com/file/d/1-unmYXFlpaNNzxnpsR_XIXpwH0AA57_o/view'),
(191, 32, 7, 'https://drive.google.com/file/d/1tFYQ-j7FobvCV9sNVhfdhojEbeOf9ahA/view'),
(192, 32, 8, 'https://drive.google.com/file/d/1TkyL0RqjWrXVoA8qaQAA0bnfII9QpIBh/view'),
(193, 32, 9, 'https://drive.google.com/file/d/1rza2KO9k0CuccT7BH178bU-qFXb0SqSg/view'),
(194, 32, 10, 'https://drive.google.com/file/d/1j3ezCKi4KFKJB5j5ELuIKmmC6QXgZUZi/view'),
(195, 32, 11, 'https://drive.google.com/file/d/1mKQOsAui2OdGhf0qyjWRPlo3XrFRhVIG/view'),
(196, 32, 12, 'https://drive.google.com/file/d/1TSBtY0GpbGif7IIzwGzgz4_DiU32PPEs/view'),
(197, 32, 13, 'https://drive.google.com/file/d/1w4oKzFDzAPMJQv-reJ48-1OrDhSVOGoM/view'),
(198, 32, 14, 'https://drive.google.com/file/d/1LHtro3iUI-rrIBXN4Nhksm77VTZUe4ML/view'),
(199, 32, 15, 'https://drive.google.com/file/d/13XKM1l4WnQ8-rUPxPM6lR8ehmVO_ykVy/view'),
(200, 32, 15, 'https://drive.google.com/file/d/13XKM1l4WnQ8-rUPxPM6lR8ehmVO_ykVy/view'),
(201, 30, 6, 'https://drive.google.com/file/d/1m58mDbR6k_2hfIrvmlwjAAv6yPWIh18n/view'),
(202, 30, 7, 'https://drive.google.com/file/d/1EOOAZxCK7v2LU5qfrSVbeHAGwGciDhei/view'),
(203, 30, 8, 'https://drive.google.com/file/d/1uCLsScy9hfqgNjzcUfMlfNCuBbg8nwOT/view'),
(204, 30, 9, 'https://drive.google.com/file/d/1TZJBi-cXyhL29PLSpLwPStafmZpG0rW2/view'),
(205, 30, 10, 'https://drive.google.com/file/d/1bwBVY0Rdfabz-nmjcQpqv7IxPtCcQdGa/view'),
(206, 30, 11, 'https://drive.google.com/file/d/1iywk4OAeRTkMCt2uPhxReODfH9SvfbqA/view'),
(207, 30, 12, 'https://drive.google.com/file/d/1wuRPi-hqyqYlz1I0mUJI2GRr1KFOi5Jw/view'),
(208, 30, 13, 'https://drive.google.com/file/d/1oTBn6h_QzPyKPL1HVsFgj5rTyQsmXdcq/view'),
(209, 30, 14, 'https://drive.google.com/file/d/1b7hoPECZ2ndVknWCTWrlAgEJ1A3X3RWv/view'),
(210, 30, 16, 'https://drive.google.com/file/d/1llAlQhRUbxmUozJDY0Q3leVgptwj_rwJ/view'),
(211, 21, 12, 'https://drive.google.com/file/d/1esTCIcabWrEuJurageysgpToSctVV4BU/view'),
(212, 21, 13, 'https://drive.google.com/file/d/1_bmyqKmrn9NXynv_dF3MaLdFdEjdPlP9/view'),
(213, 21, 14, 'https://drive.google.com/file/d/1v4KAXEFbBraEKWhuBbRU2p95du7medD3/view'),
(214, 21, 15, 'https://drive.google.com/file/d/1YGc6b-znDJ2OO0ZuZaBNXqJEuG9zlkwn/view'),
(215, 21, 16, 'https://drive.google.com/file/d/1W-0IfgFANSiv64YQs44eWrNuBMp6iwwN/view'),
(216, 21, 17, 'https://drive.google.com/file/d/18-XDzsd6_qkRC6rfxap7z-siv1d7qpfv/view'),
(217, 21, 18, 'https://drive.google.com/file/d/16JUDgR5XKUYNyPBmfi6BtI254hlVciuD/view'),
(218, 21, 19, 'https://drive.google.com/file/d/1tXdUEa74SN10OKHPFxyx1-5DShVumO6W/view'),
(219, 21, 20, 'https://drive.google.com/file/d/1VhMTHNcR9g8Pl4hoCSSXEb_RL0Ft8Ecv/view'),
(220, 21, 21, 'https://drive.google.com/file/d/1QlPwgILbgtQuDfzbvJagLmYVKDcpqhNE/view'),
(221, 21, 22, 'https://drive.google.com/file/d/1KKF25YokiK9pmlfpQffRul_6NRMXTcE7/view'),
(222, 21, 23, 'https://drive.google.com/file/d/1uZ7d0bV7yi8d97sGpz4c3huMs33M7WaR/view'),
(223, 21, 24, 'https://drive.google.com/file/d/1XN8vAkcXMySTLGoB_kF3TAIJqqjI5QdM/view'),
(224, 21, 25, 'https://drive.google.com/file/d/11AMgIapRLtJZjbJsrzjYqvtwZSChRtF_/view'),
(225, 8, 5, 'https://drive.google.com/file/d/16UgzDqN0IW1IlYPlPMjiLstrTMnYxKPe/view'),
(226, 8, 6, 'https://drive.google.com/file/d/1c-eqOXBKPoqVSVL2gxvA3O8xbeY9MGc0/view'),
(227, 8, 7, 'https://drive.google.com/file/d/12rfoDU3pqpne166G61eM6oUHNvjbcTJ_/view'),
(228, 8, 8, 'https://drive.google.com/file/d/1wfPLDEC1TW4rctit3Uid6m0hDmAtT1Fl/view'),
(229, 10, 5, 'https://drive.google.com/file/d/1e_CKZ8byymmJmGS7WLVUL4dhc4H3gajJ/view'),
(230, 10, 6, 'https://drive.google.com/file/d/1F4cgLNovdgKIMroA0liCCDT_pJWCueco/view'),
(231, 12, 1, 'https://drive.google.com/file/d/1W10okykBEPGmkAJY8rZ3BdP995CdAgco/view'),
(232, 12, 2, 'https://drive.google.com/file/d/1Rmt3t4myEdDlYejc2qOPoM6lAr8vKc96/view'),
(233, 16, 9, 'https://drive.google.com/file/d/1TstIDd4daRpy3DQijeoXIxwM-zWgB1lD/view'),
(236, 16, 10, 'https://drive.google.com/file/d/1MB8MTyZnXQEomCVCjjAaB7qpLLTRuJlw/view'),
(237, 20, 8, 'https://drive.google.com/file/d/1vYCWJE2ujL6mLC4Cjjp_4adpjPdYa5w8/view'),
(238, 20, 9, 'https://drive.google.com/file/d/1t0qPVj693gf8yONyuyaTuc3U94TcDxrw/view'),
(239, 20, 9, 'https://drive.google.com/file/d/1t0qPVj693gf8yONyuyaTuc3U94TcDxrw/view'),
(240, 20, 9, 'https://drive.google.com/file/d/1t0qPVj693gf8yONyuyaTuc3U94TcDxrw/view'),
(241, 20, 9, 'https://drive.google.com/file/d/1t0qPVj693gf8yONyuyaTuc3U94TcDxrw/view'),
(242, 20, 9, 'https://drive.google.com/file/d/1t0qPVj693gf8yONyuyaTuc3U94TcDxrw/view');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `animes`
--
ALTER TABLE `animes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `anime_generos`
--
ALTER TABLE `anime_generos`
  ADD PRIMARY KEY (`anime_id`,`genero_id`),
  ADD KEY `genero_id` (`genero_id`);

--
-- Indices de la tabla `episodios`
--
ALTER TABLE `episodios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_anime` (`id_anime`);

--
-- Indices de la tabla `favoritos`
--
ALTER TABLE `favoritos`
  ADD PRIMARY KEY (`user_id`,`anime_id`),
  ADD KEY `anime_id` (`anime_id`);

--
-- Indices de la tabla `generos`
--
ALTER TABLE `generos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `mangas`
--
ALTER TABLE `mangas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `manga_capitulos`
--
ALTER TABLE `manga_capitulos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_manga` (`id_manga`);

--
-- Indices de la tabla `novelas`
--
ALTER TABLE `novelas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `novela_generos`
--
ALTER TABLE `novela_generos`
  ADD PRIMARY KEY (`novela_id`,`genero_id`),
  ADD KEY `genero_id` (`genero_id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indices de la tabla `volumenes`
--
ALTER TABLE `volumenes`
  ADD PRIMARY KEY (`id_volumen`),
  ADD KEY `id_novela` (`id_novela`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `animes`
--
ALTER TABLE `animes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT de la tabla `episodios`
--
ALTER TABLE `episodios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=394;

--
-- AUTO_INCREMENT de la tabla `generos`
--
ALTER TABLE `generos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT de la tabla `mangas`
--
ALTER TABLE `mangas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `manga_capitulos`
--
ALTER TABLE `manga_capitulos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=231;

--
-- AUTO_INCREMENT de la tabla `novelas`
--
ALTER TABLE `novelas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `volumenes`
--
ALTER TABLE `volumenes`
  MODIFY `id_volumen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=243;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `anime_generos`
--
ALTER TABLE `anime_generos`
  ADD CONSTRAINT `anime_generos_ibfk_1` FOREIGN KEY (`anime_id`) REFERENCES `animes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `anime_generos_ibfk_2` FOREIGN KEY (`genero_id`) REFERENCES `generos` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `episodios`
--
ALTER TABLE `episodios`
  ADD CONSTRAINT `episodios_ibfk_1` FOREIGN KEY (`id_anime`) REFERENCES `animes` (`id`);

--
-- Filtros para la tabla `favoritos`
--
ALTER TABLE `favoritos`
  ADD CONSTRAINT `favoritos_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `favoritos_ibfk_2` FOREIGN KEY (`anime_id`) REFERENCES `animes` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `manga_capitulos`
--
ALTER TABLE `manga_capitulos`
  ADD CONSTRAINT `manga_capitulos_ibfk_1` FOREIGN KEY (`id_manga`) REFERENCES `mangas` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
