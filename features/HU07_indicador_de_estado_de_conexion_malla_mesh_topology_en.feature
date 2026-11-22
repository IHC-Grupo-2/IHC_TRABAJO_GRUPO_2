# ResiliNet | HU07
# Source: TF IHC - Grupo02 5.1.2.docx > 3.2 User Stories
# Specification only: not an executed/automated test result.
# User story: Como residente, quiero ver en pantalla el número de dispositivos vecinos conectados por Bluetooth para saber si la red en malla está activa a mi alrededor.
# Acceptance criteria: CA01: El encabezado (Header) de la aplicación debe mostrar el ícono de estado mesh y la cantidad de nodos conectados en tiempo real. CA02: Si hay 1 o más nodos en rango, el indicador debe mostrarse en verde con la leyenda 'Red Malla Activa: X Nodos'. CA03: Si no hay nodos ni internet, debe mostrar una alerta amarilla indicando aislamiento.

@hu07
Feature: Indicador de Estado de Conexión Malla (Mesh Topology en Header)

  Scenario: Displaying count of active peer nodes
    Given the device has established BLE connections with 4 neighboring smartphones
    When the user views the main status screen
    Then the app shall display 'Red Malla Activa: 4 Nodos Cercanos' with a green icon.

  Scenario: Warning banner when isolated from mesh
    Given the device detects 0 Bluetooth peers in range and has no internet
    When the main status screen is loaded
    Then it shall present a yellow warning 'Sin Nodos Mesh Cercanos - Mantenga Bluetooth Encendido'.
