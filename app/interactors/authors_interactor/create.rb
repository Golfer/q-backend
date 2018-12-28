module AuthorsInteractor
  class Create
    include Interactor

    def call
      full_name = context.author[:full_name]&.strip
      img_link = context.author[:img_link]&.strip
      link_at_origin_resource = context.author[:link]&.strip
      context.author = Author.find_or_create_by(
        full_name: full_name,
        img_link: img_link,
        link_at_origin_resource: link_at_origin_resource
      )
    end
  end
end
