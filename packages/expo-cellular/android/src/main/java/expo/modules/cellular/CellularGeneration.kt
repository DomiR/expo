package expo.modules.cellular

import expo.modules.kotlin.types.EnumArgument

enum class CellularGeneration(val value: Int) : EnumArgument {
  UNKNOWN(0),
  CG_2G(1),
  CG_3G(2),
  CG_4G(3),
  CG_5G(4),
}
