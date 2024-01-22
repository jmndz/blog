module TrixContentHelper

  IMAGE_TYPES = [ 
    "image/gif",
    "image/jpeg",
    "image/png",
  ]

  VIDEO_TYPES = [
    "video/mp4",
    "video/webm",
    "video/ogg"
  ]

  def parse_trix_content(content)
    return content unless content.body.present?

    content.body.fragment.source.elements.children.each_with_index do |element, index|
      next unless element.name == "action-text-attachment"

      attributes = element.attribute_nodes.map(&:value)

      if attributes.any? { |attr| IMAGE_TYPES.include?(attr) }
        src = element.attribute_nodes.filter { |attr| attr.name == "url" }[0]        
        image_tag = Nokogiri::HTML("<img class='m-2 d-block' src='#{src}' />").search("img")
        content.body.fragment.source.elements.children[index].replace(image_tag)

      elsif attributes.any? { |attr| VIDEO_TYPES.include?(attr) }
        src = element.attribute_nodes.filter { |attr| attr.name == "url" }[0]
        fragment = Nokogiri::HTML5("<div class='toVideoTag text-center p-3' src='#{src}'>
                                        <span class='spinner-border spinner-border-sm' role='status'></span>
                                        Loading video...
                                    </div>")
        content.body.fragment.source.elements.children[index].replace(fragment.search('div'))

      end
    end
    
    content
  end
end