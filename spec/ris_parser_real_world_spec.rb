require 'spec_helper'

describe RefParsers::RISParser do
  subject { RefParsers::RISParser.new }

  context 'Real world' do
    context 'Zotero export' do
      let(:zotero_journal_article_export) { File.join('spec','fixtures','real_world','journal_article_zotero_export.ris') }

      let(:valid_return_data) {
        [{"type"=>"JOUR",
             "TI"=>"Communicating the terrorist risk: Harnessing a culture of fear?",
             "AU"=>["Mythen, Gabe", "Walklate, Sandra"],
             "T2"=>"Crime, Media, Culture",
             "AB"=>
                  "Following the terrorist attacks in New York, Washington, Madrid and London, state agencies have been bound up with the problem of how to effectively communicate the risk of terrorism to the general public. This article charts the UK government's attempts to engage in this process and illustrates how the communication of the terrorist risk meshes into broader cultural formations of crime and (in)security. Our analytical framework utilizes the risk society as the scene in which governmental strategies are parcelled up and unpacked. It is posited that the framing of the terrorist problem through the political discourse of ‘new terrorism’ has built upon and escalated a cultural climate of fear and uncertainty. At the level of political communication, it will be elucidated that media representations of the terrorist threat have served to further embed discourses of responsibilization. In our view such processes not only articulate a reduced notion of safety, they also pave the way for the simplistic construction of a non-white ‘terroristic other’ that has negative consequences for ethnic minority groups in the UK.",
             "DA"=>"2006/01/08/",
             "PY"=>"2006",
             "DO"=>"10.1177/1741659006065399",
             "DP"=>"cmc.sagepub.com",
             "VL"=>"2",
             "IS"=>"2",
             "SP"=>"123",
             "EP"=>"142",
             "J2"=>"Crime Media Culture",
             "LA"=>"en",
             "SN"=>"1741-6590, 1741-6604",
             "ST"=>"Communicating the terrorist risk",
             "UR"=>"http://cmc.sagepub.com/content/2/2/123",
             "Y2"=>"2014/07/28/00:50:15",
             "L2"=>"http://cmc.sagepub.com/content/2/2/123.short",
             "KW"=>["new terrorism", "politics of fear", "responsibilization", "risk"]}]
      }

      it 'will return an array of entries' do
        expect(subject.open(zotero_journal_article_export)).to eq valid_return_data
      end
    end
  end

end