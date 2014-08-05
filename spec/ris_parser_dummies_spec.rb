require 'spec_helper'

describe RefParsers::RISParser do
  subject { RefParsers::RISParser.new }

  context 'Generic document types' do
    let(:generic) { File.join('spec','fixtures','dummy','generic_type.ris') }

    let(:valid_generic_data) {
      [{"type"=>"GEN",
        "A2"=>"Secondary Author",
        "A3"=>"Tertiary Author",
        "A4"=>"Subsidiary Author",
        "AB"=>"Abstract",
        "AD"=>"Author Address",
        "AN"=>"Accession Number",
        "AU"=>"Author",
        "C1"=>"Custom 1",
        "C2"=>"Custom 2",
        "C3"=>"Custom 3",
        "C4"=>"Custom 4",
        "C5"=>"Custom 5",
        "C6"=>"Custom 6",
        "C7"=>"Custom 7",
        "C8"=>"Custom 8",
        "CA"=>"Caption",
        "CN"=>"Call Number",
        "CY"=>"Place Published",
        "DA"=>"Date",
        "DB"=>"Name of Database",
        "DO"=>"DOI",
        "DP"=>"Database Provider",
        "ET"=>"Edition",
        "J2"=>"Alternate Title",
        "KW"=>"Keywords",
        "L1"=>"File Attachments",
        "L4"=>"Figure",
        "LA"=>"Language",
        "LB"=>"Label",
        "M1"=>"Number",
        "M3"=>"Type of Work",
        "N1"=>"Notes",
        "NV"=>"Number of Volumes",
        "OP"=>"Original Publication",
        "PB"=>"Publisher",
        "PY"=>"Year",
        "RI"=>"Reviewed Item",
        "RN"=>"Research Notes",
        "RP"=>"Reprint Edition",
        "SE"=>"Section",
        "SN"=>"ISBN/ISSN",
        "SP"=>"Pages",
        "ST"=>"Short Title",
        "T2"=>"Secondary Title",
        "T3"=>"Tertiary Title",
        "TA"=>"Translated Author",
        "TI"=>"Title",
        "TT"=>"Translated Title",
        "UR"=>"URL",
        "VL"=>"Volume",
        "Y2"=>"Access Date"}]
    }

    it 'will return an array of entries' do
      expect(subject.open(generic)).to eq valid_generic_data
    end
  end

  context 'Journal article document types' do
    let(:journal_article) { File.join('spec','fixtures','dummy','journal_article_type.ris') }

    let(:valid_journal_article_data) {
      [{"type"=>"JOUR",
        "AB"=>"Abstract",
        "AD"=>"Author Address",
        "AN"=>"Accession Number",
        "AU"=>"Author",
        "C1"=>"Legal Note",
        "C2"=>"PMCID",
        "C6"=>"NIHMSID",
        "C7"=>"Article Number",
        "CA"=>"Caption",
        "CN"=>"Call Number",
        "DA"=>"Date",
        "DB"=>"Name of Database",
        "DO"=>"DOI",
        "DP"=>"Database Provider",
        "ET"=>"Epub Date",
        "J2"=>"Alternate Journal",
        "KW"=>"Keywords",
        "L1"=>"File Attachments",
        "L4"=>"Figure",
        "LA"=>"Language",
        "LB"=>"Label",
        "IS"=>"Issue",
        "M2"=>"Start Page",
        "M3"=>"Type of Article",
        "N1"=>"Notes",
        "OP"=>"Original Publication",
        "PY"=>"Year",
        "RI"=>"Reviewed Item",
        "RN"=>"Research Notes",
        "RP"=>"Reprint Edition",
        "SN"=>"ISSN",
        "SP"=>"Pages",
        "ST"=>"Short Title",
        "T2"=>"Journal",
        "TA"=>"Translated Author",
        "TI"=>"Title",
        "TT"=>"Translated Title",
        "UR"=>"URL",
        "VL"=>"Volume",
        "Y2"=>"Access Date"}]
    }
    
    it 'will return an array of entries' do
      expect(subject.open(journal_article)).to eq valid_journal_article_data
    end
  end

  context 'Blog document type' do
    let(:blog) { File.join('spec','fixtures','dummy','blog_type.ris') }

    let(:valid_blog_data) {
      [{"type"=>"BLOG",
          "A2"=>"Editor",
          "A3"=>"Illustrator",
          "AB"=>"Abstract",
          "AD"=>"Author Address",
          "AN"=>"Accession Number",
          "AU"=>"Author",
          "C1"=>"Author Affiliation",
          "CA"=>"Caption",
          "CN"=>"Call Number",
          "CY"=>"City",
          "DA"=>"Last Update Date",
          "DB"=>"Name of Database",
          "DO"=>"DOI",
          "DP"=>"Database Provider",
          "ET"=>"Edition",
          "J2"=>"Alternate Title",
          "KW"=>"Keywords",
          "L1"=>"File Attachments",
          "L4"=>"Figure",
          "LA"=>"Language",
          "LB"=>"Label",
          "M3"=>"Type of Medium",
          "N1"=>"Notes",
          "OP"=>"Content",
          "PB"=>"Publisher",
          "PY"=>"Year",
          "RN"=>"Research Notes",
          "SE"=>"Message Number",
          "SN"=>"ISBN",
          "SP"=>"Description",
          "ST"=>"Short Title",
          "T2"=>"Title of WebLog",
          "T3"=>"Institution",
          "TA"=>"Translated Author",
          "TI"=>"Title of Entry",
          "TT"=>"Translated Title",
          "UR"=>"URL",
          "VL"=>"Access Year",
          "Y2"=>"Access Date"}]
    }

    it 'will return an array of entries' do
      expect(subject.open(blog)).to eq valid_blog_data
    end
  end

  context 'Book document type' do
    let(:book) { File.join('spec','fixtures','dummy','book_type.ris') }

    let(:valid_book_data) {
      [{"type"=>"BOOK",
          "A3"=>"Editor",
          "A2"=>"Series Editor",
          "A4"=>"Translator",
          "AB"=>"Abstract",
          "AD"=>"Author Address",
          "AN"=>"Accession Number",
          "AU"=>"Author",
          "C3"=>"Title Prefix",
          "C4"=>"Reviewer",
          "CA"=>"Caption",
          "CN"=>"Call Number",
          "CY"=>"City",
          "DA"=>"Date",
          "DB"=>"Name of Database",
          "DO"=>"DOI",
          "DP"=>"Database Provider",
          "ET"=>"Edition",
          "J2"=>"Abbreviation",
          "KW"=>"Keywords",
          "L1"=>"File Attachments",
          "L4"=>"Figure",
          "LA"=>"Language",
          "LB"=>"Label",
          "M1"=>"Series Volume",
          "M3"=>"Type of Work",
          "N1"=>"Notes",
          "NV"=>"Number of Volumes",
          "OP"=>"Original Publication",
          "PB"=>"Publisher",
          "PY"=>"Year",
          "RN"=>"Research Notes",
          "RP"=>"Reprint Edition",
          "SE"=>"Pages",
          "SN"=>"ISBN",
          "SP"=>"Number of Pages",
          "ST"=>"Short Title",
          "T2"=>"Series Title",
          "TA"=>"Translated Author",
          "TI"=>"Title",
          "TT"=>"Translated Title",
          "UR"=>"URL",
          "VL"=>"Volume",
          "Y2"=>"Access Date"}]
    }

    it 'will return an array of entries' do
      expect(subject.open(book)).to eq valid_book_data
    end
  end

  context 'Legal case (case) document type' do
    let(:legal_case) { File.join('spec','fixtures','dummy','case_type.ris') }

    let(:valid_case_data) {
      [{"type"=>"CASE",
          "A2"=>"Reporter",
          "A3"=>"Higher Court",
          "A4"=>"Counsel",
          "AB"=>"Abstract",
          "AD"=>"Author Address",
          "AN"=>"Accession Number",
          "CA"=>"Caption",
          "CN"=>"Call Number",
          "DA"=>"Date Decided",
          "DB"=>"Name of Database",
          "DO"=>"DOI",
          "DP"=>"Database Provider",
          "ET"=>"Action of Higher Court",
          "KW"=>"Keywords",
          "L1"=>"File Attachments",
          "L4"=>"Figure",
          "LA"=>"Language",
          "LB"=>"Label",
          "M3"=>"Citation of Reversal",
          "N1"=>"Notes",
          "NV"=>"Reporter Abbreviation",
          "OP"=>"History",
          "PB"=>"Court",
          "PY"=>"Year Decided",
          "RN"=>"Research Notes",
          "SE"=>"Filed Date",
          "SP"=>"First Page",
          "ST"=>"Abbreviated Case Name",
          "T3"=>"Decision",
          "TA"=>"Translated Author",
          "TI"=>"Case Name",
          "TT"=>"Translated Title",
          "UR"=>"URL",
          "VL"=>"Reporter Volume",
          "Y2"=>"Access Date"}]
    }

    it 'will return an array of entries' do
      expect(subject.open(legal_case)).to eq valid_case_data
    end
  end

end