Feature: Cancelación de ticket virtual

  Background:
    Given que el ciudadano ha iniciado sesión en FilaPe
    And tiene un ticket virtual registrado en la plataforma

  Scenario: Cancelación exitosa de ticket virtual
    Given que el ciudadano tiene un ticket virtual activo
    And el ticket aún no ha sido llamado para atención
    And el ticket contiene la siguiente información:
      | id_ticket | numero_turno | estado |
      | TCK-001   | A025         | Activo |
    When selecciona la opción "Cancelar ticket"
    And confirma que desea cancelar su turno
    Then el sistema cambia el estado del ticket a "Cancelado"
    And libera el cupo dentro de la cola correspondiente
    And muestra el mensaje "Ticket cancelado correctamente"

  Scenario: Cancelación rechazada porque el turno ya fue llamado
    Given que el ciudadano tiene un ticket virtual registrado
    And el ticket contiene la siguiente información:
      | id_ticket | numero_turno | estado      |
      | TCK-001   | A025         | En atención |
    When selecciona la opción "Cancelar ticket"
    And el sistema verifica el estado actual del turno
    Then el sistema no permite cancelar el ticket virtual
    And muestra el mensaje "El turno ya no puede ser cancelado"
    And mantiene el estado actual del ticket en la cola correspondiente