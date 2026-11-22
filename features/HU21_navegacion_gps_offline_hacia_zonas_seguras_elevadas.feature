# ResiliNet | HU21
# Source: TF IHC - Grupo02 5.1.2.docx > 3.2 User Stories
# Specification only: not an executed/automated test result.
# User story: Como habitante evacuando bajo lluvia torrencial, quiero que la app trace una ruta a pie clara hacia la zona segura más cercana usando el GPS del celular sin datos móviles para llegar a salvo al punto alto sin depender de internet ni perderme en el camino.
# Acceptance criteria: CA01: La app debe calcular la ruta peatonal más corta hacia el punto alto o refugio más cercano utilizando el GPS local y el mapa vectorial precargado. CA02: La interfaz debe mostrar flechas direccionales de alto contraste en cada intersección. CA03: La navegación debe funcionar de forma continua sin requerir conexión a la red celular.

@hu21
Feature: Navegación GPS Offline hacia Zonas Seguras Elevadas

  Scenario: Computing pedestrian evacuation route offline
    Given the device has no internet access and active GPS location
    When an emergency alert triggers or the user taps 'Evacuar Ahora'
    Then the app shall calculate the shortest safe walking route to the nearest designated high ground.

  Scenario: Turn-by-turn visual arrow orientation
    Given the user is actively walking along the computed offline evacuation route
    When they reach an intersection or turn
    Then the UI shall display a high-contrast directional arrow indicating the exact turn.
