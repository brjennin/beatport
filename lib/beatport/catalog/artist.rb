module Beatport
  module Catalog
    class Artist < Item
      has_many :genres, Genre
      has_many :subgenres, Genre
      has_one :images, Images
      has_many :top_downloads, Track
#      has_many :featured_releases, Release
    
      def self.find(*args)
        Client.retrieve 'artists', Artist, *args
      end

      def self.all(options = {})
        Client.retrieve 'artists', Artist, options
      end
    
      def top_downloads(options = {})
        @top_downloads ||= Track.most_popular_for_artist(id, options)
      end
    end
  end
end