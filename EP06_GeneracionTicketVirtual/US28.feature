Feature: Código QR del ticket

  Background:
    Given que el ciudadano ha iniciado sesión en FilaPe
    And tiene un ticket virtual registrado en la plataforma

  Scenario: Generación de código QR para validación del turno
    Given que el ciudadano tiene un ticket virtual activo
    And el turno fue reconocido por la entidad correspondiente
    And el ticket contiene la siguiente información:
      | id_ticket | numero_turno | estado |
      | TCK-001   | A025         | Activo |
    When el ciudadano accede al detalle de su turno
    And el sistema genera los datos de validación del ticket
    Then el sistema muestra un código QR único asociado al ticket
    And permite que el ciudadano lo presente al llegar a la entidad
    And evita que el mismo código sea utilizado para otro turno

  Scenario: Código QR no generado por ticket no reconocido
    Given que el ciudadano tiene un ticket virtual registrado
    And el ticket contiene la siguiente información:
      | id_ticket | numero_turno | estado                |
      | TCK-001   | A025         | Pendiente de validación |
    When el ciudadano accede al detalle de su turno
    And el sistema no recibe confirmación oficial de la entidad correspondiente
    Then el sistema no genera el código QR del ticket
    And muestra el mensaje "El ticket está pendiente de validación"
    And permite al ciudadano esperar la confirmación o actualizar el estado del ticket