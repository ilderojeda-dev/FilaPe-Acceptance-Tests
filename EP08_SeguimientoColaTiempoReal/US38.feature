Feature: Personas antes del turno

  Background:
    Given que el ciudadano ha iniciado sesión en FilaPe
    And tiene un ticket virtual registrado en la plataforma

  Scenario: Consulta de personas pendientes antes del turno
    Given que el ciudadano tiene un ticket virtual asignado
    And existen otros turnos pendientes antes del suyo
    And la cola actual contiene la siguiente información:
      | numero_turno | personas_antes | estado    |
      | B014         | 7              | Pendiente |
    When el ciudadano revisa el estado de su turno
    And el sistema consulta la cola actual de atención
    Then el sistema muestra que faltan "7" personas antes de su turno
    And actualiza esta cantidad cuando se atienden turnos anteriores
    And ayuda al ciudadano a decidir cuándo acercarse a la entidad

  Scenario: Cantidad de personas antes del turno no disponible
    Given que el ciudadano tiene un ticket virtual asignado
    And desea conocer cuántas personas faltan antes de su atención
    When el sistema consulta la cola actual de la entidad
    And no recibe información válida sobre los turnos pendientes
    Then el sistema no muestra una cantidad aproximada de personas antes del turno
    And informa que la información de la cola no está disponible en ese momento
    And mantiene visible el último estado válido del ticket si existe