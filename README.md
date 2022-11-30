# Tarea Platanus: Torneo Pokemon

Este proyecto consiste en una simulacion de un torneo pokemon donde 8 pokemon seleccionados al azar participan en un torneo de eliminacion directa.

## Quickstart

Precionar Run correr el script ```main.rb```.

Para faciliar la lectura de los resultados en el terminal, al final de cada ronda se le pide al usuario presionar ```Enter``` para avanzar a la siguiente ronda.

## Funcionamiento

El codigo torneo.rb contiene el codigo para la ejecucion del torneo. 
Primero se obtiene la informacion de 8 pokemones al azar utilizando la api ```https://pokeapi.co/```. 

Se cuenta con la clase ```Pokemon``` que poosee los datos relevantes de cada pokemon y posee un metodo para simular el ataque de un pokemon a otro.

Se ejecutan las 3 rondas del torneo (Cuartos de final, Semifinales y Final) presentando primero el fixture y luego el resultado de cada batalla.

*Ejemplo de fixture*
```

                ---- seel     
          ----|
               ---- krabby   
     ----|
               ---- gloom    
          ----|
               ---- zapdos   
----|
               ---- horsea   
          ----|
               ---- dugtrio  
     ----|
               ---- moltres  
          ----|
               ---- blastoise
```

*Ejemplo de resultados de batalla*
```
golbat vs golem :
---------------------> Ganador golem     

aerodactyl vs shellder :
---------------------> Ganador aerodactyl

butterfree vs kadabra :
---------------------> Ganador butterfree

tauros vs starmie :
---------------------> Ganador tauros
```

La batalla de los pokemones se simula emulando las batallas de turnos de los juegos. 
Se considera el stat de *velocidad* de cada pokemon para determinar el orden de los ataques.
El daño causado por un pokemon a otro se calcula como:

$ Daño = A/D  * damageMultiplier * typeAdv $

- **A**: stat de ataque del pokemon atacante
- **D**: stat de defensa del pokemon recibiendo el ataque
- **damageMultiplier**: multiplicador de daño del ataque elegido al azar entre 1 y 1.9
- **typeAdv**: multiplicador de daño basado en la ventaja o desventaja del tipo del pokemon atacante al contrincante. (Por simplicidad se considera solo el tipo principal del pokemon y no el tipo secundarios)

La batalla continua hasta que el hp de alguno de los dos pokemones llega a 0
