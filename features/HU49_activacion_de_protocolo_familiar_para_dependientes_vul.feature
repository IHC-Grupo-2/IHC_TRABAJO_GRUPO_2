# ResiliNet | HU49
# Source: TF IHC - Grupo02 5.1.2.docx > 3.2 User Stories
# Specification only: not an executed/automated test result.
# User story: Como bodeguero que atiende el negocio solo, quiero presionar un botón para activar a vecinos voluntarios para que ayuden a evacuar a mi familiar anciano para garantizar la seguridad de mi familiar mientras aseguro la tienda comercial.
# Acceptance criteria: CA01: El comerciante debe poder emitir una solicitud prioritaria 'Solicitar Apoyo Evacuación Familiar' asociada a su dirección residencial registrada. CA02: La solicitud debe retransmitirse por la red mesh a los vecinos de confianza y brigadistas cercanos. CA03: Tan pronto como un vecino acepta el pedido, la pantalla del comerciante debe mostrar 'Vecino [Nombre] en camino a asistir a su familiar'.

@hu49
Feature: Activación de Protocolo Familiar para Dependientes Vulnerables

  Scenario: Dispatching family assistance request to neighborhood mesh
    Given the merchant cannot leave the store immediately
    When they tap 'Solicitar Apoyo Evacuación Familiar' for their registered home address
    Then a high-priority request shall broadcast to nearby trusted neighbors and brigadiers.

  Scenario: Receiving neighbor endorsement confirmation
    Given a trusted neighbor accepts the assistance request on their device
    When the endorsement packet reaches the merchant via mesh
    Then the merchant screen shall display 'Vecino Carlos en camino a asistir a su familiar'.
