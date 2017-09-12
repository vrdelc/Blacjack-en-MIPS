<h1><span style="text-decoration: underline;"><span style="color: #333333; text-decoration: underline;">Blackjack en MIPS</span></span></h1>
<h2>Normas:</h2>
<ol>
<li>Solo jugar&aacute;n al Blackjack dos jugadores.</li>
<li>El objetivo es llegar a sumar 21 puntos, y gana el jugador que m&aacute;s se&nbsp;acerce a los 21 puntos sin pasar de dicha cifra.</li>
<li>Cada jugador en su turno puede pedir cartas hasta que lo desee, y cuando&nbsp;finalice, comienza el turno del siguiente jugador en el caso de no haber&nbsp;sobrepasado los 21 puntos. Si sobrepasa los 21 puntos autom&aacute;ticamente&nbsp;dicho jugador que sobrepas&oacute; el l&iacute;mite pierde.</li>
<li>Cuando comienza el turno de un jugador, se reparten inicialmente dos&nbsp;cartas y se muestra el valor de la suma.</li>
<li>Las cartas ser&aacute;n n&uacute;meros del 1 al 12, sabiendo que el 1 realmente &nbsp;representa&nbsp;es el AS, el 10 la J, el 11 la Q y el 12 la K.</li>
<li>El valor de cada carta es equivalente a su n&uacute;mero, salvo en las cartas 1,&nbsp;11, 12 y 13. Las cartas 11, 12 y 13 suman cada una de ellas 10, mientras&nbsp;que la carta 1 puede sumar 11 o 1. Si al realizar la suma de la carta AS (1)&nbsp;con valor 11, el jugador sobrepasa los 21 puntos, entonces debe sumarse&nbsp;&uacute;nicamente 1. Es decir, suponemos los ejemplos siguientes:<br />
<ol style="list-style-type: lower-alpha;">
<li>Caso 1: AS + J = 1 + 10 = 11</li>
<li>Caso 2: AS + AS = 11 + 1 = 12 (el primer AS s&iacute; vale 11, el segundo<br />vale 1)</li>
<li>Caso 3: 7 + 5 + AS = 7 + 5 + 1 = 13 (ya que 7 + 5 + 11 sobrepasar&iacute;a<br />los 21)</li>
</ol>
</li>
<li>Si pidiendo cartas el jugador sobrepasa los 21 puntos, pierde. Si se planta&nbsp;antes, pasar&iacute;a a jugar el jugador 2.</li>
</ol>
<h2>Funcionamiento:</h2>
<ol>
<li>Se inicia el programa con un mensaje de bienvenida.</li>
<li>Turno del Jugador 1:<br />
<ol style="list-style-type: lower-alpha;">
<li>Se generan las 2 cartas iniciales del jugador que se almacenan en un&nbsp;array en el segmento de datos.</li>
<li>Se calcula el valor total de dichas cartas y se muestran las cartas y&nbsp;el valor en pantalla.</li>
<li>Despu&eacute;s se le pregunta al jugador si desea pedir otra carta o plantarse.</li>
<li>Si pide otra carta, se vuelve a generar una carta, se muestra y se&nbsp;actualiza el valor total y as&iacute; hasta que el jugador se plante.</li>
<li>Si el jugador se planta, se pasa al siguiente jugador, pero si no se&nbsp;ha plantado y sobrepasa los 21 puntos, se finaliza la partida porque&nbsp;pierde y volver&iacute;a a ejecutarse el men&uacute; inicial.</li>
</ol>
</li>
<li>Turno del Jugador 2:<br />a) La secuencia es exactamente igual que en el turno de Jugador 1,&nbsp;a&ntilde;adiendo al final una comparaci&oacute;n, en el caso de que se plante el&nbsp;Jugador 2 antes de sobrepasar 21, la cual compara los valores de la&nbsp;suma de las cartas del Jugador 1 con las del Jugador 2. Pueden darse&nbsp;cuatro casos al comparar los valores de las cartas de ambos jugadores:
<ol style="list-style-type: lower-alpha;">
<li>Caso 1: Ambos jugadores suman la misma cantidad de puntos,&nbsp;en ese caso el programa mostrar&aacute; el siguiente mensaje: &ldquo;Jugador&nbsp;1 y Jugador 2 han empatado la partida.&rdquo;</li>
<li>Caso 2: Las cartas del Jugador 1 suman un valor superior a&nbsp;las cartas del Jugador 2, en este caso el programa mostrar&aacute; el&nbsp;mensaje &ldquo;Ha ganado la partida el Jugador 1.&rdquo;</li>
<li>Caso 3: Las cartas del Jugador 2 suman un valor superior a&nbsp;las cartas del Jugador 1, en este caso el programa mostrar&aacute; el&nbsp;mensaje &ldquo;Ha ganado la partida el Jugador 2.&rdquo;</li>
<li>Caso 4: Uno de los dos Jugadores ha superado los 21 puntos,&nbsp;en ese caso el programa mostrar&aacute; el mensaje &ldquo;Ha perdido, ha&nbsp;superado los 21 puntos&rdquo;.&nbsp;</li>
</ol>
</li>
</ol>
<h2>C&oacute;digo:</h2>
<h3>Funci&oacute;n main:&nbsp;</h3>
<p>1. Mostrar el mensaje de bienvenida.<br />2. Comienza el turno del Jugador 1:</p>
<ol style="list-style-type: lower-alpha;">
<li>Se llamar&aacute; a la funci&oacute;n generarCartas, que generar&aacute; dos cartas&nbsp;(si es la primera vez) o una (si el Jugador pidi&oacute; carta) al Jugador&nbsp;1.</li>
<li>Se llamar&aacute; a la funci&oacute;n mostrarCartas, que mostrar&aacute; por pantalla&nbsp;las cartas que posee el Jugador 1.</li>
<li>Se llamar&aacute; a la funci&oacute;n calcularValor, que devolver&aacute; el valor total&nbsp;de la suma de las cartas que posee el Jugador 1. Dicho valor se&nbsp;mostrar&aacute; por pantalla</li>
<li>Si el valor total de las cartas es 21 o menor, se llamar&aacute; a la funci&oacute;n&nbsp;preguntarJugador. En caso contrario, finalizar&aacute; la partida&nbsp;indicando que Jugador 1 ha perdido la partida y finalizar&aacute; el&nbsp;programa.</li>
<li>Tras llamar a preguntarJugador, dicha funci&oacute;n devolver&aacute; la opci&oacute;n&nbsp;elegida por el usuario que ser&aacute; 1 o 2. Si eligi&oacute; 1, significa que&nbsp;quiere pedir otra carta, as&iacute; que se repetir&aacute; el proceso completo&nbsp;desde el punto a). Si elige 2, se plantar&aacute; y pasar&aacute; el turno al&nbsp;Jugador 2.</li>
</ol>
<p>3. Comienza el turno del Jugador 2:</p>
<ol style="list-style-type: lower-alpha;">
<li>Se llamar&aacute; a la funci&oacute;n generarCartas, que generar&aacute; dos cartas&nbsp;(si es la primera vez) o una (si el Jugador pidi&oacute; carta) al Jugador&nbsp;2.</li>
<li>Se llamar&aacute; a la funci&oacute;n mostrarCartas, que mostrar&aacute; por pantalla&nbsp;las cartas que posee el Jugador 2.</li>
<li>Se llamar&aacute; a la funci&oacute;n calcularValor, que devolver&aacute; el valor total&nbsp;de la suma de las cartas que posee el Jugador 2. Dicho valor se&nbsp;mostrar&aacute; por pantalla</li>
<li>Si el valor total de las cartas es 21 o menor, se llamar&aacute; a la funci&oacute;n<br />preguntarJugador. En caso contrario, finalizar&aacute; la partida<br />indicando que Jugador 2 ha perdido la partida y finalizar&aacute; el<br />programa.</li>
<li>Tras llamar a preguntarJugador, dicha funci&oacute;n devolver&aacute; la opci&oacute;n<br />elegida por el usuario que ser&aacute; 1 o 2. Si eligi&oacute; 1, significa que<br />quiere pedir otra carta, as&iacute; que se repetir&aacute; el proceso completo<br />desde el punto a). Si elige 2, se plantar&aacute;.</li>
<li>Si el jugador 2 se planta, la aplicaci&oacute;n comparar&aacute; el valor total<br />de las cartas de ambos jugadores (Jugador 1 y Jugador 2) y<br />mostrar&aacute; qui&eacute;n es el ganador de la partida o si han empatado.</li>
</ol>
<h3>Funci&oacute;n generaCartas:</h3>
<p>se le pasan dos argumentos, en $a0 el tama&ntilde;o del&nbsp;array y en $a1 la direcci&oacute;n de memoria del array del Jugador que est&eacute; en su&nbsp;turno. Se encargar&aacute; de generar un n&uacute;mero aleatorio entre 1 y 12, lo a&ntilde;adir&aacute;&nbsp;al array recibido por argumento en $a1 y devolver&aacute; el valor nuevo del total&nbsp;de cartas almacenadas en el array (usando la funci&oacute;n calcularValor ). Dicha&nbsp;funci&oacute;n no puede acceder al segmento de datos. Todo lo que necesite ha&nbsp;de ser pasado como argumento.</p>
<h3><br />Funci&oacute;n mostrarCartas:</h3>
<p>se le pasan tres argumentos, en $a0 la cadena&nbsp;para imprimir la &rsquo;,&rsquo;, en $a1 el tama&ntilde;o del array, en $a2 la direcci&oacute;n de&nbsp;memoria del array de cartas del Jugador. Dicha funci&oacute;n recorrer&aacute; el array&nbsp;de cartas e imprimir&aacute; el valor de la carta y una coma (salvo si la carta&nbsp;es la &uacute;ltima del array, en ese caso no imprimir&aacute; la coma). No devuelve&nbsp;ning&uacute;n valor. Dicha funci&oacute;n no puede acceder al segmento de datos. Todo&nbsp;lo que necesite ha de ser pasado como argumento.</p>
<h3><br />Funci&oacute;n calcularValor:</h3>
<p>se le pasan dos argumentos, en $a0 el array que&nbsp;contiene las cartas del jugador y en $a1 el tama&ntilde;o del array. Esta funci&oacute;n&nbsp;se encarga de recorrer el array de cartas y sumar los valores de cada una&nbsp;de las cartas. Una vez acabada la suma, finalizar&aacute; la funci&oacute;n devolviendo&nbsp;su valor en $v0. Dicha funci&oacute;n no puede acceder al segmento de datos.&nbsp;Todo lo que necesite ha de ser pasado como argumento.</p>
<h3><br />Funci&oacute;n preguntarJugador:</h3>
<p>se le pasa un argumento en $a0, la direcci&oacute;n&nbsp;a la cadena que solicita al usuario si desea volver a pedir una carta o&nbsp;plantarse. Imprime dicha cadena y lee un n&uacute;mero 1 o 2 y lo devuelve en&nbsp;$v0. No sale de la funci&oacute;n hasta que se lee un 1 o un 2.</p>
