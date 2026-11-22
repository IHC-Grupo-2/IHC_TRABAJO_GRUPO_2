# ResiliNet | HU44
# Source: TF IHC - Grupo02 5.1.2.docx > 3.2 User Stories
# Specification only: not an executed/automated test result.
# User story: Como líder de brigada, quiero que al detectar una conexión satelital o celular temporal la app retransmita todo el paquete consolidado a los servidores de INDECI / Municipio para garantizar la sincronización de la base de datos comunitaria con las autoridades gubernamentales.
# Acceptance criteria: CA01: Tan pronto como el dispositivo del brigadista detecte señal 4G/5G o Wi-Fi satelital, la app debe subir automáticamente los registros SQLite al endpoint municipal. CA02: El servidor debe responder con un código HTTP 200 OK confirmando la recepción del paquete de eventos. CA03: Tras la confirmación, la app debe actualizar el estado del panel a 'Sincronizado con Centro de Operaciones'.

@hu44
Feature: Puente de Retransmisión a Autoridades de Defensa Civil

  Scenario: Automatic upload when internet connectivity is detected
    Given the brigadier smartphone holding local offline records detects active 4G/Wi-Fi
    When network connection is established
    Then the application shall automatically push the local SQLite event log to the municipal cloud endpoint.

  Scenario: Server acknowledgement and local sync timestamp
    Given the cloud endpoint successfully ingests the event log
    When HTTP 200 OK is returned
    Then the app shall update its sync status to 'Sincronizado con Centro de Operaciones'.
