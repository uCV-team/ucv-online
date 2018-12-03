RSpec::Matchers.define :be_pg_searched_by do |search_term|
  match { |model| expect(model.class.full_text_search(search_term)).to contain_exactly(model) }
end
