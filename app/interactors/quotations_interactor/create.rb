module QuotationsInteractor
  class Create
    include Interactor

    def call
      quotation_body = context.quotation_body.delete!('“”')&.strip
      author = context.author
      context.quotation = Quotation.find_or_create_by({ body: quotation_body, author: author }.merge(context.params))
    end
  end
end
