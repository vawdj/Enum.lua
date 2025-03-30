# Enum.lua

This is a simple and flexible enumeration implementation for Lua that allows for both automatic and manual value assignment.

## Overview

The `Enum()` function creates a new enumeration object using Lua's metatables. Each key accessed in the enum is automatically assigned an incremental numeric value, starting from 1. You can also manually set specific values if needed.

## Features
- Automatic incremental value assignment
- Manual value override capability
- Clean, chainable syntax

## Basic Usage

```lua
-- Create a new enum
local Colors = Enum()
    .RED    -- 1
    .GREEN  -- 2
    .BLUE   -- 3

-- Access values
print(Colors.RED)    -- Output: 1
print(Colors.GREEN)  -- Output: 2
print(Colors.BLUE)   -- Output: 3
```

## Manual Value Assignment

You can manually set specific values by using the call syntax:

```lua
local HttpStatus = Enum()
    .OK(200)
    .NOT_FOUND(404)
    .SERVER_ERROR(500)

print(HttpStatus.OK)          -- Output: 200
print(HttpStatus.NOT_FOUND)   -- Output: 404
print(HttpStatus.SERVER_ERROR) -- Output: 500
```

## Alternative Syntax

You can also create and assign values with a different syntax pattern:

```lua
local Test = Enum()
Test.ONE()   -- 1
Test.TWO()   -- 2
Test.THREE() -- 3

print(Test.ONE)   -- Output: 1
print(Test.TWO)   -- Output: 2
print(Test.THREE) -- Output: 3

-- With manual values
local Status = Enum()
Status.SUCCESS(0)
Status.ERROR(1)

print(Status.SUCCESS) -- Output: 0
print(Status.ERROR)   -- Output: 1
```

## Mixed Automatic and Manual Assignment

```lua
local Permissions = Enum()
    .READ      -- 1
    .WRITE     -- 2
    .EXECUTE(4) -- manually set to 4
    .ADMIN     -- 5

print(Permissions.READ)    -- Output: 1
print(Permissions.WRITE)   -- Output: 2
print(Permissions.EXECUTE) -- Output: 4
print(Permissions.ADMIN)   -- Output: 5
```