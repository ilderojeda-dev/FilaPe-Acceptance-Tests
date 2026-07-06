Feature: Guardado o descarga del ticket

  Background:
    Given que el ciudadano ha iniciado sesión en FilaPe
    And tiene un ticket virtual registrado en la plataforma

  Scenario: Descarga o guardado exitoso del ticket virtual
    Given que el ciudadano cuenta con un ticket virtual activo
    And desea conservar una copia para presentarla durante su atención
    And el ticket contiene la siguiente información:
      | entidad | sede             | tramite        | numero_turno | codigo_qr |
      | RENIEC  | Sede Lima Centro | Renovación DNI | A025         | Generado  |
    When selecciona la opción "Guardar" o "Descargar ticket"
    And el sistema procesa la solicitud
    Then el sistema genera una copia del ticket virtual
    And incluye la información principal del turno
    And permite que el ciudadano acceda al ticket aunque no esté en la pantalla principal

  Scenario: Descarga del ticket no completada
    Given que el ciudadano cuenta con un ticket virtual activo
    And desea guardar o descargar una copia del ticket
    When selecciona la opción "Guardar" o "Descargar ticket"
    And ocurre un error durante la generación o descarga del archivo
    Then el sistema no confirma el guardado del ticket
    And muestra el mensaje "La descarga no pudo completarse"
    And permite al ciudadano intentar nuevamente sin perder la información del ticket activo