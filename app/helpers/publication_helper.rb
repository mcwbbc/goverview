module PublicationHelper

  def pubmed_link(pubmed_id)
    if pubmed_id.blank?
      ""
    else
      link_to(pubmed_id, "http://www.ncbi.nlm.nih.gov/sites/entrez?Db=Pubmed&term=#{pubmed_id}[UID]", :target => "_blank", :class => "pubmedlink")
    end
  end
end
