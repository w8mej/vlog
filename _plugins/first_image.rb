module Jekyll
  class FirstImageGenerator < Generator
    safe true
    priority :low

    def generate(site)
      # Process standard posts
      site.posts.docs.each do |doc|
        extract_first_image(doc)
      end

      # Process custom collections like tech_posts
      site.collections.each do |name, collection|
        next if name == 'posts' || name == 'pages'
        collection.docs.each do |doc|
          extract_first_image(doc)
        end
      end
    end

    private

    def extract_first_image(doc)
      # Skip if image is already explicitly defined in front matter
      return if doc.data['image'] && !doc.data['image'].empty?

      # Find first markdown image: ![Alt Text](/path/to/image.jpg)
      if doc.content =~ /!\[.*?\]\((.*?)\)/
        doc.data['image'] = $1
      # Alternatively, find first HTML image: <img src="/path/to/image.jpg">
      elsif doc.content =~ /<img.*?src=["'](.*?)["']/i
        doc.data['image'] = $1
      end
    end
  end
end
