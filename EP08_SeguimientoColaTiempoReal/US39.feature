Feature: Actualización automática del avance de cola

  Background:
    Given que la entidad pública se encuentra integrada con FilaPe
    And la cola virtual se encuentra activa en la plataforma

  Scenario: Actualización automática del avance de cola
    Given que la entidad pública está atendiendo turnos durante la jornada
    And existe la siguiente información de cola:
      | turno_atendido | siguiente_turno | estado_cola |
      | B013           | B014            | Activa      |
    When la entidad marca un turno como "Atendido"
    And el sistema recibe la actualización correspondiente
    Then FilaPe actualiza automáticamente el avance de la cola
    And refleja los cambios en la pantalla del usuario
    And mantiene la información sincronizada sin que el ciudadano recargue manualmente

  Scenario: Actualización automática interrumpida por falla de sincronización
    Given que la entidad pública está atendiendo turnos durante la jornada
    And existe la siguiente información de cola:
      | turno_atendido | siguiente_turno | estado_cola |
      | B013           | B014            | Activa      |
    When la entidad cambia el estado de un turno
    And FilaPe no logra recibir o procesar la actualización automáticamente
    Then el sistema no actualiza la cola con información incompleta
    And mantiene el último estado válido mostrado al ciudadano
    And registra la falla de sincronización para su revisión