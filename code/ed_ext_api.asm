;
; Interface contract for the extensions in P5.
;
P5_API_BASE = $8000

P5_API_ShowKeys = P5_API_BASE + 0
P5_API_CustomCrap = P5_API_ShowKeys + 3

P5_API_END = P5_API_CustomCrap + 3

.END