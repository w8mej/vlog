module Jekyll
  class IndexNow
    def self.generate_key_file(site)
      key = "1ce387df44a949eda3930b8089bff234"
      
      # Ensure _site directory exists
      FileUtils.mkdir_p(site.dest)
      
      # Write the key validation file
      File.open(File.join(site.dest, "#{key}.txt"), "w") do |f|
        f.write(key)
      end
      
      Jekyll.logger.info "IndexNow:", "Generated validation key #{key}.txt"
      key
    end

    def self.submit_urls(site, key)
      # Only submit in production
      unless ENV['JEKYLL_ENV'] == 'production'
        Jekyll.logger.info "IndexNow:", "Skipping submission (JEKYLL_ENV != production)"
        return
      end

      require 'net/http'
      require 'uri'
      require 'json'

      # Get the 10 most recent posts
      recent_posts = site.posts.docs.sort_by(&:date).reverse.take(10)
      
      host = site.config['url'].sub(/^https?:\/\//, '')
      
      # Construct the absolute URLs
      urls = recent_posts.map { |post| "#{site.config['url']}#{post.url}" }

      # Build the JSON payload
      payload = {
        host: host,
        key: key,
        keyLocation: "#{site.config['url']}/#{key}.txt",
        urlList: urls
      }

      Jekyll.logger.info "IndexNow:", "Submitting #{urls.length} URLs to api.indexnow.org"

      # Send the POST request
      uri = URI.parse("https://api.indexnow.org/indexnow")
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      
      request = Net::HTTP::Post.new(uri.request_uri)
      request['Content-Type'] = 'application/json; charset=utf-8'
      request.body = payload.to_json

      begin
        response = http.request(request)
        if response.code == '200'
          Jekyll.logger.info "IndexNow:", "Successfully submitted URLs (200 OK)"
        elsif response.code == '202'
           Jekyll.logger.info "IndexNow:", "Successfully submitted URLs (202 Accepted)"
        else
          Jekyll.logger.warn "IndexNow:", "Failed to submit URLs: #{response.code} #{response.message}"
        end
      rescue => e
        Jekyll.logger.error "IndexNow:", "Error submitting URLs: #{e.message}"
      end
    end
  end
end

Jekyll::Hooks.register :site, :post_write do |site|
  key = Jekyll::IndexNow.generate_key_file(site)
  Jekyll::IndexNow.submit_urls(site, key)
end
