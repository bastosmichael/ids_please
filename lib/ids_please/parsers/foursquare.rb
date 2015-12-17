class IdsPlease
  module Parsers
    class Foursquare < IdsPlease::Parsers::Base

      MASK = /foursquare/i

      class << self
        def parse_link(link)
          query = CGI.parse(link.query) if link.query && !link.query.empty?

          if query && !query['id'].empty?
            query['id'].first
          elsif link.path =~ /\/user\//
            link.path.split('/').last
          else
            link.path.split('/')[1]
          end
        end
      end

    end
  end
end
