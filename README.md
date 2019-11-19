# flutter_coverage
Inspirado en el gran trabajo de [Annyce Davis](https://github.com/adavis).
Fue creado para automatizar tareas a la hora de testear aplicaciones realizadas en [Flutter](https://flutter.dev/).

## ¿Por qué fue creado?
El problema fue que tenía un error con el comando `genhtml -o coverage coverage/lcov.info`.
Al parecer es un error bastante común y tiene que ver con la forma en que el comando toma los `path`.
Me arrojaba el siguiente error en consola.

```
Processing file <file>.dart
genhtml: ERROR: cannot read <file>.dart
```

Estube probando varias formas de generar el reporte, pero sin éxito. 
Por lo que para no seguir perdiendo el tiempo decidí relalizar este script. 
Si es que hay una mejor forma de solucionar este problema, la sugerencia es bienvenida.

## Tareas del script
Este trabajo está basado en este [script](https://gist.github.com/adavis/c003d435d9633253483bc64d6ffade8b). 
Una explicación detallada de como funciona el mismo se encuentra en este [artículo](http://adavis.info/2019/03/bash-scripting-for-flutter-tests-and-code-coverage-reports.html).

Lo que se agregó es lo siguiente: 
- La función `ch_dir`, que lo que hace es reemplazar los path en el archivo lcov.info
- La función `open_cov`, que lo que hace es abrir el archivo en el navegador. 
Se puso en una nueva función para que sea más sencillo ajustarlo a las necesidades del que descarga este script.

# Para probar el script

Probado en un entorno Debian 8

- Clonar este proyecto

`git clone https://github.com/jorgesarabia/clean-my-report.git`

## Puede copiar el archivo a su entorno Flutter, o bien crear un alias. 

### Para copiar

`cp path_to_repo/test_with_coverage.sh path_to_project/` 

- Probar el script:

```
cd path_to_flutter_project
bash test_with_coverage.sh
```

### Crear un alias (Debian)
- Abrir el archivo donde están los alias:

```
vim ~/.bash_aliases
```
- Agregar el alias:

```
alias <tu_alias>='bash ~/path_a_este_proyecto/tests_with_coverage.sh'
```

- Probar el script:

```
cd path_to_flutter_project
<tu_alias>
```
