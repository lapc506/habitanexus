---
inclusion: always
---

# Directriz de Idioma para Especificaciones

## Regla Principal

TODOS los documentos de especificaciones (requirements.md, design.md, tasks.md) DEBEN escribirse completamente en español.

## Sintaxis EARS en Español

Cuando uses la sintaxis EARS (Easy Approach to Requirements Syntax), DEBES usar los siguientes términos en español:

- **CUANDO** (en lugar de WHEN)
- **ENTONCES** (en lugar de THEN) 
- **DEBERÁ** (en lugar de SHALL)
- **SI** (en lugar de IF)
- **Y** (en lugar de AND)
- **O** (en lugar de OR)
- **MIENTRAS** (en lugar de WHILE)
- **DONDE** (en lugar de WHERE)

## Ejemplos de Formato Correcto

```
1. CUANDO [evento] ENTONCES [sistema] DEBERÁ [respuesta]
2. SI [precondición] ENTONCES [sistema] DEBERÁ [respuesta]
3. CUANDO [evento] Y [condición] ENTONCES [sistema] DEBERÁ [respuesta]
```

## Aplicación

Esta directriz se aplica a:
- Todos los documentos de requisitos
- Criterios de aceptación
- Historias de usuario
- Documentación técnica de especificaciones
- Cualquier documento dentro de .kiro/specs/

## Excepción

Los nombres técnicos, APIs, tecnologías y código pueden mantenerse en inglés cuando sea apropiado (ej: gRPC, REST, GraphQL, NestJS, etc.).