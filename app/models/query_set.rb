class QuerySet
  def initialize
    @queries = {
      "Read Data" => create_map(
        "readHero",
        "readHeroByEpisode",
        "readLukesFriends",
        "readSiblings",
      ),
      "Introspection" => create_map(
        "introspectHumanType",
        "introspectSchema",
      ),
      "Invalid Queries" => create_map(
        "invalidFields",
        "invalidNestedFragments"
      ),
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

  def create_map(*names)
    names.each_with_object({}) do |name, memo|
      memo[name] = read_query(name)
    end
  end
end
