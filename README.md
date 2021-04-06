# Elementos - Lab - Pequena CPU

![](ula-aplicada.svg)

Para testar:

`./testeLab.py`

Deve modificar o arquivo:

- `src/controlUnit.vhd`

Linguagem de máquina

| Linguagem de maquina | Instrução               | OP CODE |
|----------------------|-------------------------|---------|
| `0000`               | `REG_C` = `REG_C`       | nop     |
| `0001`               | `REG_C` = `0`           | mov 0,C |
| `1000`               | `REG_C` = !`REG_C`      | not C   |
| `1001`               | `REG_C` = `REG_C` + 1   | add 1,C |
| `1010`               | `REG_C` = `REG_C` + `Y` | add Y,C |
| `1011`               | `REG_C` = `REG_C` - 1   | sub 1,C |
