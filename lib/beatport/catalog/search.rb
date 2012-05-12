module Beatport
  module Catalog
    class Search
      def self.query(query, options = {})
        options['query'] = query

        Client.retrieve 'search', :auto, options
      end

      def self.query_of_type(query, type, options = {})
        options['query'] = query

        Client.retrieve 'search', Beatport::Catalog.send(type.constantize), options
      end

    end
  end
end