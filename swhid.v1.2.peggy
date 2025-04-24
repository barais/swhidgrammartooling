identifier
  = coreidentifier qualifiers?

coreidentifier
  = "swh"i ":" schemeversion ":" objecttype ":" objectid

qualifiers
  = ";" qualifier qualifiers?

schemeversion
  = "1"

objecttype
  = "snp"i
  / "rel"i
  / "rev"i
  / "dir"i
  / "cnt"i

objectid
  = (HEXDIG)|40|

qualifier
  = contextqualifier
  / fragmentqualifier

HEXDIG
  = DIGIT
  / "A"i
  / "B"i
  / "C"i
  / "D"i
  / "E"i
  / "F"i

contextqualifier
  = originctxt
  / visitctxt
  / anchorctxt
  / pathctxt

fragmentqualifier
  = "lines"i "=" range
  / "bytes"i "=" range

DIGIT
  = [\x30-\x39]

originctxt
  = "origin"i "=" urlescaped

visitctxt
  = "visit"i "=" coreidentifier

anchorctxt
  = "anchor"i "=" coreidentifier

pathctxt
  = "path"i "=" pathabsoluteescaped

range
  = number ("-" number)?

urlescaped
  = IRI

pathabsoluteescaped
  = ipath_absolute

number
  = (DIGIT)+

IRI
  = scheme ":" ihier_part ("?" iquery)? ("#" ifragment)?

ipath_absolute
  = "/" (isegment_nz ("/" isegment)*)?

scheme
  = ALPHA (ALPHA / DIGIT / "+" / "-" / ".")*

ihier_part
  = "//" iauthority ipath_abempty
  / ipath_absolute
  / ipath_rootless
  / ipath_empty

iquery
  = (ipchar / iprivate / "/" / "?")*

ifragment
  = (ipchar / "/" / "?")*

isegment_nz
  = ipchar+

isegment
  = ipchar*

ALPHA
  = [\x41-\x5a]
  / [\x61-\x7a]

iauthority
  = (iuserinfo "@")? ihost (":" port)?

ipath_abempty
  = ("/" isegment)*

ipath_rootless
  = isegment_nz ("/" isegment)*

ipath_empty
  = (. { error(`Can't convert prose description to peggy grammar: "ipchar"`) })

ipchar
  = iunreserved
  / pct_encoded
  / sub_delims
  / ":"
  / "@"

iprivate
  = [\ue000-\uf8ff]
  / "\udb80" [\udc00-\udfff]
  / [\udb81-\udbbe] [\udc00-\udfff]
  / "\udbbf" [\udc00-\udffd]
  / "\udbc0" [\udc00-\udfff]
  / [\udbc1-\udbfe] [\udc00-\udfff]
  / "\udbff" [\udc00-\udffd]

iuserinfo
  = (iunreserved / pct_encoded / sub_delims / ":")*

ihost
  = IP_literal
  / IPv4address
  / ireg_name

port
  = DIGIT*

iunreserved
  = ALPHA
  / DIGIT
  / "-"
  / "."
  / "_"
  / "~"
  / ucschar

pct_encoded
  = "%" HEXDIG HEXDIG

sub_delims
  = "!"
  / "$"
  / "&"
  / "'"
  / "("
  / ")"
  / "*"
  / "+"
  / ","
  / ";"
  / "="

IP_literal
  = "[" (IPv6address / IPvFuture) "]"

IPv4address
  = dec_octet "." dec_octet "." dec_octet "." dec_octet

ireg_name
  = (iunreserved / pct_encoded / sub_delims)*

ucschar
  = [\xa0-\ud7ff]
  / [\uf900-\ufdcf]
  / [\ufdf0-\uffef]
  / "\ud800" [\udc00-\udfff]
  / [\ud801-\ud83e] [\udc00-\udfff]
  / "\ud83f" [\udc00-\udffd]
  / "\ud840" [\udc00-\udfff]
  / [\ud841-\ud87e] [\udc00-\udfff]
  / "\ud87f" [\udc00-\udffd]
  / "\ud880" [\udc00-\udfff]
  / [\ud881-\ud8be] [\udc00-\udfff]
  / "\ud8bf" [\udc00-\udffd]
  / "\ud8c0" [\udc00-\udfff]
  / [\ud8c1-\ud8fe] [\udc00-\udfff]
  / "\ud8ff" [\udc00-\udffd]
  / "\ud900" [\udc00-\udfff]
  / [\ud901-\ud93e] [\udc00-\udfff]
  / "\ud93f" [\udc00-\udffd]
  / "\ud940" [\udc00-\udfff]
  / [\ud941-\ud97e] [\udc00-\udfff]
  / "\ud97f" [\udc00-\udffd]
  / "\ud980" [\udc00-\udfff]
  / [\ud981-\ud9be] [\udc00-\udfff]
  / "\ud9bf" [\udc00-\udffd]
  / "\ud9c0" [\udc00-\udfff]
  / [\ud9c1-\ud9fe] [\udc00-\udfff]
  / "\ud9ff" [\udc00-\udffd]
  / "\uda00" [\udc00-\udfff]
  / [\uda01-\uda3e] [\udc00-\udfff]
  / "\uda3f" [\udc00-\udffd]
  / "\uda40" [\udc00-\udfff]
  / [\uda41-\uda7e] [\udc00-\udfff]
  / "\uda7f" [\udc00-\udffd]
  / "\uda80" [\udc00-\udfff]
  / [\uda81-\udabe] [\udc00-\udfff]
  / "\udabf" [\udc00-\udffd]
  / "\udac0" [\udc00-\udfff]
  / [\udac1-\udafe] [\udc00-\udfff]
  / "\udaff" [\udc00-\udffd]
  / "\udb00" [\udc00-\udfff]
  / [\udb01-\udb3e] [\udc00-\udfff]
  / "\udb3f" [\udc00-\udffd]
  / "\udb44" [\udc00-\udfff]
  / [\udb45-\udb7e] [\udc00-\udfff]
  / "\udb7f" [\udc00-\udffd]

IPv6address
  = (h16 ":")|6| ls32
  / "::" (h16 ":")|5| ls32
  / h16? "::" (h16 ":")|4| ls32
  / ((h16 ":")? h16)? "::" (h16 ":")|3| ls32
  / ((h16 ":")|..2| h16)? "::" (h16 ":")|2| ls32
  / ((h16 ":")|..3| h16)? "::" h16 ":" ls32
  / ((h16 ":")|..4| h16)? "::" ls32
  / ((h16 ":")|..5| h16)? "::" h16
  / ((h16 ":")|..6| h16)? "::"

IPvFuture
  = "v"i HEXDIG+ "." (unreserved / sub_delims / ":")+

dec_octet
  = DIGIT
  / [\x31-\x39] DIGIT
  / "1" DIGIT|2|
  / "2" [\x30-\x34] DIGIT
  / "25" [\x30-\x35]

h16
  = HEXDIG|1..4|

ls32
  = (h16 ":" h16)
  / IPv4address

unreserved
  = ALPHA
  / DIGIT
  / "-"
  / "."
  / "_"
  / "~"

