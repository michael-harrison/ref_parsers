module RefParsers
  class RISParser < LineParser

    def initialize
      @type_key = 'TY'
      @types = available_types
      @terminator_key = 'ER'
      @line_regex = /^(#{supported_ris_tags})  -( (.*))?$/u
      @key_regex_order = 1
      @value_regex_order = 3
      @regex_match_length = 4
    end

    private
    def available_types
      raw_types.map { |type| type.force_encoding('UTF-8') }
    end

    def raw_types
      [
        "ABST",
        "ADVS",
        "ART",
        "BILL",
        "BOOK",
        "BLOG",
        "CASE",
        "CHAP",
        "COMP",
        "CONF",
        "CTLG",
        "DATA",
        "ELEC",
        "GEN",
        "HEAR",
        "ICOMM",
        "INPR",
        "JFULL",
        "JOUR",
        "MAP",
        "MGZN",
        "MPCT",
        "MUSIC",
        "NEWS",
        "PAMP",
        "PAT",
        "PCOMM",
        "RPRT",
        "SER",
        "SLIDE",
        "SOUND",
        "STAT",
        "THES",
        "UNBILl",
        "UNPB",
        "VIDEO"
      ]
    end

    # Return a string of the supported ris document attributes
    def supported_ris_tags
      @ris_document_attributes ||= document_types.map { |key, value| value }.flatten.uniq.join('|')
    end

    # RIS Document types taken directly from the RIS Format specifications excel document
    # http://www.refman.com/support/risformat_intro.asp
    # http://www.refman.com/support/direct%20export.zip
    def document_types
      {
        ORIGINAL: %w(TY ID T1 TI CT A1 A2 AU Y1 PY N1 KW RP SP EP JF JO JA J1 J2 VL IS T2 CY PB U1 U5 T3 N2 SN AV M1 M3 AD UR L1 L2 L3 L4 ER),
        GEN: %w(TY A2 A3 A4 AB AD AN AU C1 C2 C3 C4 C5 C6 C7 C8 CA CN CY DA DB DO DP ET J2 KW L1 L4 LA LB M1 M3 N1 NV OP PB PY RI RN RP SE SN SP ST T2 T3 TA TI TT UR VL Y2 ER),
        JOUR: %w(TY AB AD AN AU C1 C2 C6 C7 CA CN DA DB DO DP ET J2 KW L1 L4 LA LB IS M2 M3 N1 OP PY RI RN RP SN SP ST T2 TA TI TT UR VL Y2 ER),
        BLOG: %w(TY A2 A3 AB AD AN AU C1 CA CN CY DA DB DO DP ET J2 KW L1 L4 LA LB M3 N1 OP PB PY RN SE SN SP ST T2 T3 TA TI TT UR VL Y2 ER),
        BOOK: %w(TY A3 A2 A4 AB AD AN AU C3 C4 CA CN CY DA DB DO DP ET J2 KW L1 L4 LA LB M1 M3 N1 NV OP PB PY RN RP SE SN SP ST T2 TA TI TT UR VL Y2 ER),
        CASE: %w(TY A2 A3 A4 AB AD AN CA CN DA DB DO DP ET KW L1 L4 LA LB M3 N1 NV OP PB PY RN SE SP ST T3 TA TI TT UR VL Y2 ER),
        EBSCO: %w(JN VO)
      }
    end
  end
end