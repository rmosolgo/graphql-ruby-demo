class QuerySet
  def initialize
    @queries = {
      "Read Data" => {
        "readHero" => read_query("readHero"),
        "readLukesFriends" => read_query("readLukesFriends"),
        "readSiblings" => read_query("readSiblings"),
      },
      "Introspection" => {
        "introspectHumanType" => read_query("introspectHumanType"),
        "introspectSchema" => read_query("introspectSchema"),
      },
    }
  end

  def as_json(options={})
    @queries
  end

  private

  def read_query(name)
    file = Rails.root.join("app", "graph", "queries", "#{name}.graphql")
    File.read(file)
  end
end
