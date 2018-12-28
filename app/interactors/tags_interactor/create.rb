module TagsInteractor
  class Create
    include Interactor

    def call
      tags = context.tags
      quotation = context.quotation
      Tag.transaction do
        tags.each do |tag|
          context.quotation.tags << Tag.find_or_create_by(name: tag&.strip)
        end
      end

      context.tags = quotation.tags
    end
  end
end
