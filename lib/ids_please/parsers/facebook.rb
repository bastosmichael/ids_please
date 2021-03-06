class IdsPlease
  module Parsers
    class Facebook < IdsPlease::Parsers::Base

      MASK = /fb\.me|fb\.com|facebook/i

      class << self
        def parse_link(link)
          query = CGI.parse(link.query) if link.query && !link.query.empty?

          if query && !query['id'].empty?
            query['id'].first
          elsif link.path =~ /\/pages\// || link.path =~ /\/app_scoped_user_id\//
            link.path.split('/').last
          else
            link.path.split('/')[1]
          end
        end
      end

    end
  end
end
