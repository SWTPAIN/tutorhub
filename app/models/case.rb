class Case < ActiveRecord::Base
  belongs_to :employer
  def self.text_search(query)
    rank = <<-RANK
      ts_rank(to_tsvector(title), plainto_tsquery(#{sanitize(query)})) +
      ts_rank(to_tsvector(title), plainto_tsquery(#{sanitize(query)}))
    RANK
    where("to_tsvector('english', title) @@ :q or
    to_tsvector('english', description) @@ :q", q: query).order("#{rank} desc")
  end

end
