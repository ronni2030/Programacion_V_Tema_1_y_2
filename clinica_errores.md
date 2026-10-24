# Clínica de errores — Tema 1.2

Para cada caso se indica la causa y la solución exacta (comando, ruta o ajuste).

| Caso | Situación | Causa | Solución |
|---|---|---|---|
| 1 | Ana agregó `C:\dev\flutter` al PATH y la terminal sigue diciendo que `flutter` no se reconoce. | Falta `\bin` en la ruta del PATH: el ejecutable `flutter.bat` está en `flutter\bin`, no en `flutter`. Además, una terminal abierta antes del cambio no ve el PATH nuevo. | Agregar `C:\dev\flutter\bin` al PATH del usuario y abrir una terminal nueva. Comprobar con `where.exe flutter`. |
| 2 | Luis cambió el PATH, pero VS Code muestra "Could not find a Flutter SDK". | VS Code se abrió antes del cambio de PATH y conserva el PATH anterior; también puede no tener seleccionada la ruta del SDK. | Cerrar y volver a abrir VS Code, o usar `Flutter: Change SDK` y elegir `C:\dev\flutter`. |
| 3 | El programa de María pide un número con `stdin.readLineSync()` y se queda detenido sin dejarla escribir. | La ejecución con F5 usa la Consola de depuración, que no admite entrada por teclado. | En `.vscode/launch.json` agregar `"console": "terminal"` para usar la terminal integrada (o ejecutar con `dart run`). |
| 4 | Pedro abre `ejercicio3.dart`, presiona F5 y se ejecuta `main.dart`. | El `launch.json` tiene `program` fijo apuntando a `main.dart` en lugar del archivo abierto. | Cambiar a `"program": "${file}"` para ejecutar el archivo que está abierto en el editor. |
| 5 | Carla guardó su SDK en `C:\Users\Carla\OneDrive\Mis cosas\flutter` y obtiene errores extraños. | La ruta tiene espacios y está dentro de una carpeta sincronizada con OneDrive, que bloquea o modifica archivos mientras Flutter los usa. | Mover el SDK a una ruta corta y local como `C:\dev\flutter` y actualizar el PATH a `C:\dev\flutter\bin`. |
| 6 | En una laptop de 8 GB, el emulador tarda varios minutos y congela el equipo. | El emulador de Android excede la memoria y el procesador disponibles. | Usar un destino ligero: Chrome (`flutter run -d chrome`) o un celular físico conectado por USB. |
| 7 *(adicional, ocurrió en mi práctica)* | Al ejecutar `iniciar.bat`, el script se detiene después de llamar a `flutter` y no ejecuta las líneas siguientes. | `flutter` es un archivo `.bat`; llamarlo sin `call` transfiere el control y no regresa al script. | Usar `call flutter --version` para que la ejecución regrese al archivo por lotes y continúe. |

## Conclusión

Documentar la causa exacta de cada error permite resolverlo con un cambio puntual (una ruta, una variable o una línea de configuración) en lugar de reinstalar el entorno.
