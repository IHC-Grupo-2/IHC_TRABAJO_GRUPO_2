# ResiliNet | HU05
# Source: TF IHC - Grupo02 5.1.2.docx > 3.2 User Stories
# Specification only: not an executed/automated test result.
# User story: Como residente de un asentamiento en quebrada, quiero descargar previamente el mapa de mi distrito para consultar calles, trochas y puntos altos sin internet durante la emergencia.
# Acceptance criteria: CA01: El usuario debe poder seleccionar su zona o distrito ('Chosica - Quebrada Pedregal') y descargar el paquete de mapa vectorial (< 30 MB). CA02: El mapa descargado debe guardarse en el almacenamiento local del dispositivo (SQLite / cache). CA03: El sistema debe permitir renderizar el mapa completamente en modo avión o sin señal celular.

@hu05
Feature: Descarga y Almacenamiento Previo de Cartografía Vectorial

  Scenario: Successful offline map tile caching
    Given the user has internet access during initial onboarding
    When they select their zone 'Chosica - Quebrada Pedregal' and tap 'Descargar Mapa Offline'
    Then the system shall download and locally save the vector map package (< 30 MB).

  Scenario: Rendering map in complete offline mode
    Given the smartphone is set to Airplane Mode
    When the user opens the map screen
    Then the local vector map shall render completely with crisp street names and contour lines.
