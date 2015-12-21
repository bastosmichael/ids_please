class IdsPlease
  module Parsers
    class Klout < IdsPlease::Parsers::Base

      MASK = /klout/i

      class << self
        def parse_link(link)
          query = CGI.parse(link.query) if link.query && !link.query.empty?

          if query && !query['id'].empty?
            query['id'].first
          elsif link.path =~ /\/user\// || link.path =~ /\/app_scoped_user_id\//
            link.path.split('/').last
          else
            link.path.split('/')[1]
          end
        end
      end

    end
  end
end
